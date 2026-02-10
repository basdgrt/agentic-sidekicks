#!/bin/bash
################################################################################
# Ralph Wiggum Loop Runner
################################################################################
#
# PURPOSE:
#   Run an AI coding agent (Claude Code or OpenCode) in an iterative loop.
#   Each iteration gets fresh context - no accumulated confusion.
#
# USAGE:
#   ./ralph.sh [OPTIONS]
#
# OPTIONS:
#   --tool <claude|opencode>   Which AI tool to use (default: auto-detect)
#   --prompt <file>            Path to prompt file (default: ./PROMPT.md)
#   --max <n>                  Maximum iterations (default: 30)
#   --stop <signal>            Stop signal phrase (default: "DONE - STOP RALPH")
#   --model <model>            Model to use (OpenCode only, optional)
#   --help                     Show this help message
#
# EXAMPLES:
#   ./ralph.sh
#   ./ralph.sh --tool claude --prompt tasks.md --max 20
#   ./ralph.sh --tool opencode --model "github-copilot/claude-sonnet-4"
#
# HOW IT WORKS:
#   1. Each iteration reads the prompt file and feeds it to the AI agent
#   2. The agent performs one unit of work, commits, and exits
#   3. The script checks output for the stop signal
#   4. If found: done. If not: next iteration with fresh context.
#
# IMPORTANT:
#   - Claude Code: uses --dangerously-skip-permissions for autonomous operation
#   - OpenCode: ensure auto-approve is configured in your opencode settings
#   - Always run on a feature branch, never directly on main
#
# PHILOSOPHY:
#   - Be ON the loop, not IN the loop
#   - Fresh context per iteration (no context bloat)
#   - One task per iteration (focused and reliable)
#   - Failures are data (deterministically bad is informative)
#   - Persistence wins (the loop handles retry logic)
#
# CREDITS:
#   Technique coined by Geoffrey Huntley (https://ghuntley.com/ralph/)
#
################################################################################

set -euo pipefail

################################################################################
# Configuration & Defaults
################################################################################

TOOL=""
PROMPT_FILE="./PROMPT.md"
MAX_ITERATIONS=30
STOP_SIGNAL="DONE - STOP RALPH"
MODEL=""

# Colors for terminal output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m' # No Color

################################################################################
# Functions
################################################################################

usage() {
    cat <<EOF
${BOLD}Ralph Wiggum Loop Runner${NC}

Run an AI coding agent in an iterative loop with fresh context per iteration.

${BOLD}Usage:${NC}
  $(basename "$0") [OPTIONS]

${BOLD}Options:${NC}
  --tool <claude|opencode>   Which AI tool to use (default: auto-detect)
  --prompt <file>            Path to prompt file (default: ./PROMPT.md)
  --max <n>                  Maximum iterations (default: 30)
  --stop <signal>            Stop signal phrase (default: "DONE - STOP RALPH")
  --model <model>            Model to use (OpenCode only)
  --help                     Show this help message

${BOLD}Examples:${NC}
  $(basename "$0")
  $(basename "$0") --tool claude --prompt tasks.md --max 20
  $(basename "$0") --tool opencode --model "github-copilot/claude-sonnet-4"

${BOLD}Quick Start:${NC}
  1. Copy a template:  cp examples/feature-implementation.md ./PROMPT.md
  2. Edit the tasks:   vim PROMPT.md
  3. Run the loop:     ./ralph.sh
EOF
    exit 0
}

log_info()      { echo -e "${BLUE}[ralph]${NC} $1"; }
log_success()   { echo -e "${GREEN}[ralph]${NC} $1"; }
log_warn()      { echo -e "${YELLOW}[ralph]${NC} $1"; }
log_error()     { echo -e "${RED}[ralph]${NC} $1"; }

log_iteration() {
    local i=$1
    local max=$2
    echo ""
    echo -e "${CYAN}================================================================${NC}"
    echo -e "${CYAN}  RALPH WIGGUM - ITERATION ${BOLD}$i${NC}${CYAN} of $max${NC}"
    echo -e "${CYAN}================================================================${NC}"
    echo ""
}

detect_tool() {
    if command -v claude &>/dev/null; then
        echo "claude"
    elif command -v opencode &>/dev/null; then
        echo "opencode"
    else
        echo ""
    fi
}

validate_setup() {
    # Check prompt file exists
    if [[ ! -f "$PROMPT_FILE" ]]; then
        log_error "Prompt file not found: $PROMPT_FILE"
        echo ""
        log_info "Create a prompt file or specify one with --prompt <file>"
        log_info "Quick start:"
        log_info "  cp ralph-wiggum/examples/feature-implementation.md ./PROMPT.md"
        log_info "  # Edit PROMPT.md with your tasks"
        log_info "  ralph-wiggum/ralph.sh"
        exit 1
    fi

    # Check tool is available
    if [[ -z "$TOOL" ]]; then
        TOOL=$(detect_tool)
        if [[ -z "$TOOL" ]]; then
            log_error "Neither 'claude' nor 'opencode' found in PATH."
            log_info "Install Claude Code: npm install -g @anthropic-ai/claude-code"
            log_info "Or install OpenCode:  see https://opencode.ai"
            exit 1
        fi
        log_info "Auto-detected tool: ${BOLD}$TOOL${NC}"
    else
        if ! command -v "$TOOL" &>/dev/null; then
            log_error "Tool '$TOOL' not found in PATH."
            exit 1
        fi
    fi

    # Check we're in a git repo
    if ! git rev-parse --is-inside-work-tree &>/dev/null; then
        log_warn "Not inside a git repository. Commits within the loop will fail."
        log_warn "Consider running: git init"
    fi

    # Warn if on main/master
    local branch
    branch=$(git symbolic-ref --short HEAD 2>/dev/null || echo "unknown")
    if [[ "$branch" == "main" || "$branch" == "master" ]]; then
        log_warn "You are on the '${BOLD}$branch${NC}${YELLOW}' branch."
        log_warn "It's strongly recommended to run Ralph loops on a feature branch."
        echo -n -e "${YELLOW}[ralph]${NC} Continue on '$branch' anyway? (y/N) "
        read -r confirm
        if [[ "$confirm" != "y" && "$confirm" != "Y" ]]; then
            log_info "Aborted. Create a feature branch first:"
            log_info "  git checkout -b feature/ralph-task"
            exit 0
        fi
    fi
}

run_claude() {
    local prompt_content
    prompt_content=$(cat "$PROMPT_FILE")
    claude --dangerously-skip-permissions -p "$prompt_content" 2>&1
}

run_opencode() {
    if [[ -n "$MODEL" ]]; then
        opencode run -m "$MODEL" "read and perform @${PROMPT_FILE}" 2>&1
    else
        opencode run "read and perform @${PROMPT_FILE}" 2>&1
    fi
}

run_iteration() {
    case "$TOOL" in
        claude)
            run_claude
            ;;
        opencode)
            run_opencode
            ;;
        *)
            log_error "Unknown tool: $TOOL"
            exit 1
            ;;
    esac
}

################################################################################
# Signal Handling (graceful Ctrl+C)
################################################################################

CURRENT_ITERATION=0

cleanup() {
    echo ""
    log_warn "Interrupted by user (Ctrl+C)."
    if [[ $CURRENT_ITERATION -gt 0 ]]; then
        log_info "Completed $((CURRENT_ITERATION - 1)) full iteration(s)."
        log_info "Check 'git log' to see progress made so far."
    fi
    exit 130
}

trap cleanup INT TERM

################################################################################
# Parse Arguments
################################################################################

while [[ $# -gt 0 ]]; do
    case "$1" in
        --tool)
            TOOL="$2"
            shift 2
            ;;
        --prompt)
            PROMPT_FILE="$2"
            shift 2
            ;;
        --max)
            MAX_ITERATIONS="$2"
            shift 2
            ;;
        --stop)
            STOP_SIGNAL="$2"
            shift 2
            ;;
        --model)
            MODEL="$2"
            shift 2
            ;;
        --help|-h)
            usage
            ;;
        *)
            log_error "Unknown option: $1"
            log_info "Use --help for usage information."
            exit 1
            ;;
    esac
done

################################################################################
# Main
################################################################################

echo ""
echo -e "${CYAN}${BOLD}  Ralph Wiggum Loop Runner${NC}"
echo -e "${CYAN}  ========================${NC}"
echo ""
log_info "Tool:           ${BOLD}${TOOL:-auto-detect}${NC}"
log_info "Prompt:         ${BOLD}$PROMPT_FILE${NC}"
log_info "Max iterations: ${BOLD}$MAX_ITERATIONS${NC}"
log_info "Stop signal:    ${BOLD}\"$STOP_SIGNAL\"${NC}"
if [[ -n "$MODEL" ]]; then
    log_info "Model:          ${BOLD}$MODEL${NC}"
fi
echo ""

validate_setup

echo ""
log_info "Starting loop with '${BOLD}$TOOL${NC}'..."
log_info "Press Ctrl+C to stop at any time."
echo ""

for ((i = 1; i <= MAX_ITERATIONS; i++)); do
    CURRENT_ITERATION=$i
    log_iteration "$i" "$MAX_ITERATIONS"

    # Run the agent and capture output (also stream to stderr for live viewing)
    output=$(run_iteration | tee /dev/stderr) || true

    # Check last 30 lines for the stop signal
    if echo "$output" | tail -30 | grep -qF "$STOP_SIGNAL"; then
        echo ""
        log_success "========================================"
        log_success "  Stop signal detected!"
        log_success "  Completed after $i iteration(s)."
        log_success "========================================"
        echo ""
        log_info "Review the results: git log --oneline"
        exit 0
    fi

    log_info "Iteration $i done. No stop signal. Continuing to next iteration..."
done

echo ""
log_warn "========================================"
log_warn "  Reached maximum iterations ($MAX_ITERATIONS)."
log_warn "========================================"
echo ""
log_warn "The task may not be fully complete. Next steps:"
log_warn "  - Check progress:     git log --oneline"
log_warn "  - Increase limit:     ./ralph.sh --max $((MAX_ITERATIONS + 20))"
log_warn "  - Review the prompt:  cat $PROMPT_FILE"
exit 1

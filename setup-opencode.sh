#!/bin/bash
################################################################################
# OpenCode Agentic Sidekicks Setup Script
################################################################################
#
# PURPOSE:
#   This script installs custom agents and skills for OpenCode by creating
#   symbolic links (symlinks) from this repository to OpenCode's configuration
#   directory.
#
# WHAT THIS SCRIPT DOES:
#   1. Validates that you're in the correct directory (agentic-sidekicks)
#   2. Checks that required directories (agents/, skills/) exist
#   3. Creates the OpenCode configuration directory if needed
#   4. Creates symbolic links so OpenCode can access your custom content:
#      - Links agents/ → ~/.config/opencode/agents/agentic-sidekicks
#      - Links skills/ → ~/.config/opencode/skills/agentic-sidekicks
#   5. Verifies the symlinks were created correctly
#
# WHY SYMLINKS?
#   Symlinks allow OpenCode to access your agents/skills directly from this
#   repository. Any changes you make here are immediately available in OpenCode
#   without needing to copy files or run this script again.
#
################################################################################

# Strict error handling
# -e: Exit immediately if any command fails
# -u: Treat unset variables as errors
# -o pipefail: Catch errors in pipes (e.g., cmd1 | cmd2)
set -euo pipefail

################################################################################
# Configuration
################################################################################

# Where OpenCode looks for custom agents and skills
CONF_DIR="$HOME/.config/opencode"

# The root directory of this repository
REPO_DIR="$(pwd)"

# Required source directories in this repo
AGENTS_DIR="$REPO_DIR/agents"
SKILLS_DIR="$REPO_DIR/skills"

# Target symlink paths in OpenCode's config
AGENTS_LINK="$CONF_DIR/agents/agentic-sidekicks"
SKILLS_LINK="$CONF_DIR/skills/agentic-sidekicks"

################################################################################
# Logging Functions
################################################################################

# Color codes for terminal output
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
BOLD='\033[1m'
NC='\033[0m' # No Color / Reset

# Log an informational message (blue)
log_info() {
    echo -e "${BLUE}ℹ${NC} $*"
}

# Log a success message (green)
log_success() {
    echo -e "${GREEN}✓${NC} $*"
}

# Log an error message (red) and exit
log_error() {
    echo -e "${RED}✗ ERROR:${NC} $*" >&2
    exit 1
}

# Log a warning message (yellow)
log_warning() {
    echo -e "${YELLOW}⚠${NC} $*"
}

# Log a section header
log_header() {
    echo ""
    echo -e "${CYAN}${BOLD}▸ $*${NC}"
}

################################################################################
# Validation Functions
################################################################################

# Check if a directory exists and is readable
validate_directory() {
    local dir="$1"
    local description="$2"
    
    if [[ ! -d "$dir" ]]; then
        log_error "$description not found: $dir
       ${BOLD}Solution:${NC} Ensure you're running this script from the agentic-sidekicks repository root."
    fi
    
    if [[ ! -r "$dir" ]]; then
        log_error "$description exists but is not readable: $dir
       ${BOLD}Solution:${NC} Check directory permissions with: ls -ld '$dir'"
    fi
    
    log_success "$description found: $dir"
}

# Ensure a parent directory exists and is writable
ensure_parent_directory() {
    local parent_dir="$1"
    local description="$2"
    
    if [[ ! -d "$parent_dir" ]]; then
        log_info "Creating $description: $parent_dir"
        if ! mkdir -p "$parent_dir" 2>/dev/null; then
            log_error "Failed to create $description: $parent_dir
       ${BOLD}Solution:${NC} Check permissions with: ls -ld '$(dirname "$parent_dir")'"
        fi
        log_success "$description created"
    else
        log_success "$description exists: $parent_dir"
    fi
    
    # Verify the directory is writable
    if [[ ! -w "$parent_dir" ]]; then
        log_error "$description is not writable: $parent_dir
       ${BOLD}Solution:${NC} Fix permissions with: chmod u+w '$parent_dir'"
    fi
}

# Create a symbolic link with error handling
create_symlink() {
    local source="$1"
    local target="$2"
    local description="$3"
    
    log_info "Creating symlink: $description"
    log_info "  Source: $source"
    log_info "  Target: $target"
    
    # Check if target already exists
    if [[ -L "$target" ]]; then
        local current_target
        current_target=$(readlink "$target")
        if [[ "$current_target" == "$source" ]]; then
            log_warning "Symlink already exists and points to correct location"
            return 0
        else
            log_warning "Symlink exists but points to: $current_target"
            log_info "Replacing with new symlink..."
        fi
    elif [[ -e "$target" ]]; then
        log_warning "Target exists but is not a symlink (type: $(stat -f '%HT' "$target" 2>/dev/null || echo 'unknown'))"
        log_info "Replacing with symlink..."
    fi
    
    # Create the symlink (-s = symbolic, -f = force/overwrite, -n = no-dereference)
    if ! ln -sfn "$source" "$target" 2>/dev/null; then
        log_error "Failed to create symlink
       ${BOLD}Solution:${NC} Check permissions for: $(dirname "$target")"
    fi
    
    log_success "Symlink created successfully"
}

# Verify a symlink exists and points to the correct location
verify_symlink() {
    local target="$1"
    local expected_source="$2"
    local description="$3"
    
    # Check if symlink exists
    if [[ ! -L "$target" ]]; then
        log_error "Verification failed: Symlink does not exist: $target"
    fi
    
    # Check if symlink points to correct location
    local actual_source
    actual_source=$(readlink "$target")
    if [[ "$actual_source" != "$expected_source" ]]; then
        log_error "Verification failed: Symlink points to wrong location
       Expected: $expected_source
       Actual:   $actual_source"
    fi
    
    # Check if target is accessible
    if [[ ! -e "$target" ]]; then
        log_error "Verification failed: Symlink exists but target is not accessible
       This usually means the source directory was moved or deleted."
    fi
    
    log_success "Verified: $description → $expected_source"
}

################################################################################
# Main Script
################################################################################

main() {
    # Print script header
    echo ""
    echo -e "${BOLD}═══════════════════════════════════════════════════════════════${NC}"
    echo -e "${BOLD}  OpenCode Agentic Sidekicks Setup${NC}"
    echo -e "${BOLD}═══════════════════════════════════════════════════════════════${NC}"
    echo ""
    
    # STEP 1: Validate prerequisites
    log_header "Step 1: Validating Prerequisites"
    
    log_info "Checking repository structure..."
    validate_directory "$AGENTS_DIR" "Agents directory"
    validate_directory "$SKILLS_DIR" "Skills directory"
    
    log_info "Checking OpenCode configuration directory..."
    ensure_parent_directory "$CONF_DIR" "OpenCode config directory"
    ensure_parent_directory "$CONF_DIR/agents" "Agents parent directory"
    ensure_parent_directory "$CONF_DIR/skills" "Skills parent directory"
    
    # STEP 2: Create symbolic links
    log_header "Step 2: Creating Symbolic Links"
    
    echo ""
    log_info "Setting up agents..."
    create_symlink "$AGENTS_DIR" "$AGENTS_LINK" "Agents symlink"
    
    echo ""
    log_info "Setting up skills..."
    create_symlink "$SKILLS_DIR" "$SKILLS_LINK" "Skills symlink"
    
    # STEP 3: Verify installation
    log_header "Step 3: Verifying Installation"
    
    echo ""
    verify_symlink "$AGENTS_LINK" "$AGENTS_DIR" "Agents symlink"
    verify_symlink "$SKILLS_LINK" "$SKILLS_DIR" "Skills symlink"
    
    # STEP 4: Success summary
    log_header "Installation Complete!"
    
    echo ""
    log_success "All symlinks created and verified successfully"
    echo ""
    echo -e "${BOLD}Installation Summary:${NC}"
    echo "  • Agents available at: $AGENTS_LINK"
    echo "  • Skills available at: $SKILLS_LINK"
    echo ""
    echo -e "${BOLD}Next Steps:${NC}"
    echo "  1. Restart OpenCode if it's currently running"
    echo "  2. Your custom agents and skills are now available in OpenCode"
    echo "  3. Any changes you make in this repository will be immediately available"
    echo ""
    echo -e "${GREEN}${BOLD}✓ Setup completed successfully!${NC}"
    echo ""
}

# Trap errors and provide helpful message
trap 'echo -e "\n${RED}✗ Script failed at line $LINENO${NC}\nCheck the error message above for details." >&2' ERR

# Run main function
main "$@"

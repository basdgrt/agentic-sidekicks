# Agentic Sidekicks

A curated collection of agents, skills, and tools for AI coding assistants ([Claude Code](https://docs.anthropic.com/en/docs/claude-code) and [OpenCode](https://opencode.ai)).

## What's Inside

### Skills

Reusable prompt modules that extend AI assistants with specialized knowledge and workflows. Each skill lives in `skills/` and is self-documenting via its `SKILL.md` file.

| Skill | Description |
|---|---|
| **brainstorming** | Collaborative ideation — asks questions, proposes approaches with trade-offs, validates incrementally |
| **canvas-design** | Creates visual art (PNG/PDF) with bundled fonts and a design-philosophy-first approach |
| **dispatching-parallel-agents** | Pattern for splitting work across multiple concurrent AI agents |
| **doc-coauthoring** | Structured 3-stage document co-authoring workflow (gather context, refine, reader-test) |
| **frontend-design** | Distinctive, production-grade frontend interfaces that avoid generic AI aesthetics |
| **linkedin-content** | Technical LinkedIn post creation through a Create, Refine, Review workflow |
| **request-code-review** | Dispatches a code-reviewer subagent after completing work |
| **sentence-craft** | Sentence-level writing review with scoring and rewrite options |
| **skill-creator** | Meta-skill for creating new skills, with scaffolding and validation scripts |

### Agents

| Agent | Description |
|---|---|
| **code-reviewer** | Read-only subagent that reviews code against a plan, categorizing issues by severity |

### Ralph Wiggum

An autonomous loop runner that drives AI coding agents (Claude Code or OpenCode) through iterative development cycles. Each iteration gets fresh context, performs one unit of work, commits, and exits. The philosophy: *be ON the loop, not IN the loop*.

Includes ready-to-use prompt templates for feature implementation, batch refactoring, and TDD loops.

## Getting Started

### OpenCode

```bash
./setup-opencode.sh
```

This symlinks the `agents/` and `skills/` directories into `~/.config/opencode/`, so changes in the repo are available immediately.

### Ralph Wiggum

```bash
# Copy a prompt template into your project
cp ralph-wiggum/examples/feature-implementation.md ./PROMPT.md

# Edit the task list, then run
ralph-wiggum/ralph.sh
ralph-wiggum/ralph.sh --tool claude --max 20
ralph-wiggum/ralph.sh --tool opencode --model "github-copilot/claude-sonnet-4"
```

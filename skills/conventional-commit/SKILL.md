---
name: conventional-commit
description: Create conventional commits and push changes to the currently active branch. Use when the user asks to commit changes, commit and push, create a commit, stage and commit, or push code. Follows the Conventional Commits 1.0.0 specification (https://www.conventionalcommits.org) for structured, semantic commit messages. Automatically stages unstaged changes, constructs the commit message, commits, and pushes to the active remote branch.
---

# Conventional Commit

## Workflow

1. Gather context (run in parallel):
   - `git status` to see staged, unstaged, and untracked files
   - `git diff` and `git diff --cached` to see actual changes
   - `git log --oneline -5` to see recent commit style for scope conventions
   - `git branch --show-current` to confirm the active branch

2. Stage changes:
   - If nothing is staged, stage all changes: `git add -A`
   - If some files are already staged, ask the user whether to include unstaged/untracked files too
   - NEVER stage files that likely contain secrets (`.env`, `credentials.json`, `*secret*`, `*.pem`, `*.key`). Warn the user if these are present.

3. Classify changes and compose the commit message:
   - Analyze the diff to determine the correct type. See [references/spec.md](references/spec.md) for the full type list and format rules.
   - Select ONE primary type. If changes span multiple types, prefer the most significant change. If truly unrelated, suggest the user split into multiple commits.
   - Determine scope from the area of the codebase affected (optional but preferred when clear).
   - Write a concise description in imperative mood, lowercase, no period. Max 72 chars for the first line.
   - Add a body only when the "why" isn't obvious from the description.
   - Add `BREAKING CHANGE:` footer or `!` suffix when applicable.

4. Commit and push:
   ```
   git commit -m "<message>"
   git push
   ```
   - If the branch has no upstream, use `git push -u origin <branch>`.
   - If push is rejected (behind remote), run `git pull --rebase` then push again.

5. Confirm to the user: show the commit hash, message, and branch pushed to.

## Type Selection Guide

Analyze the diff content to pick the right type:

| Signal in diff | Type |
|---|---|
| New files, new exports, new routes, new UI components | `feat` |
| Changed logic that fixes incorrect behavior | `fix` |
| Only `.md`, comments, or docstrings changed | `docs` |
| Whitespace, formatting, linting fixes (no logic change) | `style` |
| Restructured code, renamed variables, moved files (same behavior) | `refactor` |
| Optimized algorithms, caching, reduced allocations | `perf` |
| Test files added/modified, no production code changed | `test` |
| `package.json` deps, `Dockerfile`, `Makefile`, build configs | `build` |
| `.github/workflows/`, CI configs, deploy scripts | `ci` |
| Updating deps, tooling config, non-src non-test maintenance | `chore` |

## Commit Message Examples

```
feat(auth): add OAuth2 login flow
```

```
fix(api): handle null response from payment gateway
```

```
refactor: extract validation into shared utils module
```

```
feat!: migrate to v2 API format

BREAKING CHANGE: response envelope structure changed from
{ data, error } to { result, errors[] }.

Refs: #234
```

## Edge Cases

- **Empty diff after staging**: Abort and inform the user there are nothing to commit.
- **Merge conflicts present**: Do NOT commit. Inform the user to resolve conflicts first.
- **Detached HEAD**: Warn the user and do NOT push. Suggest creating a branch first.
- **Protected branch (push rejected)**: Report the error and suggest creating a feature branch.

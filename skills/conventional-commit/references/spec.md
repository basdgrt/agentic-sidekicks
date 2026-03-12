# Conventional Commits 1.0.0 Specification

Source: https://www.conventionalcommits.org/en/v1.0.0/

## Message Format

```
<type>[optional scope]: <description>

[optional body]

[optional footer(s)]
```

## Types

| Type | When to use |
|------|-------------|
| `feat` | New feature (correlates with MINOR in SemVer) |
| `fix` | Bug fix (correlates with PATCH in SemVer) |
| `docs` | Documentation only changes |
| `style` | Formatting, missing semicolons, etc. (no code logic change) |
| `refactor` | Code change that neither fixes a bug nor adds a feature |
| `perf` | Performance improvement |
| `test` | Adding or correcting tests |
| `build` | Changes to build system or external dependencies |
| `ci` | Changes to CI configuration files and scripts |
| `chore` | Other changes that don't modify src or test files |
| `revert` | Reverts a previous commit |

## Rules

1. Type MUST be a noun (`feat`, `fix`, etc.) followed by optional scope, optional `!`, and REQUIRED terminal colon and space.
2. `feat` MUST be used for new features. `fix` MUST be used for bug fixes.
3. Scope MAY be provided in parentheses after the type: `fix(parser):`.
4. Description MUST immediately follow the colon and space. It is a short summary of the changes.
5. Body MAY follow after one blank line. It is free-form and MAY consist of multiple paragraphs.
6. Footer(s) MAY follow after one blank line from the body. Each footer: `token: value` or `token #value`.
7. Footer tokens MUST use `-` in place of spaces (except `BREAKING CHANGE`).
8. Breaking changes: append `!` after type/scope OR include `BREAKING CHANGE:` footer (or both).
9. Types are NOT case-sensitive, except `BREAKING CHANGE` which MUST be uppercase.

## Examples

```
feat: add user authentication via OAuth2
```

```
fix(api): handle null response from payment gateway
```

```
feat(auth)!: migrate to JWT tokens

BREAKING CHANGE: session-based auth is no longer supported.
Migrate existing sessions using the provided script.

Refs: #456
```

```
docs: update API endpoint documentation
```

```
refactor: extract validation logic into shared module
```

```
test: add integration tests for checkout flow
```

```
chore: update dependencies to latest versions
```

```
fix: prevent race condition in concurrent requests

Introduce a request id and a reference to latest request.
Dismiss incoming responses other than from latest request.

Reviewed-by: Z
Refs: #123
```

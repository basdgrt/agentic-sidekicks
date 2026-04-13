---
name: user-stories
description: "Write clear, actionable user stories from rough drafts or feature descriptions. Use when asked to create a user story, write a Jira ticket, turn a requirement into a story, or draft acceptance criteria. Takes rough input about what needs to be done and produces a structured story with a descriptive title, contextual description, and crystal clear acceptance criteria. Output is plain text suitable for pasting into Jira."
---

# User Stories

Turn rough drafts and feature descriptions into well-structured user stories ready for Jira.

## Workflow

1. Read the user's rough draft
2. If anything is unclear or ambiguous, ask clarifying questions before proceeding. Do not guess intent.
3. Draft the story following the output format below
4. Use the sentence-craft skill to review and tighten the description and acceptance criteria
5. Present the final plain text output

## Output Format

Output plain text only. No markdown headings, bold, italic, or other formatting. The output must be copy/paste ready for Jira's WYSIWYG editor.

ALWAYS use this exact structure:

```
Title: [Descriptive title]

Description:
[2-5 sentences explaining what needs to be built and why. Provide enough context so someone unfamiliar with the conversation can understand the work.]

Acceptance criteria:
- [Criterion 1]
- [Criterion 2]
- [Criterion 3]
```

## Rules

- Never use the "As a [role], I want [feature], so that [benefit]" format.
- One story per invocation. If the input contains multiple pieces of work, ask the user which part to turn into a story.
- Titles are specific and action-oriented. Good: "Migrate captcha key from Foo to Bar". Bad: "Captcha improvements".
- Descriptions explain both what and why. The reader should understand the motivation, not just the task.
- Acceptance criteria are verifiable outcomes, not vague goals. Good: "Email is verified before 2FA is enabled". Bad: "2FA works correctly".
- Keep acceptance criteria to what is necessary. Do not pad with obvious items.

## When to Ask Clarifying Questions

Ask before writing when:
- The scope is ambiguous (could be interpreted as multiple stories)
- The motivation or business context is missing
- Technical details are insufficient to define acceptance criteria
- It is unclear what "done" looks like

Keep questions focused. Ask only what is needed to write the story.

## Examples

See `references/examples.md` for input/output examples demonstrating the expected quality and format.

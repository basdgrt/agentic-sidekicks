---
name: sentence-craft
description: "Review and improve text using principles from 'It Was the Best of Sentences, It Was the Worst of Sentences' by June Casagrande. Use when asked to review writing quality, improve weak sentences, make text more engaging, or enhance clarity, concision, word choice, and rhythm. Works with professional writing, marketing content, creative writing, and general text improvement requests. Provides quality scoring, detailed analysis, and multiple rewrite options."
---

# Sentence Craft

## Overview

This skill helps review and improve writing at the sentence level using principles from June Casagrande's "It Was the Best of Sentences, It Was the Worst of Sentences." The skill provides systematic analysis with quality scoring, identifies specific issues, and offers multiple rewrite options with explanations.

Great writing is built sentence by sentence. This skill focuses on four key areas: clarity and concision, word choice, rhythm and flow, and grammar for effect.

## How to Use This Skill

### When a User Requests Review

Follow this workflow:

1. **Load references**
   - Read `references/principles.md` for detailed principles and examples
   - Read `references/review-framework.md` for systematic process and output template

2. **Perform initial assessment**
   - Score the text on four dimensions: Clarity, Concision, Word Choice, Rhythm & Flow
   - Use 1-10 scale for each dimension
   - Calculate overall quality score (average of four dimensions)
   - Assign assessment category (Excellent/Good/Fair/Needs Significant Revision)
   - Write 2-3 sentence summary of strengths and opportunities

3. **Analyze systematically**
   - Review each sentence using the checklist from review-framework.md
   - Identify specific issues and categorize them by problem type
   - Note locations of problematic sentences
   - Optionally identify particularly strong sentences

4. **Generate structured output**
   - Use the exact template format from review-framework.md
   - For each issue, provide:
     - Location and problem description
     - Original sentence
     - 2-3 distinct rewrite options
     - Specific explanation of what each option improves
     - Which principle from principles.md it applies
   - Include "Strengths Worth Noting" section if applicable

### Review Focus Areas

The skill evaluates text across four dimensions:

**Clarity & Concision**
- Eliminate sentence killers (conjunction chains, filler words)
- Remove weak verb + noun constructions
- Cut unnecessary words and redundancies
- Front-load subjects and verbs

**Word Choice**
- Replace vague words with precise alternatives
- Use strong, vivid verbs instead of weak, generic ones
- Match formality level to audience
- Avoid clichés and jargon overuse

**Rhythm & Flow**
- Vary sentence length (short, medium, long)
- Create natural cadence
- Use punctuation strategically for pacing
- Ensure writing sounds natural when read aloud

**Grammar for Effect**
- Use fragments strategically for emphasis
- Choose active vs. passive voice appropriately
- Deploy punctuation (em-dashes, semicolons, colons) for impact
- Break grammatical rules when it serves the writing

See `references/principles.md` for comprehensive guidance and before/after examples on each area.

### Output Requirements

Every review must include:

1. **Quality Scores** (1-10 scale)
   - Clarity score
   - Concision score
   - Word Choice score
   - Rhythm & Flow score
   - Overall score (average, rounded to one decimal)
   - Assessment category

2. **Summary** (2-3 sentences)
   - Acknowledge strengths
   - Identify primary areas for improvement
   - Set expectations for detailed analysis

3. **Issue-by-Issue Analysis**
   - Number of issues found
   - For each issue:
     - Location identifier
     - Problem description with specific principle
     - Original sentence (quoted exactly)
     - 2-3 rewrite options labeled A, B, C
     - Explanation of what each option improves (be specific, quantify when possible)
     - Principle applied for each option

4. **Multiple Rewrite Options**
   - Option A (Recommended): Most straightforward improvement
   - Option B: Alternative approach or different emphasis
   - Option C: Creative or context-specific alternative (when warranted)
   - Each option must be distinctly different and useful

5. **Strengths Worth Noting** (optional)
   - Include if text contains exemplary sentences
   - Quote 1-2 strong sentences with explanation of why they work

Use the exact output template provided in `references/review-framework.md`.

## When to Load References

**Always load both reference files when performing a review:**

- **principles.md** (required): Provides detailed principles, examples, and before/after comparisons for all four focus areas. Essential for identifying issues and crafting improvements.

- **review-framework.md** (required): Provides the scoring rubric, systematic analysis checklist, output template, and common problem catalog with multiple rewrite examples.

Both files contain essential information for conducting thorough, helpful reviews.

## Key Principles

**Sentence as fundamental unit:** Great writing is built sentence by sentence. Master the sentence, and the writing improves dramatically.

**Multiple options, not prescriptions:** Offer 2-3 rewrite choices with different approaches or emphases. Let the writer choose based on their preference and context.

**Explain the "why":** Help users understand what makes each improvement better. Be specific about what changed and why it's an improvement.

**Quantify improvements:** When possible, note word count reductions, clarity gains, or specific structural changes ("cuts from 18 to 12 words," "replaces weak verb with strong verb").

**Balance rules with context:** Consider audience, purpose, and style. What works for marketing may not work for academic writing.

**Reference specific principles:** Connect each improvement to principles from principles.md (e.g., "Concision: Weak verb elimination" or "Rhythm: Sentence length variation").

**Be constructive:** Frame issues as opportunities for improvement. Acknowledge strengths before diving into problems.

## Example Review Requests

This skill works well for requests like:

- "Review this text and improve weak sentences"
- "Help me rewrite this section to be more engaging"
- "Analyze this paragraph for sentence quality"
- "Make this email more professional and concise"
- "Improve the rhythm and flow of this marketing copy"
- "Review this blog post and suggest improvements"
- "Help me tighten up this draft"

The skill provides objective quality assessment combined with actionable, specific improvements.

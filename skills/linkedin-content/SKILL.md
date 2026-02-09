---
name: linkedin-content
description: "Create technical LinkedIn content that demonstrates hands-on expertise to attract senior engineers and technical leaders. Use when asked to write, draft, or create LinkedIn posts about technical topics, engineering practices, tools, architecture decisions, or professional experiences. Follows a 3-step process: Create → Refine → Review. Designed for content that builds personal brand through demonstrated competence, not marketing or thought leadership."
---

# LinkedIn Content Creation

## Overview

This skill helps create technical LinkedIn content that demonstrates credible, hands-on technical leadership. The content targets senior engineers, tech leads, architects, and CTOs with a technical background.

The goal: prove competence through experience-backed, opinionated technical content. Not employer branding. Not motivational content. Proof of competence.

## Content Principles

Every post should meet at least three of these criteria:

1. **Based on real production experience** - Specific systems, actual problems, concrete outcomes
2. **Clearly opinionated** - Take a stance, not neutrality
3. **Concrete examples and trade-offs** - Show the constraints and second-order effects
4. **Short enough to read in one scroll** - LinkedIn scanning behavior
5. **Written in precise, technical language** - For peers, not beginners

**Avoid**:
- Motivational or inspirational content
- Generic advice without specifics
- Thought leadership without scars
- Em dashes (use periods or break into separate sentences)

## The North Star Question

Before finishing any post, answer this question:

> "Would a strong senior engineer want to work with me after reading this?"

If the answer is unclear, the post needs revision.

## Three-Step Workflow

Follow this process for every LinkedIn post:

### Step 1: Create

Generate the first draft based on the topic provided by the user.

**Process**:

1. **Identify the core idea**
   - What is the one technical insight, practice, or experience to share?
   - What stance or opinion does this demonstrate?
   - Why does this matter to senior engineers?

2. **Structure the post**
   - **Opening**: Hook with surprising fact, bold statement, or concrete problem
   - **Context**: Explain constraints, trade-offs, or why this matters
   - **Insight**: Share the experience-backed observation or practice
   - **Takeaway**: Key points with 🔴 bullets (2-4 points)
   - **Closing**: Natural ending or thought-provoking question (not forced CTA)

3. **Apply tone guidelines**
   - **Creator archetype**: Practical, hands-on, grounded in building and shipping
   - **Sage archetype**: Calm authority, reflective, focused on insight and judgment
   - Confident but humble. No hype. No arrogance.
   - Written for peers, not beginners

4. **Check content principles**
   - Based on real experience? (Specific system, actual constraint, real outcome)
   - Clear stance? (Opinion stated, not hedged)
   - Concrete details? (Numbers, names, specific tools/practices)
   - One core idea? (No tangents or multiple points)

5. **Format for LinkedIn**
   - Short paragraphs (1-3 sentences max)
   - Use 🔴 for bullet points in takeaway section
   - No em dashes
   - White space for scanning

**Output**: First draft ready for refinement

See `references/examples.md` for detailed analysis of strong posts.

### Step 2: Refine

Improve the draft by strengthening sentences, removing weak constructions, and sharpening the message.

**Process**:

1. **Run sentence-craft review**
   - Use the sentence-craft skill to identify weak sentences
   - Focus on: weak verb constructions, filler words, hedging language, unclear subjects

2. **Apply high-impact improvements**
   - Eliminate weak verb + noun constructions ("make a decision" → "decide")
   - Remove hedging that weakens authority ("might want to consider" → "use")
   - Strengthen word choice for precision and confidence
   - Cut unnecessary words

3. **Preserve LinkedIn requirements**
   - Keep short paragraphs (break long sentences if needed)
   - Reject em dash suggestions from sentence-craft (use periods or commas)
   - Maintain technical precision (don't simplify for general audience)
   - Keep conversational, peer-to-peer tone

4. **Check refinement criteria**
   - Is the stance clearer and sharper?
   - Are vague statements now concrete?
   - Is every word earning its place?
   - Does it maintain authentic voice (not over-polished)?

**Output**: Refined draft ready for quality review

See `references/sentence-craft-integration.md` for detailed guidance on applying sentence-craft improvements to LinkedIn content.

### Step 3: Review

Evaluate the post against quality criteria and verify it meets the standard.

**Quality Criteria**:

1. **Stance and opinion**
   - Is the stance clear and opinionated?
   - Does it take a position, not just describe?
   - Example: "Cooperative multitasking is about not blocking on IO" (clear stance)
   - Counter-example: "There are different approaches to concurrency" (no stance)

2. **Experience basis**
   - Is it clearly based on real experience?
   - Are there specific details (system names, actual constraints, real outcomes)?
   - Example: "We added a rule to our coding guidelines called 'Expert in the Lead'"
   - Counter-example: "Teams should think about code quality"

3. **Generic advice check**
   - Does it avoid generic advice and buzzwords?
   - Is every statement grounded in specifics?
   - Example: "Agents love the happy path. Null handling, retries, timeouts, race conditions. These sometimes get skipped."
   - Counter-example: "Use best practices when working with AI tools"

4. **Target audience**
   - Is it written for senior engineers and technical leaders?
   - Does it assume technical context (not explaining basics)?
   - Peer-to-peer tone maintained?

5. **Single core idea**
   - Is there exactly one core idea?
   - No tangents or multiple disconnected points?
   - Everything supports the central insight?

6. **Tone archetype check**
   - Creator: Practical, hands-on, grounded in building? ✓
   - Sage: Thoughtful, calm authority, insight-driven? ✓
   - No hype, arrogance, or motivational language? ✓

7. **LinkedIn formatting**
   - Short paragraphs (1-3 sentences)?
   - 🔴 bullets for key takeaways?
   - No em dashes?
   - Scannable white space?

**Review Process**:

1. Check each criterion above
2. For any criterion not met:
   - Explain what is missing or weak
   - Provide specific fix
   - Apply fix and re-check
3. When all criteria met:
   - Run the North Star question: "Would a strong senior engineer want to work with me after reading this?"
   - If yes: Confirm post is ready to publish
   - If unclear: Identify the gap and refine

**Output**: Final post ready to publish, with confirmation that all criteria are met

## When to Load References

**examples.md** - Load when creating or refining content to see strong examples with detailed analysis of what makes them effective. Shows structure patterns, tone characteristics, and quality markers.

**sentence-craft-integration.md** - Load during Step 2 (Refine) to understand how to apply sentence-craft improvements while preserving LinkedIn-specific requirements and tone.

## Content Types That Work

**Technical deep dives**: Explain architectural decisions, tool choices, or engineering practices with trade-offs clearly stated. Ground in specific systems.

**Engineering practices**: Share concrete practices from real teams (with specific examples of what changed and why). Include failure modes observed.

**Tool and technology insights**: Demonstrate deep understanding through historical context, design trade-offs, or non-obvious implications. Show why, not just how.

**Professional experiences**: Milestones framed through principles and technical positioning. What matters to the engineering culture being built.

**Consultancy scars**: Lessons from production failures, scaling challenges, or organizational patterns. Specific constraints and outcomes.

## Example Workflow

**User**: "Write a LinkedIn post about why we added pre-commit hooks to enforce code quality"

**Step 1: Create**
- Core idea: Pre-commit hooks catch issues that code review misses
- Stance: Automated checks are faster and more consistent than manual review
- Structure: Problem (manual review gaps) → Solution (pre-commit hooks) → Specific checks → Impact
- Draft created with experience details, concrete examples, peer-to-peer tone

**Step 2: Refine**
- Load sentence-craft skill
- Identify weak constructions: "making it possible to catch" → "catches"
- Remove hedging: "might help" → "prevents"
- Strengthen: "better code quality" → "zero flake8 violations in the last 50 PRs"
- Verify: Short paragraphs ✓, No em dashes ✓, Technical precision ✓

**Step 3: Review**
- Clear stance? ✓ (Automation > manual review for consistency)
- Based on experience? ✓ (Specific checks, actual outcomes)
- Avoids generic advice? ✓ (Concrete: "zero flake8 violations in 50 PRs")
- Written for peers? ✓ (Assumes knowledge of code review and linting)
- One core idea? ✓ (Pre-commit hooks for quality)
- Correct tone? ✓ (Practical experience, calm authority)
- LinkedIn formatting? ✓ (Short paragraphs, bullets, scannable)
- North Star: Would senior engineer want to work with me? ✓ (Shows judgment, specific outcomes)
- **Ready to publish**

## Key Success Factors

**Specificity over abstraction**: "50 simultaneous chess games" beats "efficient context switching"

**Trade-offs over benefits**: "Multi-threading fits CPU-bound work, not IO-bound services" beats "Coroutines are faster"

**Experience over theory**: "We added this rule after the 3 AM page" beats "Code quality is important"

**Stance over balance**: "AI wrote it is not an excuse" beats "AI has pros and cons"

**Peers over broad audience**: Write for senior engineers who understand the context, not beginners who need explanation

The content should make a strong senior engineer think: "This person knows what they're talking about. I'd like to work with them or learn from their experience."

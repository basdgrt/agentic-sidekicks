# Tutorial Documentation

## Purpose

Tutorials are **learning-oriented** lessons that take a beginner through a series of steps to complete a project. They are designed to help newcomers get started and gain basic competence.

## Key Characteristics

- **Learning-oriented**: Focused on helping the user learn through doing
- **Concrete**: Based on a specific, achievable project with a clear outcome
- **Step-by-step**: Provides explicit instructions in a logical sequence
- **Safe**: Ensures the learner succeeds and builds confidence
- **Complete**: Gets the learner from zero to a working result

## The Tutorial's Promise

"By following this tutorial, you will learn how to [accomplish specific outcome] and understand [key concepts]."

## Structure

### 1. Introduction
- State what the learner will build/accomplish
- Explain what they will learn
- List prerequisites clearly
- Estimate time required

### 2. Setup/Preparation
- Provide all necessary setup steps
- Ensure the environment is ready
- Verify prerequisites are met

### 3. Step-by-step Instructions
- Number each step clearly
- One action per step
- Show expected outcomes after each step
- Include validation/checkpoint steps
- Use imperative mood ("Click the button", "Run the command")

### 4. Conclusion
- Recap what was accomplished
- Summarize what was learned
- Provide next steps or related tutorials

## Writing Guidelines

### Do:
- **Guide, don't explain**: Focus on getting things done, not understanding why
- **Start from zero**: Assume no prior knowledge beyond stated prerequisites
- **Provide concrete values**: Use specific examples, not placeholders (except where user must customize)
- **Show results**: Let learners see their progress after each step
- **Ensure success**: Test every step to guarantee it works
- **Keep scope minimal**: Resist adding extra features or variations
- **Be encouraging**: Use positive, supportive language

### Don't:
- **Explain concepts in depth**: Save detailed explanations for explanation docs
- **Offer choices**: Don't give options or alternatives; there's one clear path
- **Deviate from the happy path**: Avoid "you could also..." or "alternatively..."
- **Skip steps**: Include every single action, no matter how obvious
- **Introduce complexity**: Keep it simple; advanced topics come later
- **Assume knowledge**: If you haven't taught it yet in this tutorial, don't use it

## Tone and Voice

- **Encouraging and supportive**: "Great! You've just..."
- **Clear and direct**: "Click the 'Save' button"
- **Present-tense imperative**: "Run the command", "Create a file"
- **Reassuring**: "Don't worry if you see...", "This is expected"

## Example Structure

```markdown
# Getting Started with [Product/Feature]

In this tutorial, you'll build a simple [project type] that [does something specific]. 
By the end, you'll understand how to [key learning objective].

**What you'll build**: A [specific project] that [specific outcome]
**What you'll learn**: How to [skill 1], [skill 2], and [skill 3]
**Time required**: 30 minutes
**Prerequisites**: [Specific requirements]

## Before you begin

1. Install [dependency] version X.X or higher
2. Create a [account/setup]
3. Download [necessary files]

## Step 1: Set up your project

Create a new directory for your project:

```bash
mkdir my-project
cd my-project
```

You should now be in an empty directory called `my-project`.

## Step 2: [Next action]

[Continue with numbered steps...]

## What you've learned

Congratulations! You've built [project] and learned how to:
- [Skill 1]
- [Skill 2]
- [Skill 3]

## Next steps

Now that you understand the basics, you can:
- [Related tutorial] to learn more about [topic]
- Read the [explanation] to understand why [concept] works this way
- Check the [reference] for all available [options/commands]
```

## Common Pitfalls to Avoid

1. **Too much explanation**: Tutorials teach by doing, not by explaining. Keep explanations minimal.
2. **Offering choices**: Every choice is a decision point where learners can get stuck. Provide one clear path.
3. **Incomplete steps**: Missing "obvious" steps causes frustration. Include everything.
4. **Abstract examples**: Use concrete, realistic values. "Create user 'alice'" beats "Create user 'username'".
5. **Skipping validation**: Show learners how to verify each step worked correctly.
6. **Scope creep**: Resist adding "just one more feature". Keep it minimal and achievable.
7. **Assuming too much**: Every assumption is a potential barrier. State prerequisites explicitly.

## When to Use Tutorials

Use tutorials when:
- Introducing complete beginners to your product/technology
- Teaching a new workflow or methodology
- Onboarding new users or team members
- Users need to build confidence before exploring further

Don't use tutorials for:
- Solving specific problems (use how-to guides)
- Explaining concepts (use explanation)
- Documenting all features (use reference)

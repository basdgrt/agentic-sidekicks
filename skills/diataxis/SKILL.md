---
name: diataxis
description: Write and refactor technical documentation using the Diataxis framework. Use when asked to write tutorials, how-to guides, technical reference, or explanation documentation, or when asked to review/refactor existing documentation using Diataxis principles. Triggers include "write documentation", "help me write a tutorial", "review this documentation using Diataxis", "create a how-to guide", "refactor these docs", or any request involving structured technical documentation.
---

# Diataxis Documentation Framework

## Overview

Diataxis is a systematic approach to technical documentation that recognizes four distinct types of content, each serving a different user need:

1. **Tutorials** - Learning-oriented lessons that teach through hands-on practice
2. **How-to Guides** - Goal-oriented recipes for solving specific problems
3. **Reference** - Information-oriented technical descriptions of the system
4. **Explanation** - Understanding-oriented discussion of concepts and design

Each type has distinct characteristics, structure, tone, and purpose. Mixing types within a single document confuses readers and reduces effectiveness.

## Choosing the Right Documentation Type

Use this decision framework to determine which type fits the user's need:

```
What does the user want to do?

├─ Learn the basics / Get started
│  └─ TUTORIAL: Step-by-step lesson with a concrete project
│
├─ Accomplish a specific task / Solve a problem
│  └─ HOW-TO GUIDE: Direct instructions for achieving the goal
│
├─ Look up technical details / Find specifications
│  └─ REFERENCE: Complete, factual description of components
│
└─ Understand concepts / Learn "why"
   └─ EXPLANATION: Discussion of design, context, and trade-offs
```

**Quick test**: Ask yourself what the user will say after reading:
- Tutorial: "I built something and learned by doing it"
- How-to: "I accomplished my specific goal"
- Reference: "I found the technical details I needed"
- Explanation: "I understand why it works this way"

## Workflow for Reviewing Existing Documentation

When reviewing or refactoring existing documentation:

### 1. Identify the documentation type(s)

Read the document and determine:
- What type is it trying to be? (tutorial, how-to, reference, explanation)
- Does it mix multiple types inappropriately?
- Is the type appropriate for the user's likely need?

### 2. Analyze alignment with type characteristics

Read the appropriate reference guide:
- [references/tutorial.md](references/tutorial.md) for tutorials
- [references/how-to.md](references/how-to.md) for how-to guides
- [references/reference.md](references/reference.md) for technical reference
- [references/explanation.md](references/explanation.md) for explanations

Check if the document follows the guidelines for:
- Structure
- Tone and voice
- Content focus
- Level of detail

### 3. Provide specific feedback

Identify specific issues:
- **Type confusion**: "This how-to guide includes too much conceptual explanation. Move the 'Why This Approach Works' section to a separate explanation document."
- **Structure problems**: "This tutorial jumps between steps and explanations. Keep steps focused on actions; link to explanations separately."
- **Tone mismatches**: "This reference uses conversational language ('you should...'). Keep it neutral and factual."
- **Missing elements**: "This how-to is missing prerequisites and doesn't show how to verify success."

### 4. Suggest improvements

Provide concrete recommendations:
- Restructure to match the type's ideal structure
- Split mixed-type content into separate documents
- Adjust tone to match the type
- Add missing elements from the type's template

## Workflow for Writing New Documentation

When creating documentation from scratch:

### 1. Determine the documentation type

Ask the user or infer from context:
- What is the user's goal when reading this?
- What should they be able to do afterward?
- Use the decision framework above

### 2. Load the appropriate reference guide

Read the detailed guide for the chosen type:
- [references/tutorial.md](references/tutorial.md) for tutorials
- [references/how-to.md](references/how-to.md) for how-to guides
- [references/reference.md](references/reference.md) for technical reference
- [references/explanation.md](references/explanation.md) for explanations

### 3. Follow the type's structure and guidelines

Use the reference guide to:
- Structure the document appropriately
- Choose the right tone and voice
- Determine what to include and exclude
- Apply relevant examples and patterns

### 4. Review against type characteristics

Before finalizing, check:
- Does it follow the structure template?
- Is the tone consistent with the type?
- Have I avoided common pitfalls for this type?
- Does it serve the type's core purpose?

## Key Principles

### Don't Mix Types

Each document should be pure to its type. Don't:
- Add tutorial-style "let's build something" to reference docs
- Include reference-style "here are all the parameters" in how-to guides
- Explain concepts in depth within tutorials

Instead, link between types: "For a hands-on introduction, see the tutorial. For technical details, see the reference."

### Match Tone to Type

Each type has a distinct voice:
- **Tutorial**: Encouraging, supportive ("Great! You've just...")
- **How-to**: Direct, efficient ("Run this command to...")
- **Reference**: Neutral, factual ("Returns a string representing...")
- **Explanation**: Thoughtful, analytical ("This design emerged because...")

### Structure Predictably

Users should recognize the type immediately from structure:
- Tutorials have numbered steps leading to a complete project
- How-tos jump straight to the solution
- Reference follows consistent format for each entry
- Explanations flow narratively, building understanding

## Format Flexibility

This framework applies to any documentation format:
- Markdown
- AsciiDoc
- reStructuredText
- Confluence
- Custom documentation systems

Focus on content structure and purpose, not the markup language.

## Common Questions

**Q: Can a single document serve multiple types?**  
A: No. Each document should be pure to one type. Create separate documents and link between them.

**Q: What if users need multiple types for one feature?**  
A: Create multiple documents. For example, an API might have: a tutorial ("Building Your First Integration"), how-to guides ("How to Authenticate", "How to Handle Rate Limits"), reference ("API Endpoints"), and explanation ("API Design Philosophy").

**Q: Which type should I start with?**  
A: For new features, start with reference (what it is) and a tutorial (how to use it). Add how-tos as common use cases emerge, and explanations when design decisions need clarification.

**Q: How long should each type be?**  
A: As long as necessary for its purpose:
- Tutorials: Complete a meaningful project (often 15-45 minutes)
- How-tos: Solve one specific problem (often 5-15 minutes)
- Reference: Cover all technical details (varies widely)
- Explanations: Fully develop the concept (varies widely)

## Reference Guides

For detailed guidelines, examples, and best practices for each documentation type:

- **[Tutorials](references/tutorial.md)** - Learning-oriented lessons with step-by-step projects
- **[How-to Guides](references/how-to.md)** - Goal-oriented directions for specific tasks
- **[Technical Reference](references/reference.md)** - Information-oriented descriptions of components
- **[Explanations](references/explanation.md)** - Understanding-oriented discussion of concepts

Each reference includes:
- Purpose and characteristics
- Structure templates
- Writing guidelines (do's and don'ts)
- Tone and voice examples
- Complete examples
- Common pitfalls to avoid

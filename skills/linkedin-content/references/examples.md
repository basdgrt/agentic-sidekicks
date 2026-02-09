# Example LinkedIn Posts

These examples demonstrate the target quality, tone, and structure for technical LinkedIn content.

## Example 1: Technical History and Insight

**Topic**: Kotlin coroutines and their historical origins

**Structure**: Historical hook → Context shift → Modern application → Personal reflection → Key takeaways

**Key strengths**:
- Opens with surprising historical fact that creates curiosity
- Clear explanation of why the old approach fell out of favor
- Concrete analogy (chess grandmaster) that clarifies the concept
- Personal insight about learning philosophy
- Ends with thought-provoking question, not forced CTA

**Post**:

> That modern Kotlin coroutine code you write? It is built on a 1958 idea.
> 
> Melvin Conway coined the word "coroutine" 67 years ago. Then we mostly forgot about it.
> 
> Coroutines had their moment between the 1960s and 1980s. Then multi-threading took over. For good reason.
> 
> Software was mostly CPU-bound back then. Local work, predictable timing. Preemptive multitasking made sense. Let the OS decide who runs and for how long.
> 
> Today, most services are IO-bound. They wait. For databases, HTTP calls, queues, storage. Threads are expensive resources to waste on waiting.
> 
> So we dusted off a 1950s idea.
> 
> Cooperative multitasking. The task decides when to give up control, not the OS. When a task does not need the CPU, it steps aside. Without blocking the underlying thread.
> 
> Think of a chess grandmaster playing 50 opponents at once. Opponents raise their hand when ready. Grandmaster makes a move, then moves on. If an opponent needs time to think, the grandmaster does not wait. He walks to the next board. Never idle.
> 
> Fast context switches can look like parallelism. That is not the point. Cooperative multitasking is about not blocking on IO.
> 
> I used to just learn the "how" of new tools. These days I dig into the "why" and the history behind them. Because sometimes the best ideas are not new. They just wait for the right problem to come back.
> 
> 🔴 Multi-threading fits CPU-bound work, not IO-bound services
> 🔴 Cooperative multitasking means tasks yield control, not the OS
> 🔴 The goal is not fake parallelism. It is not blocking on IO
> 
> What old concept deserves a comeback in modern software?

**Analysis**:
- Demonstrates deep technical understanding
- Clear stance: coroutines are not new, they are contextually appropriate
- Concrete examples and constraints clearly explained
- Peer-to-peer tone: assumes reader knows multi-threading
- Personal reflection grounds it in experience
- Question invites engagement without being formulaic

---

## Example 2: Engineering Practice and Judgment

**Topic**: Responsible AI tool usage in software development

**Structure**: Bold opening → Specific practice → Three concrete checks → Clear principle

**Key strengths**:
- Strong, opinionated opening that takes a stance
- Introduces concrete practice ("Expert in the Lead" rule)
- Three specific, actionable checks that reveal experience
- Each check includes the "why" and common failure modes
- No buzzwords or hype about AI
- Grounded in production consequences

**Post**:

> "AI wrote it" is not an excuse for sloppy solutions.
> 
> We recently added a rule to our coding guidelines called "Expert in the Lead". It is simple: you are responsible for every choice that ends up in the codebase. AI is a tool, not an autopilot.
> 
> Agents can scaffold features in minutes. But the agent does not own the PR. You do. The agent will not get paged at 3 AM when production breaks. You will.
> 
> Before creating a PR with agent-generated code, we agreed to check three things:
> 
> Can I explain this solution to a teammate? If not, I do not ship it.
> 
> Are the tests covering the unhappy paths? Agents love the happy path. Null handling, retries, timeouts, race conditions. These sometimes get skipped.
> 
> Is this more complex than it needs to be? Agents sometimes produce clever code when straightforward code would do. Idiomatic beats impressive.
> 
> Staying the expert in the lead means using AI without giving up your judgment.
> 
> 🔴 You own the PR, not the agent
> 🔴 Weak tests and missed edge cases are yours to catch
> 🔴 If you cannot explain it, do not ship it
> 
> How do you stay the expert in the lead when using AI tools?

**Analysis**:
- Clear, opinionated stance on AI tool usage
- Based on real practice (team coding guidelines)
- Specific failure modes that show experience (agents skip edge cases)
- Concrete consequences (getting paged at 3 AM)
- Written for peers who understand production responsibility
- Practical wisdom, not abstract thought leadership

---

## Example 3: Professional Milestone with Principles

**Topic**: Launching new consultancy

**Structure**: Announcement → Partnership context → Core principles → Future vision

**Key strengths**:
- Clear announcement without excessive promotion
- Focus on principles and values, not just the milestone
- Specific about what makes this different (selective, deliberate)
- Technical positioning (Java/Kotlin specialization)
- Forward-looking but concrete (agentic coding)
- Personal but professional tone

**Post**:

> It's official! Starting March 1st, Kay and I are launching our own Java and Kotlin consultancy under the flag of Creetion.
> 
> I couldn't be happier to start this adventure with Kay. We bring different strengths to the table, but we're aligned on what matters: craftsmanship and long-term vision.
> 
> After many conversations, we knew we wanted to build something on our own terms. When we met Jeroen, Sander, and Wout at Creetion, everything clicked. Same values. Same long-term vision. What started as an idea now becomes reality.
> 
> What we're building is simple and deliberate:
> 
> 🔴 Selective and built to last. Small enough to protect what matters, focused enough to make impact.
> 🔴 A place where autonomy, mastery, and purpose are the foundation.
> 🔴 An engineering culture designed for Java and Kotlin engineers to do their best work.
> 
> We're also preparing for what's next. Agentic coding is changing how we build software. We're building expertise in these tools together. Understanding them deeply, using them consciously, and shipping high-quality software that solves real problems, faster.
> 
> This dream has been years in the making. Now it's real!

**Analysis**:
- Announcement that demonstrates values, not just news
- Specific technical positioning (Java/Kotlin)
- Clear principles that signal culture and approach
- Forward-looking technical stance (agentic coding)
- Professional but genuine enthusiasm
- Shows technical leadership through positioning, not claims

---

## Pattern Recognition Across Examples

**Common elements**:
1. One clear idea per post
2. Concrete details that prove experience
3. Clear stance or opinion
4. Short, scannable paragraphs
5. Technical precision without jargon
6. Peer-to-peer tone
7. Red dot bullets (🔴) for key takeaways
8. Questions that invite reflection, not forced engagement
9. No motivational language
10. No em dashes

**Tone characteristics**:
- Confident but not arrogant
- Experienced but still learning
- Opinionated but thoughtful
- Technical but accessible to peers
- Grounded in building real systems

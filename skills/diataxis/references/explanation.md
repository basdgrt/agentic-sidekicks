# Explanation Documentation

## Purpose

Explanation documentation is **understanding-oriented** discussion that clarifies and illuminates a topic. It provides background, context, and insight into why things work the way they do.

## Key Characteristics

- **Understanding-oriented**: Focused on deepening comprehension
- **Contextual**: Provides background and broader perspective
- **Analytical**: Explores relationships, alternatives, and trade-offs
- **Discursive**: Written in a narrative, conversational style
- **Conceptual**: Deals with ideas and principles, not specific tasks

## The Explanation's Promise

"Here's why [concept] works this way and how it fits into the bigger picture."

## Structure

Explanations don't follow a rigid structure but typically include:

### 1. Introduction
- State the topic or concept
- Explain why it's important or relevant
- Set the scope of discussion

### 2. Background/Context
- Historical context or evolution
- Problem the concept addresses
- Relationship to other concepts

### 3. Main Discussion
- How the concept works
- Key principles and mechanisms
- Design decisions and rationale
- Trade-offs and alternatives
- Examples that illustrate concepts

### 4. Conclusion (optional)
- Summary of key insights
- Connections to related topics
- Further reading or resources

## Writing Guidelines

### Do:
- **Explain the "why"**: Focus on understanding, not just facts
- **Provide context**: Show how things fit together
- **Explore alternatives**: Discuss trade-offs and different approaches
- **Make connections**: Link concepts to other ideas and domains
- **Use analogies**: Help readers build mental models
- **Be discursive**: Allow for digressions that aid understanding
- **Discuss history**: Evolution and rationale illuminate design
- **Address the reader**: "You might wonder why..." is fine here

### Don't:
- **Give step-by-step instructions**: That's for tutorials and how-tos
- **Document every detail**: That's for reference
- **Stay purely abstract**: Include examples to illustrate concepts
- **Assume understanding**: Build from fundamentals
- **Avoid complexity**: Tackle difficult topics when needed
- **Be prescriptive**: Explain rather than instruct

## Tone and Voice

- **Thoughtful and conversational**: "It's worth considering why..."
- **Exploratory**: "There are several ways to think about this..."
- **Educational**: "This works because..."
- **Analytical**: "The trade-off here is between..."
- **Present and past tense**: "This design emerged from..." / "The system handles..."

## Example Structures

### Concept Explanation

```markdown
# Understanding Event-Driven Architecture

Event-driven architecture (EDA) is a design pattern where components communicate through events rather than direct calls. To understand why this pattern is valuable, it helps to first understand the problems it solves.

## The Problem with Direct Coupling

In traditional request-response systems, components directly invoke each other. When Service A needs data from Service B, it calls Service B's API directly. This creates tight coupling: Service A must know about Service B, must handle failures when B is unavailable, and must wait for B's response.

As systems grow, this coupling becomes problematic. A change to Service B might require changes to Service A. If Service B goes down, Service A can't function. Adding a new consumer of the same data requires modifying the producer.

## How Events Change the Model

Event-driven systems solve this by inverting the relationship. Instead of Service A calling Service B, Service A publishes an event: "Order was placed." Any service interested in this event—Service B, Service C, or future services—can subscribe and react independently.

This shift has several implications:

**Loose coupling**: The publisher doesn't know or care who consumes its events. Services can be added or removed without changing the publisher.

**Asynchronous processing**: Publishers don't wait for subscribers. They emit the event and continue, making the system more responsive.

**Scalability**: Multiple subscribers can process the same event, distributing load. Slow subscribers don't block fast ones.

## Trade-offs and Considerations

This pattern isn't universally better. It introduces complexity:

**Eventual consistency**: Because events are processed asynchronously, the system may be temporarily inconsistent. An order might be "placed" but not yet "invoiced" for some milliseconds or seconds.

**Debugging complexity**: Instead of a single call stack, behavior emerges from the interaction of multiple event handlers. Tracing a bug through event chains is harder than following a direct call.

**Ordering challenges**: Events might arrive out of order, requiring careful design to handle this gracefully.

## When to Use Event-Driven Architecture

EDA shines in systems where:
- Multiple components need to react to the same occurrence
- Components should be loosely coupled
- Asynchronous processing is acceptable or desirable
- The system needs to scale independently

It's less suitable when:
- You need immediate, synchronous responses
- Strict ordering guarantees are required
- The system is small and coupling isn't a concern

## Related Concepts

Event-driven architecture often appears alongside other patterns:
- **Message queues** provide the infrastructure for event delivery
- **Event sourcing** stores events as the source of truth
- **CQRS** often uses events to synchronize read and write models
```

### Design Decision Explanation

```markdown
# Why We Use Immutable Data Structures

Our codebase extensively uses immutable data structures—objects that can't be modified after creation. This might seem inefficient at first (why copy data instead of modifying it?), but the benefits outweigh the costs in our context.

## The Mutation Problem

Mutable data creates complexity in several ways:

**Defensive copying**: When you pass a mutable object to a function, you can't know if that function will modify it. To be safe, you often need to copy the object first, creating overhead and bugs when you forget.

**Temporal coupling**: The order of operations matters with mutable data. `processOrder(order)` might modify `order`, so calling it twice could have different results. This makes code harder to reason about.

**Concurrency hazards**: Multiple threads accessing mutable data require locks, creating potential deadlocks and performance bottlenecks.

## How Immutability Helps

With immutable data, these problems disappear:

Functions can't modify their inputs, so you can safely share data across functions and threads. The code becomes more predictable—the same input always produces the same output.

Testing becomes simpler. You don't need to verify that functions don't have side effects; they can't.

Debugging improves. When a value is wrong, you know it was wrong when created, not modified later by some distant code.

## The Performance Question

Copying data instead of modifying it sounds expensive, and sometimes it is. But modern languages use structural sharing: when you "modify" an immutable structure, most of the data is shared with the original. Only the changed parts are copied.

For example, updating one field in a record doesn't copy the entire record. The new version shares all the unchanged fields with the original.

In our application, we've measured immutability overhead at less than 5% of total runtime, while it's prevented dozens of concurrency bugs.

## When Immutability Isn't Appropriate

Immutability isn't always the answer:

**Large, frequently-updated arrays**: If you're updating array elements in a tight loop, copying overhead can dominate. Here, careful mutable code might be better.

**Interfacing with mutable systems**: Databases and file systems are inherently mutable. The boundary between immutable application code and mutable storage requires careful design.

**Memory constraints**: In extremely memory-limited environments, the overhead of multiple versions might be prohibitive.

## Conclusion

In our codebase, immutability is the default. The predictability, testability, and concurrency benefits outweigh the performance costs for most use cases. When we do use mutation, it's intentional and isolated, not the pervasive default.
```

### Architecture Explanation

```markdown
# How Our Caching Layer Works

Our application uses a multi-level caching strategy to minimize database load and reduce latency. Understanding how these layers interact helps explain why the system behaves the way it does.

## The Layers

We have three caching levels:

1. **Application memory cache**: In-process cache in each application instance
2. **Distributed cache (Redis)**: Shared cache across all instances
3. **Database query cache**: PostgreSQL's internal query cache

## Why Multiple Levels?

Each level serves a different purpose and offers different trade-offs.

**Application memory** is fastest (nanoseconds) but not shared. If you have 10 app instances, you have 10 separate caches. This is ideal for truly immutable data like configuration or user sessions.

**Redis** is slower (milliseconds) but shared. All app instances see the same data. This prevents cache stampedes when data invalidates and allows cache warming to benefit all instances.

**Database query cache** is managed by PostgreSQL. We don't control it directly, but knowing it exists helps explain why repeated identical queries are fast.

## Cache Population Strategy

We use a hybrid approach:

**Lazy loading**: Most cache entries are populated on first request. This keeps memory usage low and automatically focuses caching on hot data.

**Eager warming**: Critical data (user authentication, feature flags) is loaded into cache at startup. This ensures the first requests after deployment are fast.

**Predictive pre-fetch**: When a user requests an order, we pre-fetch their recent orders. This speculative loading improves perceived performance.

## Invalidation and Consistency

The hard part of caching is invalidation. We use different strategies:

**Time-based expiry**: Data that changes infrequently (e.g., product catalog) expires after 1 hour. This is simple but means data can be stale for up to an hour.

**Event-based invalidation**: When critical data changes (e.g., user permissions), we publish an event that invalidates all cache levels. This maintains consistency but adds complexity.

**Versioning**: Some data includes a version number. Cache checks if its version matches the database. This allows background cache updates without invalidation.

## Trade-offs We've Made

**Eventual consistency over strong consistency**: For most data, being slightly stale is acceptable. We prioritize performance over perfect consistency.

**Memory usage over latency**: We cache aggressively, using significant memory to keep response times low. In our environment, memory is cheaper than slow responses.

**Complexity over simplicity**: Multi-level caching adds operational complexity. We accept this because our read-heavy workload benefits greatly from caching.

## When Caching Causes Problems

Caching isn't always beneficial:

**Highly dynamic data**: User shopping cart contents change frequently. Caching them adds complexity without much benefit.

**Rarely accessed data**: Caching the full product catalog sounds good, but if 80% of products are never viewed, we're wasting memory on cache entries that never hit.

**Cache stampede**: When a popular cache entry expires, many requests try to rebuild it simultaneously, potentially overloading the database. We use lock-based cache rebuilding to prevent this.

## Further Reading

- For configuring cache TTLs, see the [configuration reference](reference/caching.md)
- For monitoring cache hit rates, see [how to monitor cache performance](how-to/monitor-cache.md)
```

## Common Patterns

### Historical Context
Explaining how the current design emerged:
```markdown
Early versions of the system used synchronous API calls. As traffic grew, we hit scaling limits. This led us to adopt message queues, which introduced eventual consistency challenges. Our current design balances these trade-offs by...
```

### Comparative Analysis
Explaining by comparing alternatives:
```markdown
We considered three approaches:
1. **Client-side rendering**: Fast initial deployment but SEO challenges
2. **Server-side rendering**: Better SEO but higher server costs
3. **Static site generation**: Best performance but build-time overhead

We chose static generation because...
```

### Mental Model Building
Using analogies and metaphors:
```markdown
Think of the actor model like a company with departments. Each department (actor) has its own inbox (message queue). Departments communicate by sending memos (messages), not by walking into each other's offices (shared state). This prevents chaos when everyone works at their own pace.
```

## Common Pitfalls to Avoid

1. **Too prescriptive**: "You should use X" belongs in how-to guides. Explanation explores why, not instructs
2. **Too detailed**: Reference-level detail obscures concepts. Focus on principles, not specifications
3. **No examples**: Pure abstraction is hard to grasp. Illustrate concepts with examples
4. **Missing the "why"**: Describing *what* happens without explaining *why* it's designed that way
5. **Too shallow**: "This is how it works" without exploring implications, trade-offs, or alternatives
6. **Disconnected from practice**: Explanation should illuminate real decisions in your system

## When to Use Explanations

Use explanations when:
- Introducing complex concepts or architecture
- Clarifying design decisions and trade-offs
- Providing background on how components interact
- Discussing best practices and their rationale
- Exploring alternatives and when to use each

Don't use explanations for:
- Teaching beginners step-by-step (use tutorials)
- Showing how to accomplish tasks (use how-to guides)
- Documenting APIs and options (use reference)

## Explanation vs Other Types

| Explanation | Tutorial | How-to | Reference |
|-------------|----------|--------|-----------|
| Understanding-oriented | Learning-oriented | Goal-oriented | Information-oriented |
| Clarifies concepts | Teaches basics | Solves problems | Describes components |
| Provides context | Builds confidence | Provides recipe | Lists facts |
| Conversational | Encouraging | Direct | Neutral |
| Explores "why" | Shows "how to learn" | Shows "how to do" | States "what it is" |

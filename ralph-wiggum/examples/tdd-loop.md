# TDD Development Loop

<!-- 
  Ralph Wiggum prompt for test-driven development.
  Each iteration: write a failing test, make it pass, refactor, commit.
  
  This prompt works differently from the others: instead of processing a list,
  it follows the Red-Green-Refactor cycle for a single feature. The loop
  re-enters with fresh context each time, picking up where the last 
  iteration left off by reading the test file and source code.

  Usage:
    cp ralph-wiggum/examples/tdd-loop.md ./PROMPT.md
    # Edit the requirements and file paths below
    ralph-wiggum/ralph.sh --max 30
-->

You are implementing a feature using strict Test-Driven Development (TDD).

## Feature Description

<!-- Replace this with your feature description -->
Implement a shopping cart module that supports:
- Adding items (with quantity)
- Removing items
- Updating quantities
- Calculating total price (with tax)
- Applying discount codes

## File Paths

- Tests: `src/__tests__/cart.test.ts`
- Source: `src/cart.ts`

## Process

Examine the current state of the test file and source file, then determine the next step:

### If all existing tests pass:
1. Write the NEXT failing test for an unimplemented requirement.
2. Run tests to confirm it fails (red).
3. Write the MINIMUM code to make it pass (green).
4. Run tests to confirm all pass.
5. Refactor if there's an obvious improvement (keep tests green).
6. Update the progress tracker below: mark the requirement done and save this file.
7. Commit with message like "tdd: add test and implementation for <what was added>".
8. Stop.

### If any test is currently failing:
1. Read the failing test to understand what's expected.
2. Write the minimum code to make it pass.
3. Run tests to confirm all pass.
4. Refactor if needed (keep tests green).
5. Commit with message like "tdd: make <test name> pass".
6. Stop.

Rules:
- Do NOT ask questions. Make all decisions yourself.
- Write ONE test at a time. Do not skip ahead.
- Each test should cover one specific behavior.
- Keep implementations minimal - only write code needed to pass the current test.
- Follow existing code conventions in the project.

When ALL requirements below are marked [x] and all tests pass (after the commit), reply with "DONE - STOP RALPH".

## Progress Tracker

- [ ] Can create an empty cart
- [ ] Can add an item with quantity
- [ ] Can remove an item
- [ ] Can update item quantity
- [ ] Calculates subtotal correctly
- [ ] Calculates tax correctly
- [ ] Applies percentage discount codes
- [ ] Applies fixed-amount discount codes
- [ ] Rejects invalid discount codes
- [ ] Handles edge cases (zero quantity, negative values, empty cart totals)

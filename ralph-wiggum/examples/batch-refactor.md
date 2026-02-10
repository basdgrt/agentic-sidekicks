# Batch Refactor Loop

<!-- 
  Ralph Wiggum prompt for applying the same refactoring across many files.
  Each iteration processes one file/component, verifies nothing broke, and commits.

  Usage:
    cp ralph-wiggum/examples/batch-refactor.md ./PROMPT.md
    # Edit the refactoring instructions and file list below
    ralph-wiggum/ralph.sh --max 40
-->

Take the topmost item from the file list below and apply the following refactoring:

## Refactoring Instructions

<!-- Replace this section with your specific refactoring task -->
- Rename all usages of `getData()` to `fetchData()` in the file
- Update any related imports or exports
- Ensure all call sites within the file are updated

## Process

1. Apply the refactoring to the file.
2. Run the test suite. If any tests fail, fix them.
3. Run the linter if configured. Fix any issues.
4. Remove the completed file from the list below and save this file.
5. Create a git commit with a message like "refactor: rename getData to fetchData in <filename>".
6. Stop.

Rules:
- Do NOT ask questions. Make all decisions yourself.
- Do NOT change behavior, only rename/restructure.
- If tests fail after the refactoring, the refactoring introduced a bug. Fix it.
- Preserve all existing functionality.

When the file list below is empty (after the commit), reply with "DONE - STOP RALPH".

## Files to Refactor

- [ ] src/services/userService.ts
- [ ] src/services/productService.ts
- [ ] src/services/orderService.ts
- [ ] src/controllers/userController.ts
- [ ] src/controllers/productController.ts
- [ ] src/utils/dataHelpers.ts
- [ ] tests/services/userService.test.ts
- [ ] tests/services/productService.test.ts

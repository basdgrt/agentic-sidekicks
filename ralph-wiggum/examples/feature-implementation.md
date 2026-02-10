# Feature Implementation Loop

<!-- 
  Ralph Wiggum prompt for building features incrementally.
  Each iteration implements one feature, writes tests, and commits.

  Usage:
    cp ralph-wiggum/examples/feature-implementation.md ./PROMPT.md
    # Edit the task list below
    ralph-wiggum/ralph.sh --max 20
-->

Take the topmost feature from the task list below and do the following:

1. Implement the feature completely, following existing code conventions.
2. Write tests for the feature (aim for good coverage of happy path and edge cases).
3. Run the test suite. If tests fail, fix them before proceeding.
4. Run the linter if one is configured. Fix any issues.
5. Remove the completed feature from the task list below and save this file.
6. Create a git commit with a descriptive message (e.g., "feat: add user validation endpoint").
7. Stop.

Rules:
- Do NOT ask questions. Make all decisions yourself.
- Follow existing patterns and conventions in the codebase.
- Keep changes focused on the single feature being implemented.
- If a feature seems too large, implement the most important part and note what's left.

When the task list below is empty (after the commit), reply with "DONE - STOP RALPH".

## Features to Implement

- [ ] Add input validation to the /api/users POST endpoint (reject missing fields, validate email format)
- [ ] Add rate limiting middleware (100 requests per minute per IP)
- [ ] Add a GET /api/health endpoint that returns status, uptime, and version
- [ ] Add pagination support to GET /api/users (query params: page, limit, default 20 per page)
- [ ] Add request logging middleware (method, path, status code, response time)

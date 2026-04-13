# Update docs

Update the remaining tag-reference documentation in /Users/bdegroot/Development/ip-fail-count
to match the detail level of ADDGIFTCARD, GIFTCARDSALDO, LOGIN_INTERNATIONAL, and ASKSELLER.

For each of the following tags, enhance the documentation with:
  1. A detailed *Purpose* that explains what threats it protects against (spam, bot abuse, fraud, etc.)
  2. An expanded *Use when* section that provides specific context about the endpoints and user actions

## Documentation Instructions

Navigate to the topmost tag from the task list below and do the following:

## Process

For each tag:
1. Search GitLab repositories for usage examples using: glab api /search --method GET --field scope=blobs --field search="IpfcTag.<TAG_NAME>" --field per_page=20
2. Read the code context to understand the actual use cases
3. Update the documentation in docs/modules/ROOT/pages/tags-reference.adoc
4. Ensure the descriptions explain both the threat model and the protected user actions
5. Use the /bol-commit skill to commit and push changes (Use the conventional commit type "docs")
6. Remove the completed tag from the list below and save this file.
7. Stop.

Rules:
- Do NOT ask questions. Make all decisions yourself.

When the file list below is empty (after the commit and push), reply with "DONE - STOP RALPH".

## Tags to document
- [ ] NEWUSER
- [ ] B2BREQUESTFORM
- [ ] BASKET_ADD_ITEM
- [ ] FAILED_ASSESSMENT
- [ ] INTERSOLVE
- [ ] PASSWORD_RESET
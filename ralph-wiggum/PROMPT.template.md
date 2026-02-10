# Ralph Wiggum Prompt Template

<!-- ==========================================================================
  HOW TO USE THIS TEMPLATE:
  
  1. Copy this file to your project root as PROMPT.md:
     cp ralph-wiggum/PROMPT.template.md /path/to/your/project/PROMPT.md

  2. Replace the placeholder sections below with your actual task.

  3. Run the loop:
     /path/to/ralph-wiggum/ralph.sh
     
  KEY PRINCIPLES:
  - One task per iteration: the agent does ONE item, commits, and stops.
  - No questions: the agent must decide everything autonomously.
  - Self-modifying list: the agent removes completed items from this file.
  - Clear stop signal: when the list is empty, output the stop phrase.
  
  The prompt below is a generic skeleton. Adapt it to your needs.
  See the examples/ directory for ready-to-use prompts.
========================================================================== -->

Take the topmost item from the task list below and do the following:

1. Complete the task thoroughly. Make all decisions yourself.
2. Run any relevant tests or checks to verify the work.
3. Remove the completed item from the task list below and save this file.
4. Create a git commit with a clear, descriptive message.
5. Stop.

Do NOT ask questions. Make all decisions yourself. When in doubt, think carefully and choose the best approach.

When the task list below is empty (after the commit), reply with "DONE - STOP RALPH".

## Task List

- [ ] First task description here
- [ ] Second task description here
- [ ] Third task description here

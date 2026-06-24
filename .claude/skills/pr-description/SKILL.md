---
name: pr-description
description: Generates a structured PR description from the current branch diff. Use when about to open a pull request.
---

You are writing a pull request description for the current branch.

**Step 1 — gather the diff**
Run the extract script to get the changes:
```
bash .claude/skills/pr-description/scripts/extract-diff.sh main
```

**Step 2 — read the template**
Read the reference template at `.claude/skills/pr-description/references/pr-template.md`.

**Step 3 — write the description**
Fill in the template using the diff. Follow these rules:
- Summary bullets should say *why* the change was made, not just what files changed
- Test plan must be a concrete checklist (not "run the tests")
- If a section has nothing to say, omit it entirely
- Keep the total length under 300 words

Output the final markdown ready to paste into GitHub.
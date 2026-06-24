#!/bin/bash
# Triggered after Claude edits a file (PostToolUse: Write | Edit).
# Runs prettier on any .js/.ts file that was just written.
#
# Wire it up in .claude/settings.json:
# {
#   "hooks": {
#     "PostToolUse": [{
#       "matcher": "Write|Edit",
#       "hooks": [{ "type": "command", "command": ".claude/hooks/post-edit.sh" }]
#     }]
#   }
# }

FILE="$1"

if [[ "$FILE" =~ \.(js|ts|jsx|tsx)$ ]]; then
  npx prettier --write "$FILE"
fi

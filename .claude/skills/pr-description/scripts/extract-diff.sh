#!/bin/bash
# Extracts a clean, token-efficient diff against the main branch.
# Used by the pr-description skill to feed only relevant changes to Claude.
#
# Usage: bash extract-diff.sh [base-branch]
# Output: prints staged diff with stat summary to stdout

BASE="${1:-main}"

echo "=== Changed files ==="
git diff "$BASE"...HEAD --name-status

echo ""
echo "=== Diff ==="
git diff "$BASE"...HEAD -- . ':(exclude)package-lock.json' ':(exclude)*.lock'

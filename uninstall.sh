#!/usr/bin/env bash
# Uninstall the AI Act Compliance skill from Claude Code's skills directory.
#
# Usage:
#   ./uninstall.sh                       # default: ~/.claude/skills/ai-act-compliance
#   ./uninstall.sh /custom/path          # custom target

set -euo pipefail

DEFAULT_TARGET="${HOME}/.claude/skills/ai-act-compliance"
TARGET="${1:-$DEFAULT_TARGET}"

if [ ! -e "$TARGET" ] && [ ! -L "$TARGET" ]; then
  echo "Nothing to remove at $TARGET."
  exit 0
fi

echo "About to remove: $TARGET"
read -r -p "Proceed? [y/N] " reply
if [[ ! "$reply" =~ ^[Yy]$ ]]; then
  echo "Aborted."
  exit 1
fi

rm -rf "$TARGET"
echo "Removed: $TARGET"
echo "Restart Claude Code so the change is detected."

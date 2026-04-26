#!/usr/bin/env bash
# Uninstall the AI Act Compliance skill.
#
# Usage:
#   ./uninstall.sh                       # default: ~/.claude/skills/ai-act-compliance
#   ./uninstall.sh --target claude       # ~/.claude/skills/ai-act-compliance
#   ./uninstall.sh --target codex        # ~/.agents/skills/ai-act-compliance
#   ./uninstall.sh --target both         # both
#   ./uninstall.sh /custom/path          # custom path

set -euo pipefail

CLAUDE_DEFAULT="${HOME}/.claude/skills/ai-act-compliance"
CODEX_DEFAULT="${HOME}/.agents/skills/ai-act-compliance"

TARGETS=()
if [ $# -eq 0 ]; then
  TARGETS=("$CLAUDE_DEFAULT")
else
  case "$1" in
    --target)
      shift
      case "${1:-}" in
        claude) TARGETS=("$CLAUDE_DEFAULT") ;;
        codex)  TARGETS=("$CODEX_DEFAULT") ;;
        both)   TARGETS=("$CLAUDE_DEFAULT" "$CODEX_DEFAULT") ;;
        *)
          echo "Error: --target accepts 'claude', 'codex', or 'both'." >&2
          exit 1
          ;;
      esac
      ;;
    *) TARGETS=("$1") ;;
  esac
fi

remove_one() {
  local target="$1"
  if [ ! -e "$target" ] && [ ! -L "$target" ]; then
    echo "Nothing to remove at $target."
    return 0
  fi
  echo "About to remove: $target"
  read -r -p "Proceed? [y/N] " reply
  if [[ ! "$reply" =~ ^[Yy]$ ]]; then
    echo "Skipped: $target"
    return 0
  fi
  rm -rf "$target"
  echo "Removed: $target"
}

for t in "${TARGETS[@]}"; do
  remove_one "$t"
done

echo "Restart your agent so the change is detected."

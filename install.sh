#!/usr/bin/env bash
# Install the AI Act Compliance skill into the host agent's skills directory.
#
# Supports both Anthropic Claude Code and OpenAI Codex.
#
# Usage:
#   ./install.sh                                    # auto: ~/.claude/skills/ai-act-compliance
#   ./install.sh --target claude                    # ~/.claude/skills/ai-act-compliance
#   ./install.sh --target codex                     # ~/.agents/skills/ai-act-compliance
#   ./install.sh --target both                      # both Claude Code and Codex
#   ./install.sh /custom/path                       # custom path
#   INSTALL_MODE=copy ./install.sh ...              # copy files instead of symlinking
#
# Default mode is symlink so that `git pull` in the source directory upgrades
# every installed copy in place. Set INSTALL_MODE=copy for a snapshot.

set -euo pipefail

SOURCE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MODE="${INSTALL_MODE:-symlink}"

CLAUDE_DEFAULT="${HOME}/.claude/skills/ai-act-compliance"
CODEX_DEFAULT="${HOME}/.agents/skills/ai-act-compliance"

# Argument parsing
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
    -h|--help)
      sed -n '2,17p' "${BASH_SOURCE[0]}"
      exit 0
      ;;
    *)
      TARGETS=("$1")
      ;;
  esac
fi

# Sanity checks
if [ ! -f "$SOURCE/SKILL.md" ]; then
  echo "Error: SKILL.md not found at $SOURCE — is this the skill repository root?" >&2
  exit 1
fi
if [ ! -d "$SOURCE/tasks" ] || [ ! -d "$SOURCE/references" ]; then
  echo "Error: missing tasks/ or references/ directory at $SOURCE." >&2
  exit 1
fi

install_one() {
  local target="$1"
  mkdir -p "$(dirname "$target")"

  if [ -e "$target" ] || [ -L "$target" ]; then
    echo "Target already exists: $target"
    read -r -p "Replace it? [y/N] " reply
    if [[ ! "$reply" =~ ^[Yy]$ ]]; then
      echo "Skipped: $target"
      return 0
    fi
    rm -rf "$target"
  fi

  case "$MODE" in
    symlink)
      ln -sfn "$SOURCE" "$target"
      echo "Symlinked: $target -> $SOURCE"
      ;;
    copy)
      cp -R "$SOURCE" "$target"
      rm -rf "$target/.git" "$target/not_in_repo" "$target/landing"
      echo "Copied to: $target"
      ;;
    *)
      echo "Error: unknown INSTALL_MODE '$MODE'. Use 'symlink' or 'copy'." >&2
      return 1
      ;;
  esac
}

for t in "${TARGETS[@]}"; do
  install_one "$t"
done

echo
echo "Installation complete."
echo "Restart your agent (Claude Code or Codex) so the new skill is discovered."

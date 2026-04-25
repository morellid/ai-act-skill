#!/usr/bin/env bash
# Install the AI Act Compliance skill into Claude Code's skills directory.
#
# Usage:
#   ./install.sh                                    # default: ~/.claude/skills/ai-act-compliance
#   ./install.sh /custom/path                       # custom target
#   INSTALL_MODE=copy ./install.sh                  # copy files instead of symlinking
#
# By default the script creates a symlink so that `git pull` upgrades the skill in place.
# Set INSTALL_MODE=copy to make a snapshot copy that is independent of the source clone.

set -euo pipefail

SOURCE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
DEFAULT_TARGET="${HOME}/.claude/skills/ai-act-compliance"
TARGET="${1:-$DEFAULT_TARGET}"
MODE="${INSTALL_MODE:-symlink}"

# Sanity checks
if [ ! -f "$SOURCE/SKILL.md" ]; then
  echo "Error: SKILL.md not found at $SOURCE — is this the skill repository root?" >&2
  exit 1
fi

if [ ! -d "$SOURCE/tasks" ] || [ ! -d "$SOURCE/references" ]; then
  echo "Error: missing tasks/ or references/ directory at $SOURCE." >&2
  exit 1
fi

mkdir -p "$(dirname "$TARGET")"

# If target exists, ask for confirmation before replacing
if [ -e "$TARGET" ] || [ -L "$TARGET" ]; then
  echo "Target already exists: $TARGET"
  read -r -p "Replace it? [y/N] " reply
  if [[ ! "$reply" =~ ^[Yy]$ ]]; then
    echo "Aborted."
    exit 1
  fi
  rm -rf "$TARGET"
fi

case "$MODE" in
  symlink)
    ln -sfn "$SOURCE" "$TARGET"
    echo "Symlinked: $TARGET -> $SOURCE"
    echo "Future updates: 'git pull' inside $SOURCE will refresh the installed skill."
    ;;
  copy)
    cp -R "$SOURCE" "$TARGET"
    # Strip git metadata and download cache from the snapshot
    rm -rf "$TARGET/.git" "$TARGET/not_in_repo"
    echo "Copied to: $TARGET"
    echo "Future updates: rerun ./install.sh from a fresh clone (with INSTALL_MODE=copy)."
    ;;
  *)
    echo "Error: unknown INSTALL_MODE '$MODE'. Use 'symlink' or 'copy'." >&2
    exit 1
    ;;
esac

echo
echo "Installation complete."
echo "Restart Claude Code so the new skill is discovered."
echo "Verify with: ls $TARGET/SKILL.md"

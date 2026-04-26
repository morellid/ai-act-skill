#!/usr/bin/env bash
# Install the AI Act Compliance skill into a native Claude Code / Codex skills
# directory, or copy/symlink the repo to a custom path for manual vendoring.
#
# Usage:
#   ./install.sh                                    # ~/.claude/skills/ai-act-compliance
#   ./install.sh --target claude                    # ~/.claude/skills/ai-act-compliance
#   ./install.sh --target codex                     # ~/.agents/skills/ai-act-compliance
#   ./install.sh --target both                      # both native skill targets
#   ./install.sh /custom/path                       # raw copy/symlink only
#   ./install.sh --force --target codex             # replace without prompting
#   INSTALL_MODE=copy ./install.sh ...              # copy files instead of symlinking
#
# The helper script does not configure project-local AGENTS.md or adapter files
# for non-native harnesses. See README.md Option D for those flows.

set -euo pipefail

SOURCE="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
MODE="${INSTALL_MODE:-symlink}"
FORCE=0

CLAUDE_DEFAULT="${HOME}/.claude/skills/ai-act-compliance"
CODEX_DEFAULT="${HOME}/.agents/skills/ai-act-compliance"

print_help() {
  cat <<'EOF'
Install the AI Act Compliance skill into a native Claude Code / Codex skills
directory, or copy/symlink the repo to a custom path for manual vendoring.

Usage:
  ./install.sh                                    # ~/.claude/skills/ai-act-compliance
  ./install.sh --target claude                    # ~/.claude/skills/ai-act-compliance
  ./install.sh --target codex                     # ~/.agents/skills/ai-act-compliance
  ./install.sh --target both                      # both native skill targets
  ./install.sh /custom/path                       # raw copy/symlink only
  ./install.sh --force --target codex             # replace without prompting
  INSTALL_MODE=copy ./install.sh ...              # copy files instead of symlinking

The helper script does not configure project-local AGENTS.md or adapter files
for non-native harnesses. See README.md Option D for those flows.
EOF
}

TARGETS=()
while [ $# -gt 0 ]; do
  case "$1" in
    --target)
      if [ ${#TARGETS[@]} -gt 0 ]; then
        echo "Error: install target already set; provide either --target or one custom path." >&2
        exit 1
      fi
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
    -f|--force|--yes|-y) FORCE=1 ;;
    -h|--help) print_help; exit 0 ;;
    *)
      if [ ${#TARGETS[@]} -gt 0 ]; then
        echo "Error: install target already set; provide either --target or one custom path." >&2
        exit 1
      fi
      TARGETS=("$1")
      ;;
  esac
  shift
done

if [ ${#TARGETS[@]} -eq 0 ]; then
  TARGETS=("$CLAUDE_DEFAULT")
fi

# Sanity checks
case "$MODE" in
  symlink|copy) ;;
  *)
    echo "Error: unknown INSTALL_MODE '$MODE'. Use 'symlink' or 'copy'." >&2
    exit 1
    ;;
esac
if [ ! -f "$SOURCE/SKILL.md" ]; then
  echo "Error: SKILL.md not found at $SOURCE — is this the skill repository root?" >&2
  exit 1
fi
if [ ! -d "$SOURCE/tasks" ] || [ ! -d "$SOURCE/references" ]; then
  echo "Error: missing tasks/ or references/ directory at $SOURCE." >&2
  exit 1
fi

native_target_path() {
  case "$1" in
    "$CLAUDE_DEFAULT"|"$CODEX_DEFAULT") return 0 ;;
    *) return 1 ;;
  esac
}

# Returns 0 on a real install, 2 if the user declined to replace, 1 on error.
install_one() {
  local target="$1"
  mkdir -p "$(dirname "$target")"

  if [ -e "$target" ] || [ -L "$target" ]; then
    echo "Target already exists: $target"
    if [ "$FORCE" -eq 1 ]; then
      rm -rf "$target"
    elif [ -t 0 ]; then
      read -r -p "Replace it? [y/N] " reply
      if [[ ! "$reply" =~ ^[Yy]$ ]]; then
        echo "Skipped: $target"
        return 2
      fi
      rm -rf "$target"
    else
      echo "Error: target exists and no interactive prompt is available. Re-run with --force to replace it." >&2
      return 1
    fi
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
  esac
}

INSTALLED_NATIVE=0
INSTALLED_CUSTOM=0
for t in "${TARGETS[@]}"; do
  rc=0
  install_one "$t" || rc=$?
  case "$rc" in
    0)
      if native_target_path "$t"; then INSTALLED_NATIVE=1; else INSTALLED_CUSTOM=1; fi
      ;;
    2) ;;  # user declined; leave flags alone
    *) exit "$rc" ;;
  esac
done

echo
if [ "$INSTALLED_NATIVE" -eq 0 ] && [ "$INSTALLED_CUSTOM" -eq 0 ]; then
  echo "No changes made."
  exit 0
fi
echo "Installation complete."
if [ "$INSTALLED_NATIVE" -eq 1 ]; then
  echo "Restart Claude Code or Codex so the new native skill install is discovered."
fi
if [ "$INSTALLED_CUSTOM" -eq 1 ]; then
  echo "Custom-path installs are raw copies/symlinks only."
  echo "If this is for Cursor, Windsurf, GitHub Copilot, Devin, Amp, or another"
  echo "AGENTS.md/adapters-based harness, complete the project-local setup in"
  echo "README.md Option D before expecting the skill to be discovered."
fi

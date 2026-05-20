#!/usr/bin/env bash
# Build a single drag-and-drop .zip of this skill -> dist/ai-act-compliance.zip
#
# The zip contains a single top-level directory `ai-act-compliance/` with
# SKILL.md, tasks/, references/, examples/, README.md, LICENSE — ready for
# upload to https://claude.ai/customize/skills.
#
# Excludes: not_in_repo/, .git/, .github/, .claude/, dist/, scripts/,
# adapters/, agents/, install.sh, uninstall.sh, AGENTS.md, CHANGELOG.md,
# .gitignore, .DS_Store, __pycache__/, *.pyc, *.pdf, *.docx
#
# Usage: ./scripts/build_releases.sh
# Works locally (macOS/Linux) and in GitHub Actions (ubuntu-latest).

set -euo pipefail

REPO_ROOT="$(cd "$(dirname "$0")/.." && pwd)"
DIST_DIR="$REPO_ROOT/dist"
LICENSE_FILE="$REPO_ROOT/LICENSE"
SKILL_FILE="$REPO_ROOT/SKILL.md"
SKILL_ID="ai-act-compliance"

if [ ! -f "$SKILL_FILE" ]; then
  echo "ERROR: SKILL.md not found at $SKILL_FILE" >&2
  exit 1
fi

if [ ! -f "$LICENSE_FILE" ]; then
  echo "ERROR: LICENSE not found at $LICENSE_FILE" >&2
  exit 1
fi

if ! command -v zip >/dev/null 2>&1; then
  echo "ERROR: 'zip' command not available. Install it (brew install zip / apt-get install zip)." >&2
  exit 1
fi

rm -rf "$DIST_DIR"
mkdir -p "$DIST_DIR"

STAGING="$(mktemp -d)"
trap 'rm -rf "$STAGING"' EXIT

PKG_DIR="$STAGING/$SKILL_ID"
mkdir -p "$PKG_DIR"

# Copy skill payload into staging. Only the assets the skill needs at runtime
# plus README/LICENSE for the human opening the zip.
cp "$SKILL_FILE" "$PKG_DIR/SKILL.md"
cp "$LICENSE_FILE" "$PKG_DIR/LICENSE"
[ -f "$REPO_ROOT/README.md" ] && cp "$REPO_ROOT/README.md" "$PKG_DIR/README.md"

for sub in tasks references examples; do
  if [ -d "$REPO_ROOT/$sub" ]; then
    rsync -a \
      --exclude '.DS_Store' \
      --exclude '__pycache__/' \
      --exclude '*.pyc' \
      --exclude '*.pdf' \
      --exclude '*.docx' \
      "$REPO_ROOT/$sub/" "$PKG_DIR/$sub/"
  fi
done

ZIP_PATH="$DIST_DIR/$SKILL_ID.zip"
(cd "$STAGING" && zip -rq "$ZIP_PATH" "$SKILL_ID")

SIZE="$(du -h "$ZIP_PATH" | cut -f1)"
echo "OK   $SKILL_ID.zip  ($SIZE)"
echo ""
echo "Built 1 zip in $DIST_DIR"

#!/usr/bin/env bash
# Skill self-validation. Checks structural completeness of the skill.
#
# Usage: ./scripts/validate.sh
#
# Exits 0 on success, non-zero with an error count on failure.

set -euo pipefail

SOURCE="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
errors=0
warnings=0

err() { echo "  ERROR: $1"; errors=$((errors + 1)); }
warn() { echo "  WARN:  $1"; warnings=$((warnings + 1)); }

echo "=== Validating skill at $SOURCE ==="

# 1. SKILL.md present with frontmatter
if [ ! -f "$SOURCE/SKILL.md" ]; then
  err "SKILL.md missing at repository root"
else
  if ! head -1 "$SOURCE/SKILL.md" | grep -q "^---$"; then
    err "SKILL.md does not start with YAML frontmatter (---)"
  fi
  if ! grep -q "^name:" "$SOURCE/SKILL.md"; then
    err "SKILL.md frontmatter missing 'name'"
  fi
  if ! grep -q "^description:" "$SOURCE/SKILL.md"; then
    err "SKILL.md frontmatter missing 'description'"
  fi
  if ! grep -qi "disclaimer\|not a substitute\|legal counsel" "$SOURCE/SKILL.md"; then
    warn "SKILL.md may be missing the disclaimer about not replacing legal counsel"
  fi
fi

# 2. README.md present
[ -f "$SOURCE/README.md" ] || err "README.md missing at repository root"

# 3. LICENSE present
[ -f "$SOURCE/LICENSE" ] || err "LICENSE missing"

# 4. CHANGELOG present
[ -f "$SOURCE/CHANGELOG.md" ] || warn "CHANGELOG.md missing"

# 5. install.sh executable
if [ ! -x "$SOURCE/install.sh" ]; then
  err "install.sh missing or not executable"
fi

# 6. references/sources.yaml present and well-formed at the top level
if [ ! -f "$SOURCE/references/sources.yaml" ]; then
  err "references/sources.yaml missing"
else
  if ! grep -q "^schema_version:" "$SOURCE/references/sources.yaml"; then
    err "sources.yaml missing schema_version"
  fi
  if ! grep -q "^skill: ai-act-compliance$" "$SOURCE/references/sources.yaml"; then
    err "sources.yaml does not declare 'skill: ai-act-compliance'"
  fi
fi

# 7. tasks/ directory has at least one .md file
task_count=$(find "$SOURCE/tasks" -maxdepth 1 -name "*.md" -type f 2>/dev/null | wc -l | tr -d ' ')
if [ "$task_count" -eq 0 ]; then
  err "no task files found under tasks/"
else
  echo "  found $task_count task files"
fi

# 8. references/extracts/ directory has at least one .md file
extract_count=$(find "$SOURCE/references/extracts" -maxdepth 1 -name "*.md" -type f 2>/dev/null | wc -l | tr -d ' ')
if [ "$extract_count" -eq 0 ]; then
  warn "no extract files found under references/extracts/"
else
  echo "  found $extract_count extract files"
fi

# 9. examples/ directory has at least one example
example_count=$(find "$SOURCE/examples" -mindepth 1 -maxdepth 1 -type d 2>/dev/null | wc -l | tr -d ' ')
if [ "$example_count" -eq 0 ]; then
  warn "no example directories found under examples/"
else
  echo "  found $example_count example directories"
  # For each example, check input.md, expected-output.md, note.md
  for ex_dir in "$SOURCE"/examples/*/; do
    ex_name=$(basename "$ex_dir")
    [ -f "$ex_dir/input.md" ] || warn "example '$ex_name' missing input.md"
    [ -f "$ex_dir/expected-output.md" ] || warn "example '$ex_name' missing expected-output.md"
    [ -f "$ex_dir/note.md" ] || warn "example '$ex_name' missing note.md"
  done
fi

# 10. Cross-link sanity: every task referenced by SKILL.md should exist
if [ -f "$SOURCE/SKILL.md" ]; then
  while IFS= read -r task_path; do
    full_path="$SOURCE/$task_path"
    if [ ! -f "$full_path" ]; then
      err "SKILL.md references missing file: $task_path"
    fi
  done < <(grep -oE 'tasks/[a-z-]+\.md' "$SOURCE/SKILL.md" | sort -u)
fi

# Final report
echo
echo "=== Validation summary ==="
echo "Errors:   $errors"
echo "Warnings: $warnings"

if [ "$errors" -gt 0 ]; then
  echo "FAILED"
  exit 1
fi
echo "OK"

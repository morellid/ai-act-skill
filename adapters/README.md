# Adapters — using this skill from agents that don't speak SKILL.md

The native installation paths (Claude Code's `~/.claude/skills/` and Codex's `~/.agents/skills/`) are documented in the project [`README.md`](../README.md). This folder contains adapters for agents that use a different format.

## When to use these adapters

You are using an agent that **does not** read `SKILL.md` directly:

- **GitHub Copilot** (in VS Code, JetBrains, etc.) → `copilot-instructions.md`
- **Cursor IDE** → `cursor-rule.mdc`
- **Windsurf** → use AGENTS.md at the repository root (see below)
- **Devin, Amp, Antigravity** → use AGENTS.md at the repository root
- **Continue.dev, Cline, Aider, Gemini CLI** → no adapter yet (see Future work)

## How adapters work

Adapters are **not** copies of the skill. They are pointers + workflow instructions that direct your agent to use the skill content vendored into your repo.

The pattern:

1. Vendor the skill repo into your project (submodule, subtree, or shallow clone) at `.vendor/ai-act-skill/`.
2. Copy the relevant adapter from `adapters/` into the location your agent expects (e.g., `.github/copilot-instructions.md`).
3. The adapter tells your agent how to walk through the skill (classify first → check prohibitions → route to obligations) and where to find article extracts.

## Why adapters instead of full content duplication

- The skill is the source of truth. One repo, one set of extracts, one update path.
- Adapters are tiny pointers (~50–100 lines). The bulk of the content stays in `tasks/` and `references/extracts/`.
- Updates: when a Commission guideline lands or a CEN-CENELEC standard is published, you update the skill once and pull the latest into your `.vendor/ai-act-skill/` of every project.

## AGENTS.md path (recommended for AGENTS.md-aware agents)

For Codex, Cursor, Windsurf, GitHub Copilot, Devin, Amp, Antigravity: an `AGENTS.md` at the root of YOUR repo (the one using the skill) takes precedence and is preferable to per-agent adapter files. Example:

```markdown
# AGENTS.md (in your repo, not in this skill repo)

## Working with AI systems for the EU market

This project includes AI components subject to Regulation (EU) 2024/1689 (the EU AI Act). When the user asks AI Act-related questions, route to the structured tasks under `.vendor/ai-act-skill/tasks/` (skill vendored as a submodule from https://github.com/morellid/ai-act-skill).

Workflow:
1. Classify (`.vendor/ai-act-skill/tasks/classify-system.md`)
2. Check Article 5 prohibitions (`tasks/check-prohibited-practices.md`)
3. Route to the relevant obligations task

Source extracts: `.vendor/ai-act-skill/references/extracts/`
Source catalogue: `.vendor/ai-act-skill/references/sources.yaml`

Non-negotiable: cite articles precisely, do not fabricate, always include the
"support tool, not legal advice" disclaimer.
```

This single file unlocks support across the AGENTS.md-aware ecosystem without per-agent boilerplate.

## Future work

Other formats not yet covered:

- **Continue.dev** — YAML-based config, would need a custom-commands wrapper. Effort: ~2 hours.
- **Cline** — `.clinerules` + Cline skills format. Effort: ~2 hours.
- **Aider** — `.aider.conf.yml` + `CONVENTIONS.md`. Effort: ~1 hour.
- **Gemini CLI** — `GEMINI.md`. Effort: ~30 min (similar to AGENTS.md).
- **ChatGPT Custom GPT** — separate package: instructions + uploaded knowledge files + actions. Effort: ~3-4 hours, niche reach.

PRs welcome to add any of these.

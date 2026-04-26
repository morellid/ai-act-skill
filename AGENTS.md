# AGENTS.md — AI Act Compliance Skill

> Open-format guidance for AI coding agents. AGENTS.md is supported natively by Codex, Cursor, Windsurf, GitHub Copilot, Devin, Amp, Antigravity, and others. See <https://agents.md>.

## What this repository is

This repository **is** an agent skill for compliance work on **Regulation (EU) 2024/1689 — the EU AI Act**. Its purpose is to be installed as a skill into a coding/agent runtime, then invoked when the user asks AI Act questions.

It is not application code. There are no tests to run, no build to perform, no production deployment. Working *on* this repository means improving the skill itself: the article extracts, the task instructions, the example fixtures.

## How to use this skill from your agent

The skill is structured around six tasks routed by [`SKILL.md`](SKILL.md):

- `tasks/classify-system.md` — classify an AI system / model under the AI Act
- `tasks/check-prohibited-practices.md` — Article 5 (eight prohibited practices)
- `tasks/check-high-risk-provider.md` — Articles 8–22
- `tasks/check-deployer-obligations.md` — Articles 26–27 (incl. FRIA)
- `tasks/check-gpai-provider.md` — Articles 51–55 (incl. systemic risk threshold)
- `tasks/check-transparency.md` — Article 50

The textual extracts of cited articles live in `references/extracts/`. The `references/sources.yaml` file tracks each source with its URL, accessed date, SHA256 hash, and licence.

### If you are running this repo as a skill (Claude Code, Codex)

Install it into your skills directory and let your agent discover it natively:

```bash
# Claude Code
git clone https://github.com/morellid/ai-act-skill.git ~/.claude/skills/ai-act-compliance

# Codex
git clone https://github.com/morellid/ai-act-skill.git ~/.agents/skills/ai-act-compliance
```

See [`README.md`](README.md) for the full installation matrix.

### If you are working *on* this repository (improving the skill)

Conventions:

- **Source-grounded**: every normative claim must trace to the Regulation, an EU Commission delegated/implementing act, an EU AI Office guideline, an EDPB joint guideline, or a published harmonised standard. Cite the article precisely.
- **No fabrication**: if a fact is not in `references/extracts/` or `references/sources.yaml`, do not invent it. Add the source first, then cite it.
- **Disclaimer always present**: every task file and every output template includes the language "this is a support tool, not legal advice" and points the user to qualified counsel.
- **Plain markdown**: tasks and extracts are plain markdown. No HTML, no images, no executable inline content. Code blocks are illustrative output templates, not runnable code.
- **Italian: not in this repo**. The Italian-market variant of the skill lives separately. This repo is English, EU-wide audience.

### When you must run a script

There are two scripts:

- `scripts/validate.sh` — structural self-check. Run this after any change to confirm the skill is still well-formed.
- `scripts/fetch-references.sh` — downloads source PDFs declared in `references/sources.yaml` into `not_in_repo/` and verifies hashes. Required only when adding new sources or refreshing existing ones.

Always run `scripts/validate.sh` before committing.

### Commit style

- Conventional Commits (`feat:`, `fix:`, `docs:`, `chore:`, `refactor:`).
- Reference the article number(s) affected when the change touches normative content.
- Co-authored-by trailer for AI agents that drafted significant portions.

## What is in scope

- Improving accuracy and completeness of article extracts.
- Adding new tasks (e.g., `check-importer-distributor` for Articles 23–24).
- Adding example fixtures.
- Tracking Commission delegated/implementing acts and EU AI Office guidelines as they are published.
- Maintaining cross-agent compatibility (Claude Code, Codex, AGENTS.md-aware tools).

## What is out of scope

- Producing legal opinions on specific deployments.
- Claiming the skill substitutes for qualified counsel.
- Adding telemetry, analytics, or non-essential dependencies.
- Reproducing the full text of the Regulation beyond the cited articles (the source PDF stays under `not_in_repo/`).

## Key dates to keep in mind

The AI Act has phased application:

- **2 February 2025** — prohibitions (Art. 5) and AI literacy (Art. 4) in force
- **2 August 2025** — GPAI obligations (Chapter V), penalties, governance in force
- **2 August 2026** — most obligations including high-risk Annex III and Article 50 transparency
- **2 August 2027** — high-risk Annex I products

When updating tasks or extracts, check that the dates of application referenced are still consistent with these phases.

## Disclaimer

This file, the skill it documents, and any outputs the skill produces are informational. They do not constitute legal advice. Penalties under Article 99 of the AI Act reach EUR 35 million or 7% of total worldwide annual turnover. Use at your own risk; review by qualified counsel is required for formal compliance.

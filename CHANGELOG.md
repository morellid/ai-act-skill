# CHANGELOG

All notable changes to this skill are documented here.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/), and this skill adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added (post v0.1.0-alpha)
- **Codex compatibility**: skill now works on OpenAI Codex (`~/.agents/skills/ai-act-compliance/`) in addition to Claude Code (`~/.claude/skills/ai-act-compliance/`). Same `SKILL.md` + frontmatter format used by both agents.
- `agents/openai.yaml` with Codex UI metadata (display_name, short_description, default_prompt).
- `license: MIT` added to SKILL.md frontmatter (Codex picks this up; harmless on Claude Code).
- `install.sh` / `uninstall.sh` rewritten to support `--target claude | codex | both`.
- README reorganised with side-by-side install instructions for both agents and a Codex-specific `$skill-installer` option.
- **Cross-agent reach via AGENTS.md**: added `AGENTS.md` at the repository root, the open standard now governed by the Linux Foundation Agentic AI Foundation. This unlocks native discovery on Codex, Cursor, Windsurf, GitHub Copilot, Devin, Amp, Antigravity, and other AGENTS.md-aware tools (60 000+ repos).
- **Adapters** for agents with different native formats: `adapters/copilot-instructions.md` (GitHub Copilot), `adapters/cursor-rule.mdc` (Cursor MDC rule). See `adapters/README.md` for the vendor + adapt pattern.
- README "Option D — use from another agent" section pointing to AGENTS.md vendor pattern and `adapters/`.

### To do
- Tag and publish v0.1.0 release on GitHub
- Add a `check-importer-distributor` task (Articles 23–24)
- Track and integrate the first published CEN-CENELEC harmonised standards (expected 2026)
- Add a third example covering a GPAI provider classification
- Translate examples into machine-readable test cases for `scripts/validate.sh` to assert against
- Fetch and hash the Commission's GPAI Code of Practice PDF when a stable URL is available
- ChatGPT for Teams distribution: package as Custom GPT (instructions + knowledge files + actions) — see `notes/chatgpt-team-distribution.md` (to be written).

## [0.1.0-alpha] - 2026-04-25

### Added
- Initial skill scaffold with the repository-as-skill layout (root-level `SKILL.md`)
- Six task files covering the most common AI Act compliance flows:
  - `tasks/classify-system.md` — system classification + role identification
  - `tasks/check-prohibited-practices.md` — Article 5 (eight prohibited practices)
  - `tasks/check-high-risk-provider.md` — Articles 8–22 provider obligations
  - `tasks/check-deployer-obligations.md` — Articles 26–27 incl. Fundamental Rights Impact Assessment (FRIA)
  - `tasks/check-gpai-provider.md` — Articles 51–55 incl. systemic risk threshold (10²⁵ FLOPs)
  - `tasks/check-transparency.md` — Article 50 transparency obligations
- Seven textual extracts of cited articles in `references/extracts/`
- `references/sources.yaml` with the Regulation, the GPAI Code of Practice, the Commission GPAI Guidelines, and pointers to harmonised standards under preparation
- Two test fixtures in `examples/` (customer-service chatbot, HR emotion-recognition)
- `install.sh` / `uninstall.sh` for one-command install via symlink (or copy via `INSTALL_MODE=copy`)
- `scripts/validate.sh` for skill self-check
- `scripts/fetch-references.sh` to download and hash-verify the source documents

### Notes
- This is an **alpha** release. The AI Act has phased application until August 2027, harmonised standards are not yet finalised, and Member State implementing measures are still emerging. Before relying on outputs, verify against the Official Journal text and any updates to Commission guidelines.
- The European Parliament corrigendum PDF is used as the working copy of the regulation text; the Official Journal version on EUR-Lex is the legally authoritative reference.

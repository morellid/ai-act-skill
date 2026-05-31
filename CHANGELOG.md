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
- **Digital Omnibus on AI tracking**: timeline tables and disclaimers across `README.md`, `SKILL.md`, `AGENTS.md`, `tasks/classify-system.md`, and `tasks/check-transparency.md` now flag the Commission's 19 November 2025 proposal to delay high-risk obligations. As of late March 2026 the Council and Parliament have aligned on **2 December 2027** (Annex III stand-alone) and **2 August 2028** (Annex I embedded) — pending adoption. New `digital-omnibus-ai-2025` source in `references/sources.yaml` to be promoted to a citable extract once the regulation is adopted in the Official Journal.
- **Digital Omnibus on AI — provisional political agreement (7 May 2026)**: status updated from "in trilogue" to "provisional political agreement reached, formal adoption pending" across `SKILL.md`, `README.md`, `AGENTS.md`, `tasks/classify-system.md`, `tasks/check-transparency.md`, and the `digital-omnibus-ai-2025` source entry. `tasks/check-prohibited-practices.md` and `references/extracts/ai-act-art-5-prohibited.md` now flag the agreed-but-not-yet-in-force **ninth Article 5 prohibition** on non-consensual intimate imagery ("nudifier apps") and CSAM, with a 2 December 2026 compliance deadline once published in the Official Journal. Resolves #1.
- **Article 50 transparency draft guidelines (8 May 2026)**: new source `ec-art50-transparency-guidelines-draft-2026` in `references/sources.yaml` tracking the European Commission's draft guidelines on the implementation of Article 50 transparency obligations, in public consultation until 3 June 2026. `tasks/check-transparency.md` and the `SKILL.md` Sources section now point to it as pending authoritative guidance. To be promoted to a primary source with a textual extract once the final version is published. Resolves #2.
- **High-risk classification draft guidelines (19 May 2026)**: new source `ec-high-risk-classification-guidelines-draft-2026` in `references/sources.yaml` tracking the European Commission's draft guidelines on the classification of high-risk AI systems (Article 96 AI Act), in targeted public consultation until 23 June 2026. `tasks/classify-system.md` Sources section and the `SKILL.md` Sources section now point to it as pending authoritative guidance for Article 6 and Annex III interpretation (safety-component test, Annex III use-case examples, Art. 6(3) derogation). To be promoted to a primary source with a textual extract once the final version is published (expected Q3 2026). Resolves #6.
- **`npx skills` install path**: README documents `npx skills add morellid/ai-act-skill` (vercel-labs CLI auto-detects the root `SKILL.md`).
- **Drag-and-drop release zip**: `scripts/build_releases.sh` builds `dist/ai-act-compliance.zip` (single top-level dir, `SKILL.md` + `tasks/` + `references/` + `examples/` + `LICENSE`) and `.github/workflows/release.yml` attaches it to the GitHub Release on tag push (`v*`), manual dispatch, or release-published. Ready for upload at <https://claude.ai/customize/skills>. README "Option G — drag-and-drop on Claude.ai (web)" covers the flow.

### To do
- Tag and publish v0.1.0 release on GitHub
- Lock final Omnibus dates and update timeline tables once the Regulation is adopted in the OJ; promote `digital-omnibus-ai-2025` to a primary source with a textual extract
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

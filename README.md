# AI Act Compliance Skill

> An agent skill for compliance work on **Regulation (EU) 2024/1689 — the EU Artificial Intelligence Act**. Compatible with **Anthropic Claude Code**, **OpenAI Codex**, and any **AGENTS.md**-aware coding agent (Cursor, Windsurf, GitHub Copilot, Devin, Amp).
>
> **Status: v0.1.0-alpha — public, usable, seeking validators.** The content is grounded in the Official Journal text and the 2025 Commission guidelines, but external review is wide open. If you are a compliance officer, EU AI law expert, or engineering lead with hands-on AI Act experience: please open issues, suggest corrections, or email `ai@davidemorelli.it`. Acknowledged contributors get credit in the README and a citation when the skill ships v0.1.0 stable.
>
> **Pending: Digital Omnibus on AI.** The Commission proposed (19 November 2025) delaying the application of high-risk obligations. Council (13 March 2026) and Parliament (26 March 2026) have aligned in trilogue on **2 December 2027** for stand-alone high-risk (Annex III) systems and **2 August 2028** for high-risk safety components of Annex I products. The proposal is **not yet adopted**; until it is, the legally binding deadline for most high-risk obligations and Article 50 transparency remains 2 August 2026. Article 4 (AI literacy) and Article 5 (prohibitions) — in force since 2 February 2025 — and Chapter V GPAI obligations — in force since 2 August 2025 — are not affected by the Omnibus.

## Looking for validators

Specifically, we are interested in feedback on:

- **Article 5 borderlines**: workplace emotion recognition, biometric categorisation carve-outs, real-time RBI law-enforcement exceptions
- **Annex III scope edges**: where high-risk classification is ambiguous in real systems
- **Article 27 FRIA**: who has actually drafted one for a public-sector deployer; what worked, what did not
- **GPAI thresholds**: how the 10²⁵ FLOPs criterion is being interpreted for fine-tuned and downstream-adapted models
- **Article 50 transparency**: implementation patterns for chatbot disclosure, synthetic-content marking, deep-fake notices

Open an issue at <https://github.com/morellid/ai-act-skill/issues>, or send a private note to `ai@davidemorelli.it`.

## What is this?

A self-contained agent skill that helps compliance teams, AI engineers, and consultants run common tasks on the EU AI Act:

- Classify an AI system or model (in scope? prohibited? high-risk? limited? GPAI? systemic risk?)
- Identify roles (provider, deployer, importer, distributor)
- Check provider obligations for high-risk systems (Articles 8–22)
- Check deployer obligations including the Fundamental Rights Impact Assessment / FRIA (Articles 26–27)
- Check GPAI provider obligations (Articles 51–55)
- Verify transparency obligations under Article 50 (chatbots, synthetic content, deepfakes)

## Installation

The repository **is** the skill. Drop it into your agent's skills directory. The skill follows the `SKILL.md` + frontmatter convention used by both Claude Code and Codex.

| Agent | Skills directory |
|---|---|
| Anthropic Claude Code | `~/.claude/skills/ai-act-compliance/` |
| OpenAI Codex | `~/.agents/skills/ai-act-compliance/` |

### Option A — install via the helper script (Claude Code / Codex only)

```bash
git clone https://github.com/morellid/ai-act-skill.git
cd ai-act-skill
./install.sh                       # default: Claude Code
./install.sh --target codex        # Codex only
./install.sh --target both         # both agents
./install.sh --force --target both # replace existing installs without prompting
```

The script symlinks the repository into the chosen native target(s) by default (so `git pull` upgrades the installed skill in place). Set `INSTALL_MODE=copy` for a snapshot copy.

This helper is for **native Claude Code / Codex skill installs**. If you want to vendor the repo into a project for Cursor, Windsurf, GitHub Copilot, Devin, Amp, or another AGENTS.md-aware harness, use **Option D**. A custom-path run such as `./install.sh /path/to/project/.vendor/ai-act-skill` only copies/symlinks the repo; it does **not** create the project-local `AGENTS.md` pointer or per-agent adapter files.

### Option B — clone directly into the skills directory

```bash
# Claude Code
git clone https://github.com/morellid/ai-act-skill.git ~/.claude/skills/ai-act-compliance

# Codex
git clone https://github.com/morellid/ai-act-skill.git ~/.agents/skills/ai-act-compliance
```

### Option C — Codex `$skill-installer`

Inside a Codex session:

```
$skill-installer https://github.com/morellid/ai-act-skill
```

### Option D — use from another agent (Cursor, Windsurf, GitHub Copilot, Devin, Amp, …)

Many agents read `AGENTS.md` natively (60 000+ repositories already do; the format is governed by the Linux Foundation Agentic AI Foundation). For those agents, vendor this skill into your own project and add a short pointer in your project's `AGENTS.md`:

```bash
# In YOUR project repository:
git submodule add https://github.com/morellid/ai-act-skill.git .vendor/ai-act-skill
```

Then add to your project's `AGENTS.md`:

```markdown
## EU AI Act compliance

When the user asks AI Act questions, walk through the tasks at
`.vendor/ai-act-skill/tasks/` (classify first, then check prohibitions,
then route to provider/deployer/GPAI/transparency). Source extracts at
`.vendor/ai-act-skill/references/extracts/`. Cite articles precisely;
always close with the "support tool, not legal advice" disclaimer.
```

For per-agent adapters (Cursor MDC rule, GitHub Copilot instructions), see [`adapters/`](adapters/) in this repository.

### Option E — download a release zip

```bash
mkdir -p ~/.claude/skills    # or ~/.agents/skills for Codex
curl -L https://github.com/morellid/ai-act-skill/archive/refs/tags/v0.1.0.zip \
  -o /tmp/ai-act-skill.zip
unzip -d ~/.claude/skills /tmp/ai-act-skill.zip
mv ~/.claude/skills/ai-act-skill-* ~/.claude/skills/ai-act-compliance
```

After installation, restart your agent (Claude Code or Codex) so the new skill is discovered.

### Uninstall

```bash
./uninstall.sh                     # default: Claude Code
./uninstall.sh --target codex      # Codex only
./uninstall.sh --target both       # both agents
# or manually:
rm -rf ~/.claude/skills/ai-act-compliance
rm -rf ~/.agents/skills/ai-act-compliance
```

## How to use it (once installed)

In any Claude Code or Codex session, ask questions or give tasks that touch the AI Act:

> "Classify this system under the AI Act: it's a CV-screening tool for HR..."
>
> "Run a FRIA on this high-risk deployment of an emotion-recognition system."
>
> "Check our GPAI model obligations — we're at 5×10²⁵ FLOPs of training compute."

The agent will load this skill, route to the right sub-task, and produce a structured analysis with citations.

In Codex you can also invoke it explicitly:

```
/skills ai-act-compliance
```

## Repository layout

```
ai-act-skill/
├── SKILL.md                     ← the skill entry point (agent reads this)
├── README.md                    ← this file (humans read this)
├── LICENSE                      ← MIT
├── CHANGELOG.md
├── install.sh                   ← installer (Claude Code / Codex / both)
├── uninstall.sh
├── .gitignore
├── AGENTS.md                    ← cross-agent guidance (Codex, Cursor, Windsurf, Copilot, …)
├── agents/                      ← agent-specific UI metadata
│   └── openai.yaml              ← Codex display name + default prompt
├── adapters/                    ← drop-in adapters for non-skill formats
│   ├── copilot-instructions.md  ← GitHub Copilot
│   ├── cursor-rule.mdc          ← Cursor IDE rule
│   └── README.md                ← how to vendor + adapt
├── tasks/                       ← detailed sub-task instructions
│   ├── classify-system.md
│   ├── check-prohibited-practices.md
│   ├── check-high-risk-provider.md
│   ├── check-deployer-obligations.md
│   ├── check-gpai-provider.md
│   └── check-transparency.md
├── references/                  ← official-source metadata + textual extracts
│   ├── sources.yaml
│   └── extracts/
│       ├── ai-act-art-3-definitions.md
│       ├── ai-act-art-5-prohibited.md
│       ├── ai-act-art-6-9-high-risk-classification.md
│       ├── ai-act-annex-iii-high-risk-list.md
│       ├── ai-act-art-26-27-deployer-fria.md
│       ├── ai-act-art-50-transparency.md
│       └── ai-act-art-51-55-gpai.md
├── examples/                    ← test fixtures
│   ├── classify-customer-service-chatbot/
│   └── classify-hr-emotion-recognition/
└── scripts/
    ├── validate.sh              ← skill self-check
    └── fetch-references.sh      ← downloads source PDFs and verifies hashes
```

## Versioning

Semantic versioning, tagged in git (`git tag v0.1.0`). GitHub auto-generates downloadable zips for each tag at `https://github.com/.../archive/refs/tags/<tag>.zip`.

## Validation and tests

The skill ships with two example fixtures (HR emotion recognition, customer service chatbot) under `examples/`, each with a synthetic input and the expected output. To run a structural self-check:

```bash
./scripts/validate.sh
```

For external validation resources (the AI Act is not amenable to fully automated test suites — compliance is fact-specific), see [`references/sources.yaml`](references/sources.yaml) for:

- The Commission's official Compliance Checker at the AI Act Service Desk
- The artificialintelligenceact.eu open-source tracker
- Harmonised standards under preparation by CEN-CENELEC JTC 21 (publication expected from 2026)

## Contributing

Issues and PRs welcome. Two non-negotiable principles:

1. **Only official sources** — every normative claim must trace back to the Regulation, an EU Commission delegated/implementing act, an EU AI Office guideline, an EDPB joint guideline, or a published harmonised standard. Hashes in `references/sources.yaml`.
2. **Disclaimer always present** — the skill is a support tool, never a substitute for legal counsel or notified body assessment.

## Licence

MIT — see [LICENSE](LICENSE).

## Disclaimer

This skill is provided for informational and compliance-support purposes. It does not constitute legal advice, does not replace assessment by a qualified lawyer, and does not replace conformity assessment by a notified body where required. Penalties under Article 99 of the AI Act reach EUR 35 million or 7% of total worldwide annual turnover for the most serious violations. Use at your own risk.

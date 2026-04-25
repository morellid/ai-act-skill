# AI Act Compliance Skill

> A Claude Code skill for compliance work on **Regulation (EU) 2024/1689 — the EU Artificial Intelligence Act**.
>
> **Status**: alpha (v0.1.0). The AI Act is recent legislation with phased application; this skill tracks the regulation as adopted and the early Commission guidelines (2025). Validate against the latest Official Journal text before use in formal advice.

## What is this?

A self-contained Claude Code skill that helps compliance teams, AI engineers, and consultants run common tasks on the EU AI Act:

- Classify an AI system or model (in scope? prohibited? high-risk? limited? GPAI? systemic risk?)
- Identify roles (provider, deployer, importer, distributor)
- Check provider obligations for high-risk systems (Articles 8–22)
- Check deployer obligations including the Fundamental Rights Impact Assessment / FRIA (Articles 26–27)
- Check GPAI provider obligations (Articles 51–55)
- Verify transparency obligations under Article 50 (chatbots, synthetic content, deepfakes)

## Installation

The repository **is** the skill. The simplest way to install is to drop it into the Claude Code skills directory.

### Option A — install via the helper script (recommended)

```bash
git clone https://github.com/davidemorelli/ai-act-skill.git
cd ai-act-skill
./install.sh
```

The script symlinks the repository into `~/.claude/skills/ai-act-compliance` (or copies, if you set `INSTALL_MODE=copy`). With a symlink, `git pull` later upgrades the skill in place.

### Option B — clone directly into the skills directory

```bash
git clone https://github.com/davidemorelli/ai-act-skill.git ~/.claude/skills/ai-act-compliance
```

### Option C — download a release zip

```bash
mkdir -p ~/.claude/skills
curl -L https://github.com/davidemorelli/ai-act-skill/archive/refs/tags/v0.1.0.zip \
  -o /tmp/ai-act-skill.zip
unzip -d ~/.claude/skills /tmp/ai-act-skill.zip
mv ~/.claude/skills/ai-act-skill-* ~/.claude/skills/ai-act-compliance
```

After installation, restart Claude Code so the new skill is detected.

### Uninstall

```bash
./uninstall.sh
# or manually:
rm -rf ~/.claude/skills/ai-act-compliance
```

## How to use it (once installed)

In any Claude Code session, ask questions or give tasks that touch the AI Act:

> "Classify this system under the AI Act: it's a CV-screening tool for HR..."
>
> "Run a FRIA on this high-risk deployment of an emotion-recognition system."
>
> "Check our GPAI model obligations — we're at 5×10²⁵ FLOPs of training compute."

Claude will load this skill, route to the right sub-task, and produce a structured analysis with citations.

## Repository layout

```
ai-act-skill/
├── SKILL.md                     ← the skill entry point (Claude reads this)
├── README.md                    ← this file (humans read this)
├── LICENSE                      ← MIT
├── CHANGELOG.md
├── install.sh                   ← convenience installer
├── uninstall.sh
├── .gitignore
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

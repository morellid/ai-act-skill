# GitHub Copilot adapter

Drop this content into your project's `.github/copilot-instructions.md` to give GitHub Copilot the AI Act compliance context.

> **Note**: this is a thin adapter. The full skill lives at <https://github.com/morellid/ai-act-skill>. Copy the relevant `tasks/` and `references/extracts/` files into your project, or vendor the repo as a submodule, so Copilot can read them as project context.

## How to install

1. Vendor the skill into your repo (one of):
   ```bash
   # Submodule (recommended, easy updates)
   git submodule add https://github.com/morellid/ai-act-skill.git .vendor/ai-act-skill

   # Or shallow snapshot
   git clone --depth 1 https://github.com/morellid/ai-act-skill.git .vendor/ai-act-skill
   ```
2. Copy this file into `.github/copilot-instructions.md` of your repo.
3. Optionally add path-specific `.instructions.md` files under `.github/instructions/` for finer scoping (see below).

## Repository-wide instructions (`.github/copilot-instructions.md`)

```markdown
# AI Act compliance context for this repository

This project includes AI components that must comply with Regulation (EU) 2024/1689
(the EU AI Act). When discussing AI Act questions, follow the structured approach
documented in `.vendor/ai-act-skill/`:

## Workflow

1. **Always classify first** — read `.vendor/ai-act-skill/tasks/classify-system.md`
   and produce a classification before discussing obligations.
2. **Check prohibitions** — `tasks/check-prohibited-practices.md`. If any of the
   eight Article 5 prohibitions apply, stop and recommend redesign or abandonment.
3. **Then route to the relevant obligations task** depending on classification:
   - High-risk + provider: `tasks/check-high-risk-provider.md`
   - High-risk + deployer: `tasks/check-deployer-obligations.md` (incl. FRIA)
   - GPAI provider: `tasks/check-gpai-provider.md`
   - Article 50 transparency: `tasks/check-transparency.md`

## Sources of truth

- Regulation text and article extracts in `.vendor/ai-act-skill/references/extracts/`
- Source metadata (URLs, hashes, licences) in `.vendor/ai-act-skill/references/sources.yaml`

## Non-negotiable rules

- Cite specific articles (e.g., "Art. 5(1)(f)", "Annex III area 4(b)") for every
  normative claim. No general statements like "the AI Act says...".
- If a fact is not in the extracts, do not invent it. Either fetch the original
  Regulation text or flag the gap to the human.
- Always end any AI Act analysis with a disclaimer that the output is a support
  tool, not legal advice, and that qualified counsel should review.
- Penalties under Article 99 reach EUR 35 million or 7% of global turnover —
  borderline cases require human escalation.
```

## Path-specific instructions (optional)

For example, to apply specific guidance only to AI/ML files:

`.github/instructions/ai-act-ml.instructions.md`:

```markdown
---
description: 'AI Act compliance check for ML pipeline code'
applyTo: '**/{models,training,inference}/**/*.{py,ipynb}'
---

When changes affect model training, inference, or evaluation pipelines:
- Verify whether the resulting AI system would qualify as high-risk under
  Annex III. Reference `.vendor/ai-act-skill/references/extracts/ai-act-annex-iii-high-risk-list.md`.
- For changes that alter the intended purpose or substantially modify model
  behaviour, flag a potential Article 25 deemed-provider trigger.
- Document any change to data governance (Art. 10 — relevance, representativeness,
  bias detection, error rate).
```

## Limits of this adapter

- GitHub Copilot's instruction format does not support the same progressive
  disclosure as native skill systems (Claude Code, Codex). Copilot may attempt
  to load all instructions at once. Keep `copilot-instructions.md` concise and
  rely on path-specific files for scoping.
- Copilot does not natively run scripts from instruction files. The
  `scripts/validate.sh` and `scripts/fetch-references.sh` of the skill are not
  invoked automatically.
- For deep agentic workflows on AI Act tasks, prefer Claude Code or Codex with
  the native skill installation.

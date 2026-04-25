# Task: Check GPAI provider obligations (Articles 51–55)

For an organisation that **provides a general-purpose AI model**, verify obligations under Chapter V of Regulation (EU) 2024/1689. GPAI obligations have been **applicable since 2 August 2025**.

## Goal

Produce a structured gap analysis covering:

- Whether the model qualifies as **GPAI** (Art. 3(63))
- Whether the model qualifies as **GPAI with systemic risk** (Art. 51 — 10²⁵-FLOPs threshold or Commission designation)
- Compliance with **Article 53** obligations (technical documentation, downstream-provider documentation, copyright policy, training-data summary)
- Where systemic risk applies, additional compliance with **Article 55** (model evaluation including adversarial testing, serious incident tracking and reporting, cybersecurity protection, risk assessment)
- Adoption of the **GPAI Code of Practice** (voluntary tool to demonstrate compliance)

## Inputs needed

- Description of the model: architecture family (LLM, diffusion, multimodal), parameters, training data scale and source mix, modalities, license (open / proprietary)
- Training compute (FLOPs) — to evaluate the systemic-risk threshold
- Whether the model has been **designated** by the Commission as having systemic risk (the Commission can designate models below the FLOPs threshold based on capabilities — Art. 51(1)(b))
- Status of internal governance: model card / system card, copyright policy, content provenance / watermarking, evaluation pipeline (incl. adversarial), incident response, cybersecurity controls, training-data summary publication

## Sources

Read first:

- [`references/extracts/ai-act-art-51-55-gpai.md`](../references/extracts/ai-act-art-51-55-gpai.md) — Articles 51–55
- The **GPAI Code of Practice** (final version, July 2025) — voluntary tool. URL in `references/sources.yaml`.
- Commission **Guidelines on the scope of obligations for providers of general-purpose AI models** (July 2025) — clarify what is and is not GPAI. URL in `references/sources.yaml`.

## Procedure

### Step 1 — GPAI qualification (Art. 3(63))

A "general-purpose AI model" means an AI model, including where such an AI model is trained with a large amount of data using self-supervision at scale, that displays **significant generality** and is capable of competently performing **a wide range of distinct tasks** regardless of the way the model is placed on the market and that can be **integrated into a variety of downstream systems or applications**.

Indicators:
- Training compute > 10²³ FLOPs is a strong indicator (Recital 98)
- Generality: not optimised for a single task
- Multi-modality or broad linguistic / visual generation capability
- Distributed via API, cloud, downloadable weights, etc.

If qualifies as GPAI: proceed. If not (e.g., narrow-purpose specialised model), the model is treated as part of the AI system that uses it, not subject to Chapter V.

### Step 2 — Systemic risk qualification (Art. 51)

A GPAI model has **systemic risk** if it has **high-impact capabilities** evaluated based on:

- (a) **Cumulative compute used for training measured in floating-point operations greater than 10²⁵ FLOPs** (Art. 51(2)) — automatic presumption
- (b) Designation by the Commission, based on criteria in **Annex XIII**, even below the threshold (capabilities, market reach, ability to scale, etc.)

Notification obligation: providers whose model meets or is reasonably likely to meet the threshold must **notify the Commission without delay and in any event within two weeks** of the threshold being met or known (Art. 52). Providers may submit, with their notification, **arguments** that the model does not present systemic risk despite meeting the threshold.

### Step 3 — Article 53 obligations (all GPAI providers)

#### 53(1)(a) — Technical documentation
Maintain technical documentation of the model, including its training and testing process and the results of its evaluation, with the elements set out in **Annex XI**. Provide on request to the AI Office and national competent authorities.

#### 53(1)(b) — Information to downstream providers
Make available to AI-system providers who intend to integrate the GPAI model into their AI systems the **information and documentation** described in **Annex XII**, enabling them to comply with their own AI Act obligations.

#### 53(1)(c) — Copyright policy
Put in place a **policy to comply with Union law on copyright and related rights**, in particular to identify and respect (including via state-of-the-art technologies) the **reservations of rights** expressed under Art. 4(3) of Directive (EU) 2019/790 (DSM Directive — TDM exception opt-outs).

#### 53(1)(d) — Training-data summary
Make publicly available a **sufficiently detailed summary about the content used for training** the GPAI model, according to a **template provided by the AI Office**.

#### 53(2) — Open-source GPAI exemption (partial)
For GPAI models released under a **free and open-source licence** that allows access, use, modification, and distribution of the model, and whose **parameters, including weights, the information on the model architecture, and the information on model usage are made publicly available**, the obligations in points (a) and (b) of paragraph 1 do **not apply** — **unless the model is GPAI with systemic risk**.

In all cases, points (c) and (d) (copyright policy and training-data summary) **continue to apply**.

#### 53(3) — Authorised representative
Providers established outside the Union must, by written mandate, **appoint an authorised representative** in the Union before placing the model on the market (Art. 54).

### Step 4 — Article 55 obligations (GPAI with systemic risk only — additional)

In addition to Article 53, providers of GPAI models with systemic risk must:

#### 55(1)(a) — Model evaluation
Perform model evaluation in accordance with **standardised protocols and tools reflecting the state of the art**, including conducting and documenting **adversarial testing** with a view to identifying and mitigating systemic risks.

#### 55(1)(b) — Risk assessment and mitigation
Assess and mitigate possible systemic risks at Union level, including their sources, that may stem from the development, placing on the market, or use of GPAI models with systemic risk.

#### 55(1)(c) — Serious incident tracking and reporting
**Track, document, and report**, without undue delay, to the AI Office and, as appropriate, national competent authorities, **relevant information about serious incidents and possible corrective measures**.

#### 55(1)(d) — Cybersecurity
Ensure an **adequate level of cybersecurity protection** for the GPAI model with systemic risk and the physical infrastructure of the model.

### Step 5 — GPAI Code of Practice

The **GPAI Code of Practice** (final, July 2025) is a voluntary tool to demonstrate compliance with Article 53. Adherence is encouraged. The Code has three chapters:

- **Transparency** (helping comply with Art. 53(1)(a) and (b))
- **Copyright** (helping comply with Art. 53(1)(c))
- **Safety and Security** (helping comply with Art. 55 — only for systemic-risk providers)

Adherence requires signing onto the Code and following its measures and KPIs. The Commission and the AI Board have confirmed the Code as adequate for demonstrating compliance with Article 53.

If the provider has **not** adhered, alternative compliance paths must demonstrate equivalent assurance.

## Output

```markdown
# GPAI provider obligations gap analysis — [model name]

**Date**: [YYYY-MM-DD]
**Provider**: [organisation]
**Model**: [name, family, parameters, modalities]
**Training compute (FLOPs)**: [number / estimate]
**Open-source release**: [Yes — license / No]
**Code of Practice adherence**: [Yes / Partial / No]

## Classification

- GPAI: [Yes / No / Borderline — argument]
- Systemic risk:
  - [ ] Threshold-based (10²⁵ FLOPs)
  - [ ] Commission-designated under Art. 51(1)(b)
  - [ ] No

## Notification (Art. 52)

- [ ] Notification to the Commission filed within 2 weeks of meeting / reasonably-likely-meeting threshold
- [ ] Counter-arguments submitted (if applicable)

## Article 53 — gap analysis (all GPAI)

| Obligation | Status | Evidence | Gap | Remediation |
|---|---|---|---|---|
| 53(1)(a) Technical documentation (Annex XI) | ... | ... | ... | ... |
| 53(1)(b) Downstream-provider documentation (Annex XII) | ... | ... | ... | ... |
| 53(1)(c) Copyright policy (TDM opt-out compliance) | ... | ... | ... | ... |
| 53(1)(d) Training-data summary (AI Office template) | ... | ... | ... | ... |
| 53(3)/54 Authorised representative (if non-EU provider) | ... | ... | ... | ... |

## Article 55 — gap analysis (systemic-risk GPAI only)

| Obligation | Status | Evidence | Gap | Remediation |
|---|---|---|---|---|
| 55(1)(a) Model evaluation incl. adversarial testing | ... | ... | ... | ... |
| 55(1)(b) Risk assessment and mitigation | ... | ... | ... | ... |
| 55(1)(c) Serious incident tracking and reporting | ... | ... | ... | ... |
| 55(1)(d) Cybersecurity protection | ... | ... | ... | ... |

## Open-source release impact

- Art. 53(1)(a)(b) exemption: [Applies / Does not apply because of systemic risk / Does not apply because release does not meet open-source criteria of Art. 53(2)]
- Art. 53(1)(c)(d) and Art. 55: continue to apply

## Code of Practice

- Adhered to: [Yes / No]
- If yes: KPIs reported, periodic update plan
- If no: alternative compliance path documented

## Action plan

| Article | Gap | Owner | Deadline |
|---|---|---|---|
| ... |

## Disclaimer

GPAI obligations are recent and the AI Office is iterating on guidance. Verify against the latest Commission guidance and the AI Office templates. Penalties under Art. 101 for GPAI providers reach **EUR 15 million or 3% of total worldwide annual turnover**.
```

## Edge cases

### Borderline GPAI vs domain-specialised models
Refer to the Commission Guidelines on scope (July 2025). If the model is **fine-tuned for a specific task** but built on a general-purpose backbone, it may still be subject to Article 53 if it retains general capabilities. Document the reasoning.

### Open-source models with usage restrictions (e.g., RAIL licenses)
The Art. 53(2) exemption requires that the licence "allows access, use, modification, and distribution". Highly restrictive RAIL or community licenses may not qualify; verify against the specific license terms.

### Models trained before 2 August 2025
Per Art. 111(3), GPAI models placed on the market before this date have until **2 August 2027** to comply with the GPAI obligations. Document the placement date precisely.

### Downstream provider building on a GPAI model
Not subject to Chapter V (those are GPAI provider obligations). The downstream provider must comply with its own AI-system obligations. Document the boundary clearly.

## Limits of this task

- Annex XI (technical documentation), Annex XII (downstream-provider documentation), and Annex XIII (criteria for Commission designation of systemic risk) are detailed; this task flags applicability but does not draft them.
- Does not assess copyright compliance in depth (sector-specific issues with TDM exception, fair-dealing analogies, dataset audits).
- Does not run actual adversarial evaluations; it specifies what should be done.

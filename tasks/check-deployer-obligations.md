# Task: Check high-risk system deployer obligations (Articles 26–27)

For an organisation acting as the **deployer** of an AI system classified as high-risk, verify the obligations under Articles 26 and 27 of Regulation (EU) 2024/1689 — including the **Fundamental Rights Impact Assessment (FRIA)** for specific deployer categories.

## Prerequisite

System classified as **high-risk** and role identified as **deployer** via [`tasks/classify-system.md`](classify-system.md).

## Goal

Produce a structured gap analysis of deployer obligations and, where applicable, structure the FRIA under Article 27.

## Inputs needed

- System name, Annex III area / Annex I product family, and provider's instructions for use
- Whether the deployer is one of: a public body, a private entity providing public services, an entity carrying out activities listed in Annex III paragraph 5(b), (c) (creditworthiness, life/health insurance risk assessment)
- Volume and target population of the deployment (number of affected persons, vulnerable groups)
- Existing internal governance: data protection / DPIA, AI ethics, human oversight processes
- Whether GDPR DPIA has been done (Art. 27(4) — FRIA can dovetail)

## Sources

Read first:

- [`references/extracts/ai-act-art-26-27-deployer-fria.md`](../references/extracts/ai-act-art-26-27-deployer-fria.md) — Articles 26, 27

## Procedure

### Step 1 — Article 26: deployer obligations (general)

For each obligation, capture met / partial / not met:

#### 26(1) — Use according to instructions for use
Operate the system in accordance with the provider's instructions and any agreed contractual terms.

#### 26(2) — Human oversight
Assign human oversight to natural persons with the necessary competence, training, authority, and support. Oversight must be effective, not merely formal.

#### 26(3) — Input data
Where deployer controls input data, ensure relevance and sufficient representativeness in view of the intended purpose.

#### 26(4) — Monitoring and serious incidents
Monitor the operation of the high-risk system. Where the deployer has reason to consider that use may result in a system presenting a risk within Art. 79(1), inform the provider or distributor and the relevant market surveillance authority and **suspend** the system. In case of a **serious incident** (Art. 3(49)), inform the provider, importer, distributor, and authorities **without undue delay**.

#### 26(5) — Logs
Keep automatically generated logs to the extent under deployer's control for an **appropriate period** (default at least 6 months, longer if other Union or national law requires).

#### 26(6) — Workplace deployment information
Before deploying a high-risk AI system in the workplace, **inform workers' representatives and affected workers** that they will be subject to use of the system. Apply national rules on information and consultation.

#### 26(7) — Data protection coordination
Where the deployer is a controller, ensure that the deployer's data-protection obligations under GDPR / LED / EUDPR are satisfied; **DPIA** under Art. 35 GDPR may be required and may be combined with FRIA.

#### 26(8) — Article 50 transparency
Where applicable, comply with transparency obligations (informing natural persons that they are subject to use of a high-risk system in certain cases).

#### 26(9) — Cooperation with authorities
Cooperate with competent authorities on any action they take related to the high-risk system.

#### 26(10) — Special: workplace and education monitoring
Where the deployer uses the system in the **employment context** for purposes covered by Art. 26(7) or Annex III area 4 (employment), specific transparency and worker-information obligations apply.

#### 26(11) — Public authorities + Annex III area 1 specifics
Where Annex III paragraph 1 (biometrics) systems are used by public authorities or Union institutions, additional registration obligations in the EU database apply.

### Step 2 — Article 27: Fundamental Rights Impact Assessment (FRIA)

**Who must do FRIA?** Before deploying a high-risk AI system referred to in Article 6(2) (i.e., Annex III), **except for Annex III paragraph 2 (critical infrastructure)**, the following deployers must conduct a FRIA:

- (i) **Bodies governed by public law** (public administration)
- (ii) **Private entities providing public services**
- (iii) Deployers of high-risk systems referred to in Annex III paragraph 5(b) (creditworthiness scoring of natural persons, except detection of financial fraud) and 5(c) (risk assessment and pricing in life and health insurance)

If none of (i)–(iii) applies, FRIA is **not** required (Art. 26 still applies in full).

**FRIA scope (Art. 27(1))**: assessment of the impact on fundamental rights that the use of the system may produce. The FRIA shall include:

- (a) Description of the deployer's processes in which the high-risk AI system will be used in line with its intended purpose
- (b) Description of the **period of time** within which, and the **frequency** with which, each high-risk AI system is intended to be used
- (c) **Categories of natural persons and groups likely to be affected** by its use in the specific context
- (d) The **specific risks of harm** likely to have an impact on the categories of natural persons or groups identified, taking into account the information given by the provider pursuant to Art. 13
- (e) **Description of the implementation of human oversight measures**, according to the instructions for use
- (f) **Measures to be taken in case of materialisation** of those risks, including arrangements for internal governance and complaint mechanisms

**Notification (Art. 27(3))**: deployer notifies the market surveillance authority of the results of the FRIA on the use of the system, by submitting the filled-out template referred to in Art. 27(5). Deployers may rely partially on FRIAs done previously by other deployers if appropriate.

**Combination with DPIA (Art. 27(4))**: where any of the obligations laid down in Art. 27 is already met through the **data protection impact assessment** conducted pursuant to Art. 35 of Regulation (EU) 2016/679 (GDPR) or Art. 27 of Directive (EU) 2016/680 (LED), the FRIA shall **complement** that DPIA. **Practice tip**: structure FRIA and DPIA jointly to avoid duplication.

**Template (Art. 27(5))**: the AI Office is to provide a template for the notification of the FRIA outcome.

### Step 3 — FRIA structure (proposed)

```markdown
# Fundamental Rights Impact Assessment (Art. 27 AI Act)

**Date**: [YYYY-MM-DD]
**Deployer**: [public body / private entity providing public services / Annex III 5(b)(c) deployer]
**High-risk system**: [name, Annex III area, provider]
**FRIA owner**: [function/role]
**Combined with DPIA**: [Yes — reference DPIA / No]

## A. Process and intended use (Art. 27(1)(a))
[describe end-to-end the deployer's processes, where the system fits, decision points, downstream actions]

## B. Period and frequency (Art. 27(1)(b))
- Deployment start: [date]
- Frequency of use: [continuous / per request / batch / etc.]
- Expected lifecycle: [...]

## C. Affected categories (Art. 27(1)(c))
[natural persons and groups; pay attention to vulnerable groups: minors, elderly, persons with disabilities, members of protected categories]

## D. Specific risks of harm (Art. 27(1)(d))
| ID | Right at stake | Mechanism of harm | Probability | Severity |
|----|---|---|---|---|
| FR-1 | Non-discrimination | algorithmic bias from training data | ... | ... |
| FR-2 | Privacy | over-collection / function creep | ... | ... |
| FR-3 | Procedural fairness / right to good administration | opacity of decision | ... | ... |
| ... |

Common rights at stake (Charter of Fundamental Rights of the EU): dignity, privacy and data protection, non-discrimination, freedom of expression, fair trial / good administration, asylum, child rights, rights of the elderly and persons with disabilities, workers' rights, presumption of innocence (in criminal contexts), right to an effective remedy.

## E. Human oversight (Art. 27(1)(e))
- Designated human reviewers (role, training, authority)
- Specific oversight workflow (when does human review trigger?)
- Threshold to override or reverse the system's output
- Logging and audit of overrides

## F. Risk-materialisation measures (Art. 27(1)(f))
- Internal governance: roles, escalation, complaint handling
- Complaint mechanisms for affected persons (transparent, accessible)
- Periodic review and ex-post audit
- Plan for breach of fundamental rights

## G. Conclusion and notification

- [ ] FRIA complete; market surveillance authority notification template filled (Art. 27(3))
- [ ] DPIA dovetailed (where applicable)
- [ ] Re-assessment trigger documented (substantial change in deployment)

## Disclaimer

The FRIA is the deployer's accountability tool. Outputs require review by qualified counsel familiar with EU fundamental rights law and the specific sectoral context. Penalties for non-compliance with deployer obligations reach **EUR 15 million or 3% of total worldwide annual turnover** (Art. 99(4)).
```

### Step 4 — Output (gap analysis + FRIA structure)

Produce a single document containing both the Art. 26 gap analysis and the Art. 27 FRIA structure if applicable.

## Edge cases

### Public authorities deploying biometrics under Annex III area 1
Additional registration obligations in the EU database (Art. 49(3)). Coordinate with national authorities.

### Deployer who is also provider (Art. 25)
Treat the organisation as **both** roles. Run [`tasks/check-high-risk-provider.md`](check-high-risk-provider.md) and this task in sequence.

### Deployer modifying intended purpose
Per Art. 25(1)(c), modification of intended purpose to high-risk turns the deployer into a deemed provider. The original provider has no further responsibility for the modified system. Run provider check.

### Workplace deployment without FRIA obligation but with worker information duty
Even if the deployer is not subject to Art. 27 FRIA, Art. 26(7) information of workers' representatives still applies. Do not skip.

## Limits of this task

- Does not perform sector-specific FRIA refinements (healthcare, financial services, immigration may require additional considerations).
- Does not draft the AI Office FRIA template responses; structure provided here is a working draft to be filled with deployer-specific information.
- Does not cover Member State law providing additional fundamental-rights protections.

# Expected output — classification of TalentSignal

# AI Act classification — TalentSignal

**Date**: 2026-04-25
**Analysed system**: TalentSignal — emotion-recognition-based HR analytics platform (recruitment + employee engagement)

## Classification

- **In scope of the AI Act**: Yes
- **Type**: AI system
- **Risk tier**: **PROHIBITED** under Article 5(1)(f) for the **employee-monitoring use case** (workplace emotion recognition); **HIGH-RISK** under Annex III area 4(b) and area 1(c) for any **non-prohibited** uses (e.g., applicants pre-employment, if deployed outside an "education institution" or "workplace" — but see analysis below)
- **Organisation's role(s)**:
  - **NeuroHire Inc.** — provider; established outside the Union, must appoint an authorised representative (Art. 22) before placing on EU market
  - **ExampleManufacturing GmbH** — deployer; bound by Art. 26 deployer obligations and Art. 27 FRIA where applicable

## Reasoning

### Step 1 — In-scope test (Art. 2, Art. 3(1))

Machine-based system, autonomous, infers emotional states from biometric input (faces, voice). In scope. NeuroHire is non-EU but the system is placed on the Union market and used by EU deployers — the Regulation applies (Art. 2(1)).

### Step 2 — Prohibited practices (Art. 5)

**5(1)(f) PROHIBITED**: AI systems "to infer emotions of a natural person in the areas of **workplace and education institutions**", except for medical or safety reasons.

- The **employee-engagement use case** at ExampleManufacturing GmbH is unambiguously "in the workplace". **Prohibited.**
- The **applicant-screening use case**: pre-hire interview is not strictly "in the workplace" since the candidate is not yet an employee. The scope of "workplace" under Art. 5(1)(f) is contested. The Commission Guidelines (still to be issued for some aspects) and recital 44 suggest a broad reading. **Conservative interpretation: pre-hire emotion recognition for selection is prohibited as well**, because the recruitment relationship is functionally workplace-related and the rationale of the prohibition (power asymmetry, autonomy of the affected person) applies fully.
- Exceptions under Art. 5(1)(f): "medical or safety reasons" — clearly not the case here (commercial recruitment / engagement scoring).

**Conclusion**: TalentSignal cannot be lawfully placed on the EU market or used by EU deployers for the described use cases. **Stop.**

If a redesigned version excluded all workplace and education contexts (e.g., consumer-facing wellbeing app with explicit consent and not in employment / education), the analysis would proceed to high-risk:

### Step 3 (hypothetical, redesigned product) — High-risk analysis

- **Annex III area 1(c)** — emotion recognition system: **high-risk**
- **Annex III area 4(b)** — AI system to monitor and evaluate performance and behaviour in employment relationships: **high-risk**
- Profiling of natural persons is involved → Art. 6(3) derogation **not available**

A redesigned product (without the workplace/education prohibition trigger) would be high-risk under Annex III area 1, with all the provider obligations of Articles 8–22 and deployer obligations of Articles 26–27 (FRIA may apply if the deployer is a public body or private entity providing public services — for a private manufacturer, FRIA is **not** strictly required by Art. 27, but Art. 26 obligations apply in full).

### Step 4 — GPAI analysis

Not a GPAI model — narrow-purpose specialised system.

### Step 5 — Article 50

Even if not prohibited, Article 50(3) deployer obligation applies: the natural persons exposed to the emotion-recognition system must be informed. This obligation cannot be substituted for compliance with the Article 5 prohibition — if the prohibition applies, no transparency disclosure cures it.

## Applicable dates

| Obligation | Applies from | Status | Pending Omnibus delay |
|---|---|---|---|
| Article 5 prohibitions | 2 February 2025 | **In force** | — |
| Annex III high-risk obligations (relevant only if redesigned to clear Art. 5) | 2 August 2026 | Pending | → 2 December 2027 if Digital Omnibus on AI is adopted (in trilogue) |

## Next-task recommendations

For the system **as described**: the only valid recommendation is to **stop the deployment plan** and not place the product on the EU market for these use cases. Counsel review required.

If NeuroHire wants to enter the EU market, it must:
- Redesign the product to exclude the prohibited use cases (workplace and educational institution emotion recognition without medical/safety rationale)
- Run [`tasks/check-high-risk-provider.md`](../../tasks/check-high-risk-provider.md) for the redesigned high-risk system
- Appoint an EU authorised representative (Art. 22)
- Ensure the deployer can satisfy Art. 26 / Art. 27 obligations

For ExampleManufacturing as prospective deployer:
- **Do not deploy.** Article 5 prohibitions apply since 2 February 2025; deploying triggers exposure to penalties under Art. 99(3).
- Inform workers' representatives under existing co-determination law that the project has been cancelled for AI Act compliance reasons.
- Consider alternative non-AI-Act-prohibited approaches: traditional engagement surveys, structured interviews, performance metrics not based on biometric inference.

## Penalty exposure

Article 5 violations carry the **highest fines**: up to **EUR 35 million or 7% of total worldwide annual turnover** (Art. 99(3)). This is the highest-stakes prohibition tier in EU technology law.

## Limits of this classification

- The exact scope of "workplace" under Art. 5(1)(f) for pre-hire stages will be clarified by Commission guidelines and possibly case law. The conservative interpretation here is recommended for compliance purposes.
- A redesigned non-employment / non-education emotion-recognition product would be high-risk; a complete redesign might still face market viability questions given customer scepticism.
- Member State implementing legislation may impose additional restrictions.

## Disclaimer

This is a clear-cut prohibition case under the current text. Nevertheless, before any final decision (deploy, redesign, withdraw), engage qualified counsel familiar with EU AI law and labour law in the relevant Member States.

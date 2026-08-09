# Task: Classify a system under the AI Act

Determine whether a system or model falls within the scope of Regulation (EU) 2024/1689 and, if so, classify it into the AI Act risk tiers and the role(s) the organisation plays.

## Goal

Produce a structured determination covering:

- **In scope**: does the system meet the AI Act definition of an "AI system" (Art. 3(1))? Or is it a **GPAI model** (Art. 3(63))?
- **Risk tier** (for AI systems other than GPAI):
  - Prohibited (Art. 5)
  - High-risk (Art. 6 + Annex III, or Art. 6(1) when an AI system is a safety component of a Union-harmonisation product)
  - Limited risk / transparency-only (Art. 50)
  - Minimal risk (no specific obligations)
- **GPAI tier** (for general-purpose models): GPAI vs **GPAI with systemic risk** (Art. 51, 10²⁵-FLOPs threshold)
- **Role**: provider / deployer / importer / distributor / authorised representative — possibly multiple
- **Applicable dates**: which provisions are already in force, which will be, and when

Without a correct classification, all subsequent obligation checks are premature.

## Inputs needed

Ask the user (or extract from context) the following:

- A description of the system (purpose, technical approach, end users)
- The sector and use case (HR, finance, healthcare, education, biometrics, law enforcement, infrastructure, etc.)
- Where the system is **placed on the market** or **put into service** (EU? specific Member States? worldwide with EU users?)
- Whether the organisation **develops** the system, **uses** it, **imports** it, or **distributes** it
- For potential GPAI models: training compute (FLOPs), modalities (text/image/audio/video), open-weight or proprietary
- Whether the system is **integrated into another product** subject to Union harmonisation legislation listed in Annex I (e.g., medical devices, machinery, toys)
- Whether the system would be a **safety component** of a regulated product

If the user cannot answer, capture the gaps explicitly in the output.

## Sources

Read first, in order:

1. [`references/extracts/ai-act-art-3-definitions.md`](../references/extracts/ai-act-art-3-definitions.md) — definitions of "AI system", "GPAI model", "provider", "deployer", "placing on the market"
2. [`references/extracts/ai-act-art-5-prohibited.md`](../references/extracts/ai-act-art-5-prohibited.md) — eight prohibited practices
3. [`references/extracts/ai-act-art-6-9-high-risk-classification.md`](../references/extracts/ai-act-art-6-9-high-risk-classification.md) — high-risk classification rules
4. [`references/extracts/ai-act-annex-iii-high-risk-list.md`](../references/extracts/ai-act-annex-iii-high-risk-list.md) — eight high-risk areas
5. [`references/extracts/ai-act-art-50-transparency.md`](../references/extracts/ai-act-art-50-transparency.md) — transparency-only systems
6. [`references/extracts/ai-act-art-51-55-gpai.md`](../references/extracts/ai-act-art-51-55-gpai.md) — GPAI obligations and systemic-risk threshold

### Pending: Commission draft guidelines on high-risk classification (19 May 2026)

The European Commission published draft **Guidelines on the Classification of High-Risk AI Systems** on 19 May 2026, under Article 96 AI Act. The targeted public consultation, initially open until 23 June 2026, was **extended to 23 July 2026 and has now closed**. The draft sets out the Commission's official interpretation of the concepts used in this task:

- when an AI system embedded in an **Annex I** product qualifies as a **safety component** under Article 6(1)
- how to assess whether a system falls into one of the eight **Annex III** use-case areas under Article 6(2), with practical examples of systems that ARE and ARE NOT high-risk
- when the **Article 6(3) derogation** (no significant risk to health, safety or fundamental rights) applies

Tracked as `ec-high-risk-classification-guidelines-draft-2026` in [`references/sources.yaml`](../references/sources.yaml). Final version expected **Q3 2026**, ahead of the 2 December 2027 Annex III application date. Until the final version is published, treat the draft as indicative; once finalised it becomes the Commission's official (non-binding) interpretation of Articles 6 and Annex III for this classification task and the source `excerpt_paths` will be populated accordingly. The adopted Article 50 guidelines already defer to it for the notions of emotion recognition and biometric categorisation (C(2026) 5054 final, points 101 and 103).

## Procedure

### Step 1 — In-scope check (Art. 2 + Art. 3(1))

The Regulation applies to AI systems that are placed on the market, put into service or used within the Union, regardless of the establishment of the provider or deployer (Art. 2(1)).

Out-of-scope cases (Art. 2(3)–(8)) include:

- AI systems used **exclusively for military, defence, or national security purposes**
- AI systems used by public authorities of third countries within international cooperation agreements
- **Research, testing, or development activities** before the system is placed on the market or put into service
- Personal, non-professional use by natural persons
- AI systems released under **free and open-source licences** — exempt from most obligations except prohibitions (Art. 5), GPAI obligations where applicable, and high-risk obligations where the system is placed on the market or put into service

If the system is out of scope, document the basis and stop. Otherwise, proceed.

Definition test (Art. 3(1)): the system must be **machine-based**, designed to **operate with varying levels of autonomy**, **may exhibit adaptiveness** after deployment, and **infers from input how to generate outputs** (predictions, content, recommendations, decisions) **influencing physical or virtual environments**.

> Pure rule-based systems with no learning or inference are typically **out of scope**. Statistical models that produce predictions/classifications **are in scope**.

### Step 2 — GPAI vs AI system

If the artefact is a **model**, not a system, check the GPAI definition (Art. 3(63)):

- Trained on a **large amount of data using self-supervision at scale**
- Displays **significant generality** and is capable of performing **a wide range of distinct tasks**
- Can be integrated into a variety of downstream systems

Then route to the GPAI branch (Step 5 below) instead of the AI-system branch.

### Step 3 — Prohibited practices (Art. 5)

Check the eight prohibited practices in detail by invoking [`tasks/check-prohibited-practices.md`](check-prohibited-practices.md), or quickly scan the list:

1. Subliminal, manipulative, or deceptive techniques causing significant harm
2. Exploitation of vulnerabilities (age, disability, social or economic situation)
3. **Social scoring** by public authorities or on their behalf with detrimental treatment
4. **Predictive policing** based solely on profiling or personality traits
5. **Untargeted scraping** of facial images for facial recognition databases
6. **Emotion recognition in workplaces and educational institutions** (with narrow medical/safety exceptions)
7. **Biometric categorisation** to infer sensitive attributes (race, political opinions, sexual orientation, etc.)
8. **Real-time remote biometric identification in publicly accessible spaces** for law enforcement (with narrow exceptions and judicial authorisation)

If a prohibition is triggered, the system **cannot** be placed on the market or put into service. Penalties: up to **EUR 35 million or 7% of total worldwide annual turnover** (Art. 99(3)).

### Step 4 — High-risk classification (Art. 6)

Two routes to high-risk:

- **Art. 6(1)**: AI system is a **safety component** of a product covered by Union harmonisation legislation listed in **Annex I** (e.g., medical devices, machinery, toys, lifts, radio equipment), AND the product is required to undergo a third-party conformity assessment. The AI system inherits the high-risk classification.
- **Art. 6(2) + Annex III**: AI system is intended to be used in one of eight areas:
  1. **Biometrics** (categorisation, emotion recognition, identification)
  2. **Critical infrastructure** (safety components in road traffic, water, gas, heating, electricity, digital infrastructure)
  3. **Education and vocational training** (admission, evaluation, monitoring of prohibited behaviour)
  4. **Employment, workers management, access to self-employment** (recruitment, screening, evaluation, allocation of tasks, monitoring)
  5. **Access to essential services** (creditworthiness scoring excluding fraud detection, life and health insurance risk assessment, eligibility for public benefits, emergency response dispatching)
  6. **Law enforcement** (risk assessment of natural persons, evidence reliability, profiling, etc.)
  7. **Migration, asylum, and border control** (lie detection, risk assessment of migrants, identification, examination of asylum applications)
  8. **Administration of justice and democratic processes** (assistance to judicial authorities in researching and interpreting facts/law; influencing elections)

**Derogation in Art. 6(3)**: An Annex III system is **not** high-risk if it does not pose a significant risk of harm to health, safety, or fundamental rights, including by not materially influencing the outcome of decision-making. Four narrow conditions; **profiling of natural persons always counts as high-risk**.

A provider claiming the derogation must document the assessment and register it (Art. 6(4)).

### Step 5 — GPAI classification

If a GPAI model:

- **GPAI** (default): obligations under Article 53 (technical documentation for downstream providers, Annex XI / XII; copyright policy; training data summary template).
- **GPAI with systemic risk** (Art. 51): trained with cumulative compute > **10²⁵ FLOPs**, **or** designated by the Commission based on capabilities equivalent to such models. Additional obligations under Article 55 (model evaluation including adversarial testing; tracking and reporting of serious incidents; cybersecurity protection; risk assessment).

### Step 6 — Limited risk / transparency-only (Art. 50)

If not prohibited, not high-risk, and not GPAI, the system may still trigger **transparency obligations** under Article 50:

- AI systems intended to interact directly with natural persons (e.g., chatbots) — must inform the user they are interacting with AI
- AI systems generating synthetic audio, image, video, or text content — output must be marked as artificially generated/manipulated in a machine-readable format
- Emotion recognition or biometric categorisation systems — affected persons must be informed
- **Deep fakes** — disclosure required (with limited exceptions for art, satire, etc., and law enforcement)

If none of the above applies, the system is **minimal risk** and the AI Act imposes no specific obligations beyond voluntary codes of conduct (Art. 95).

### Step 7 — Role identification

Possible roles:

- **Provider** (Art. 3(3)): develops or has developed an AI system / GPAI model and places it on the market or puts it into service in the EU under its own name or trademark.
- **Deployer** (Art. 3(4)): natural or legal person using an AI system under its authority for professional activity (formerly "user").
- **Importer** (Art. 3(6)): EU-established person placing on the market a system bearing a trademark of a non-EU person.
- **Distributor** (Art. 3(7)): a person in the supply chain other than provider/importer that makes a system available on the EU market.
- **Authorised representative** (Art. 3(5)): EU-established person mandated by a non-EU provider.

Role can change. Per **Art. 25**, a deployer becomes a provider (with all attendant obligations) if it:

- Puts its **trademark on a high-risk system** already on the market
- Makes a **substantial modification** to a high-risk system (Art. 3(23))
- Modifies the **intended purpose** of a system in a way that brings it into the high-risk category

### Step 8 — Applicable dates

Apply the phased application calendar of Article 113, **as amended by Regulation (EU) 2026/1744** (Digital Omnibus on AI, in force 27 July 2026):

- **2 February 2025**: prohibitions (Chapter II) and AI literacy obligations (Art. 4)
- **2 August 2025**: GPAI obligations (Chapter V), penalties (Chapter XII), governance (Chapter VII)
- **2 August 2026**: transparency (Art. 50) and the remaining general provisions
- **2 December 2026**: new Art. 5(1)(ba) and (bb) prohibitions on non-consensual intimate imagery / CSAM generation; end of the Art. 50(2) transitional period for generative systems placed on the market before 2 August 2026
- **2 December 2027**: high-risk for Annex III stand-alone systems (Chapter III)
- **2 August 2028**: high-risk for systems falling under Art. 6(1) (Annex I products with third-party conformity)

Note: **GPAI models already on the market on 2 August 2025** have until **2 August 2027** to comply (Art. 111(3)). The Art. 111(2) grandfathering for high-risk systems does **not** extend to Article 50.

#### What Regulation (EU) 2026/1744 changed

Adopted by Parliament 16 June 2026, approved by Council 29 June 2026, published in the OJ 24 July 2026, in force 27 July 2026. It:

- deferred **stand-alone high-risk AI systems (Annex III)** to **2 December 2027**
- deferred **high-risk AI systems embedded as safety components in Annex I products** to **2 August 2028**
- added **Article 5(1) points (ba) and (bb)** prohibiting AI systems generating non-consensual intimate imagery ("nudifier apps") and CSAM, applicable from **2 December 2026**, with a scope rule in Article 5(1a)
- narrowed the "safety component" definition in Art. 3(14) (excludes assistive and performance-optimising AI from Annex I high-risk classification)
- extended SME simplifications to small mid-cap enterprises (SMCs) and centralised GPAI enforcement in the EU AI Office

**It did not defer Article 50.** Never present Article 50 transparency as moving to December 2027 — it has applied since 2 August 2026. Article 4 (AI literacy), the pre-existing Article 5 prohibitions, and Chapter V GPAI obligations are also unaffected. When the system in scope could fall under the new nudifier/CSAM prohibitions, flag the 2 December 2026 deadline and route to `check-prohibited-practices.md` for the Art. 5(1a) limb test.

### Step 9 — Output

Produce a markdown report:

```markdown
# AI Act classification — [system or model name]

**Date**: [YYYY-MM-DD]
**Analysed system / model**: [short description]

## Classification

- **In scope of the AI Act**: [Yes / No / Partial — explain]
- **Type**: [AI system / GPAI model / both]
- **Risk tier (AI systems)**: [Prohibited / High-risk under Art. 6(1) / High-risk under Annex III area X / Limited-risk transparency / Minimal risk]
- **GPAI tier (models)**: [GPAI / GPAI with systemic risk / N/A]
- **Organisation's role(s)**: [Provider / Deployer / Importer / Distributor / Authorised rep.] — note possible Art. 25 role-change

## Reasoning

### Step 1 — In-scope test (Art. 2, Art. 3(1))
[meets definition? Out-of-scope clauses checked? Free and open source?]

### Step 2 — Prohibited practices screening (Art. 5)
[None / one identified — describe and stop. If user is moving forward, recommend ceasing development.]

### Step 3 — High-risk analysis (Art. 6 + Annex III)
[Annex I product with third-party CA? Annex III area? Art. 6(3) derogation considered?]

### Step 4 — GPAI analysis (Art. 51, 53, 55)
[FLOPs, modalities, generality test. Systemic risk threshold check.]

### Step 5 — Article 50 transparency triggers
[Chatbot? Synthetic content? Emotion recognition? Deep fake?]

## Applicable dates

| Obligation block | Applies from | Status |
|---|---|---|
| Prohibitions (Art. 5(1)(a)-(h)), AI literacy (Art. 4) | 2 February 2025 | In force |
| GPAI obligations (Chapter V), penalties, governance | 2 August 2025 | In force |
| Art. 50 transparency | 2 August 2026 | In force |
| New Art. 5(1)(ba)/(bb) NCII and CSAM prohibitions | 2 December 2026 | Enacted, not yet applicable |
| High-risk Annex III (Ch. III) | 2 December 2027 | Not yet applicable |
| High-risk Annex I (Art. 6(1)) | 2 August 2028 | Not yet applicable |

> Dates per Art. 113 as amended by Reg. (EU) 2026/1744.

## Next-task recommendations

- [ ] If high-risk + provider: run [`tasks/check-high-risk-provider.md`](check-high-risk-provider.md)
- [ ] If high-risk + deployer: run [`tasks/check-deployer-obligations.md`](check-deployer-obligations.md), including FRIA where required
- [ ] If GPAI provider: run [`tasks/check-gpai-provider.md`](check-gpai-provider.md)
- [ ] If transparency-only: run [`tasks/check-transparency.md`](check-transparency.md)
- [ ] If borderline / unclear: gather missing inputs (listed above) and re-run

## Limits of this classification

- Based on the information provided. Material changes to inputs (sector, training compute, intended use) require re-classification.
- Annex III is amenable to **Commission delegated acts** that add or remove use cases. Verify the latest version.
- The Art. 6(3) derogation requires a documented assessment and registration; it is not self-applying.
- Member States may have additional national obligations not covered here.

## Disclaimer

This classification is a support tool for compliance work. Final classification decisions should be reviewed by qualified counsel familiar with EU AI law and, where applicable, the relevant sectoral legislation.
```

## Edge cases

### Hybrid systems (rule-based + ML)
If the inferential component is non-trivial (any ML, statistical inference, or learning), the system is in scope. Pure rule engines without inference are typically out.

### General-purpose AI integrated into a downstream system
The downstream **AI system** built on top of a GPAI model is classified separately. The GPAI model has its own obligations (Chapter V); the downstream system has its own (Chapter III if high-risk, Article 50 if transparency-relevant, etc.).

### "AI" branded products that are not AI under Art. 3(1)
Rule-based automation marketed as AI is **out of scope** of this Regulation but may still raise consumer protection / unfair commercial practices issues under other EU law.

### Mixed-modality / multi-purpose systems
Classify the system **per intended purpose** declared by the provider. A single product with multiple intended purposes may have multiple classifications; obligations apply per purpose.

### Open-source AI systems and models
Art. 2(12) and recitals 102–104: free and open-source AI is exempt from many obligations **unless** placed on the market as high-risk, prohibited, or as GPAI with systemic risk. The "open-source" qualifier requires the source code, weights, and use information to be released under a free and open-source licence and must not be monetised.

## Limits of this task

- Does not perform a full conformity assessment.
- Does not produce a CE-marking dossier or a Declaration of Conformity.
- Does not advise on Member State-specific implementing legislation.
- Does not replace legal counsel or notified body assessment.

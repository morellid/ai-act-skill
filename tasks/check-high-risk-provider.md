# Task: Check high-risk system provider obligations (Articles 8–22)

For an organisation acting as the **provider** of an AI system classified as high-risk, run a gap analysis of the obligations imposed by Chapter III, Sections 2 and 3 of Regulation (EU) 2024/1689.

## Prerequisite

System has been classified as **high-risk** and the role identified as **provider** via [`tasks/classify-system.md`](classify-system.md). If not, run classification first.

Note on **deemed providers** (Art. 25): a deployer who substantially modifies a high-risk system, places its own brand on it, or modifies its intended purpose may step into the provider's shoes.

## Goal

Produce a structured gap analysis covering each obligation, indicating: **met / partial / not met / not applicable**, with citations and remediation steps. Output is a working document for the provider's compliance team and external counsel.

## Inputs needed

- Outputs of [`tasks/classify-system.md`](classify-system.md) (in particular the Annex III area or the Annex I product family)
- Status of: risk management system, data governance, technical documentation, logging, transparency to deployers, human oversight design, accuracy/robustness/cybersecurity testing, quality management system, conformity assessment, post-market monitoring
- CE marking applied? EU database registration done?
- Authorised representative appointed (if provider is non-EU)?
- Notified body involved (where third-party conformity assessment required)?

## Sources

Read first:

- [`references/extracts/ai-act-art-6-9-high-risk-classification.md`](../references/extracts/ai-act-art-6-9-high-risk-classification.md) — Articles 6, 8, 9
- The full text of Articles 10 to 22 (data governance, technical documentation, record-keeping, transparency to deployers, human oversight, accuracy/robustness/cybersecurity, QMS, technical documentation retention, automatically generated logs, conformity assessment, EU declaration, CE marking, registration, post-market monitoring) — these are not all extracted yet; cite the article numbers and refer to the source PDF in `not_in_repo/` if available, or to <https://eur-lex.europa.eu/eli/reg/2024/1689/oj/eng>

## Procedure — gap analysis per obligation

### Section 2 — Requirements for high-risk AI systems (Articles 8–15)

#### Art. 8 — Compliance with the requirements
The system must comply with the requirements of Section 2, taking into account the intended purpose, generally acknowledged state of the art, and the provider's risk-management system.

Question: is there a documented mapping of system features to Articles 9–15?

#### Art. 9 — Risk management system
A continuous, iterative process running throughout the lifecycle, including:

- Identification and analysis of known and reasonably foreseeable risks
- Estimation and evaluation of risks, including those emerging from intended use and reasonably foreseeable misuse
- Adoption of risk-management measures
- Testing of the system to identify the most appropriate measures

Children and other vulnerable users are addressed specifically (Art. 9(8)–(9)). Document trade-offs explicitly.

#### Art. 10 — Data and data governance
For training, validation, and testing data sets:

- Relevant data-governance and management practices appropriate to the intended purpose
- Examination for **possible biases** likely to affect health, safety, or fundamental rights
- Data sets must be **relevant, sufficiently representative, free of errors, complete** in view of the intended purpose
- Take into account characteristics of the **specific geographical, contextual, behavioural, or functional setting**

Special-category data may be processed for the **strict purpose of bias detection and correction** under safeguards (Art. 10(5)).

#### Art. 11 — Technical documentation
Technical documentation must be drawn up **before** the system is placed on the market or put into service, kept up to date, and contain at least the elements set out in **Annex IV** (system description, design specifications, monitoring plan, etc.).

For SMEs, simplified documentation may apply (Art. 11(1) third subparagraph + Commission template).

#### Art. 12 — Record-keeping (logs)
The system must allow for **automatic recording of events ('logs')** over the duration of its lifetime, ensuring traceability adequate to the intended purpose.

For Annex III paragraph 1(a) systems (remote biometric identification): logs must include start/end of each use, reference databases, input data, identification of personnel.

#### Art. 13 — Transparency and provision of information to deployers
The system must be designed to allow deployers to interpret outputs and use them appropriately. **Instructions for use** must accompany the system, including:

- Identity and contact of the provider
- Characteristics, capabilities, and limitations of performance
- Foreseeable risks to health, safety, or fundamental rights
- Predetermined changes and their performance characteristics
- Human oversight measures
- Computational and hardware resources, expected lifetime, maintenance
- Description of mechanisms allowing deployers to log events

#### Art. 14 — Human oversight
The system must be designed to be effectively overseen by natural persons during the period it is in use. Oversight must enable:

- Understanding the capabilities and limitations
- Awareness of automation bias
- Correctly interpreting the output
- Decision not to use, override, or reverse the output
- Intervention or interruption ('off switch')

For Annex III paragraph 1(a) systems, no decision should be taken solely on the basis of identification by the system without verification by **at least two natural persons** with the necessary competence (Art. 14(5)).

#### Art. 15 — Accuracy, robustness, cybersecurity
Designed to achieve appropriate level of accuracy, robustness, cybersecurity, and to perform consistently throughout lifecycle. Provider must:

- Declare **levels of accuracy and metrics** in instructions for use
- Address technical and organisational measures to ensure resilience against errors, faults, inconsistencies
- Address vulnerabilities including AI-specific (data poisoning, model evasion, model confidentiality attacks)

### Section 3 — Obligations of providers (Articles 16–22)

#### Art. 16 — Obligations of providers
Providers of high-risk AI systems shall:

- (a) ensure that the system complies with Section 2 requirements
- (b) indicate name, registered trade name, address on the system, packaging, or accompanying documentation
- (c) have a **quality management system** in place complying with Art. 17
- (d) keep the documentation referred to in Art. 18
- (e) keep the **automatically generated logs** under their control where applicable (Art. 19)
- (f) ensure the system undergoes the relevant **conformity assessment** procedure (Art. 43) before placing on the market or putting into service
- (g) draw up an **EU declaration of conformity** (Art. 47)
- (h) affix the **CE marking** (Art. 48)
- (i) comply with **registration obligations** (Art. 49)
- (j) take necessary corrective actions and inform competent authorities, deployers, and where applicable importers and distributors of the high-risk AI system, where the system does not conform with the requirements (Art. 20)
- (k) cooperate with competent authorities (Art. 21)
- (l) demonstrate the conformity of the high-risk AI system on a request of a competent authority

Providers established outside the Union shall, by written mandate, appoint an **authorised representative** in the Union (Art. 22).

#### Art. 17 — Quality management system
Documented system covering: regulatory compliance strategy, design control, technical specs, data management, risk management, post-market monitoring, communication with authorities, record-keeping, resource management, accountability framework. Article 17(2) provides simplifications for financial institutions already subject to QMS rules under EU financial-services law.

#### Art. 18 — Documentation kept by provider
The provider keeps at the disposal of national competent authorities for **10 years** after the system is placed on the market or put into service:

- Technical documentation (Art. 11)
- QMS documentation (Art. 17)
- Documentation of changes approved by notified bodies (where applicable)
- Decisions and other documents issued by notified bodies (where applicable)
- EU declaration of conformity (Art. 47)

#### Art. 19 — Automatically generated logs
The provider keeps the logs **automatically generated** by the high-risk system to the extent under their control. Logs are kept for an appropriate period in light of the intended purpose, normally **at least six months**, unless other Union or national law (e.g., data protection) requires otherwise.

#### Art. 20 — Corrective actions and duty of information
If the provider considers or has reason to consider that a high-risk system already on the market is not in conformity, they immediately take the necessary corrective actions (withdraw, disable, recall) and inform distributors, deployers, importers, the authorised representative, and competent authorities.

If the system presents a risk within the meaning of Art. 79(1), the provider immediately investigates the causes (in collaboration with the reporting deployer where applicable) and informs the market surveillance authorities and notified bodies.

#### Art. 21 — Cooperation with competent authorities
On reasoned request, providers must provide all information and documentation necessary to demonstrate conformity. Where competent authorities request access to logs, providers must provide it.

#### Art. 22 — Authorised representatives
A provider established outside the Union shall, by written mandate, appoint an **authorised representative** established in the Union before making its system available on the EU market. The authorised representative performs the tasks specified in the mandate, including verifying the EU declaration of conformity, keeping documentation, cooperating with authorities, and acting as point of contact.

## Output

```markdown
# Provider obligations gap analysis — high-risk AI system [name]

**Date**: [YYYY-MM-DD]
**System**: [name + Annex III area or Annex I product family]
**Provider**: [organisation]

## Summary

| Block | Met | Partial | Not met | N/A |
|---|---|---|---|---|
| Section 2 (Articles 8–15) | X | Y | Z | W |
| Section 3 (Articles 16–22) | ... | ... | ... | ... |

Overall readiness: [Ready for conformity assessment / Significant gaps / Critical gaps requiring redesign]

## Detail

### Article 8 — Compliance with requirements
- Status: [Met/Partial/Not met]
- Evidence: [...]
- Gaps: [...]
- Remediation: [...]

[Repeat for each article 9, 10, ..., 22]

## Conformity assessment route (Art. 43)

- For Annex I systems: follow the third-party conformity assessment procedure under the relevant Union harmonisation legislation, integrated with AI Act requirements.
- For most Annex III systems: **internal control** procedure (Annex VI) — provider self-assesses, no notified body involvement, but documentation must be available on request.
- For Annex III paragraph 1 systems (biometrics): if no harmonised standards are applied or only partial, **third-party conformity assessment** by a notified body (Annex VII).

## Registration (Art. 49)

- Provider registers the high-risk system in the **EU database** before placing it on the market.
- Specific exceptions for Annex III paragraph 2 (critical infrastructure) systems intended exclusively for trade-secret-protected use.

## Corrective action plan

| Article | Gap | Remediation | Owner | Deadline |
|---|---|---|---|---|
| ... |

## Limits of this analysis

- Annex IV technical documentation requirements are detailed; this analysis flags applicability but does not draft the document.
- The conformity assessment procedure choice depends on factors not fully captured here (e.g., availability of harmonised standards once published — currently under preparation by CEN-CENELEC JTC 21).
- Notified body involvement is required only in specific cases; verify against Art. 43 and Annex VII.

## Disclaimer

This gap analysis is a support tool. Providers preparing for placement on the market must engage qualified counsel and, where applicable, a notified body. Penalties for non-compliance with provider obligations under Articles 16–22 reach **EUR 15 million or 3% of total worldwide annual turnover** (Art. 99(4)).
```

## Limits of this task

- Does not draft Annex IV technical documentation, the EU declaration of conformity, or QMS manuals.
- Does not select notified bodies or interface with national market surveillance authorities.
- Does not address Member State implementing rules (some MS may have additional national obligations).
- Does not cover the AI Pact (voluntary commitments before the Regulation's full application).

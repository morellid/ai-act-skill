# Task: Check transparency obligations (Article 50)

Verify whether an AI system or its outputs trigger transparency obligations under Article 50 of Regulation (EU) 2024/1689, applicable from **2 August 2026**.

> **Pending — Digital Omnibus on AI.** The Commission's 19 November 2025 proposal, on which Council (13 March 2026) and Parliament (26 March 2026) align, would shift the Article 50 application date together with high-risk Annex III obligations to **2 December 2027**. The proposal is in trilogue and not yet adopted; until publication in the OJ, 2 August 2026 remains the binding deadline.

Article 50 applies to certain AI systems regardless of risk classification, in addition to any other obligations. A system that is "minimal risk" can still be subject to Article 50 transparency.

## Goal

Determine which Article 50 obligations apply, identify the addressee (provider or deployer), and produce concrete UX / documentation requirements.

## Inputs needed

- Description of system and outputs
- Whether the system **interacts directly with natural persons** (e.g., chatbot, voicebot, customer-service agent)
- Whether the system **generates synthetic audio, image, video, or text content** (incl. text published to inform the public on matters of public interest)
- Whether the system performs **emotion recognition** or **biometric categorisation**
- Whether outputs constitute **deep fakes** (Art. 3(60): AI-generated or manipulated image, audio, or video content that resembles existing persons, objects, places, entities, or events and would falsely appear to a person to be authentic or truthful)
- Deployment context (public, private, law enforcement, art/satire?)

## Sources

Read first:
- [`references/extracts/ai-act-art-50-transparency.md`](../references/extracts/ai-act-art-50-transparency.md)

## Procedure

For each of Article 50's four blocks, determine: trigger? addressee (provider or deployer)? what disclosure is required? exceptions?

### 50(1) — Direct interaction with natural persons (provider)

**Trigger**: AI system **intended to interact directly with natural persons**.

**Obligation (provider)**: design and develop the system in such a way that **natural persons concerned are informed that they are interacting with an AI system**, unless this is **obvious from the point of view of a natural person who is reasonably well-informed, observant and circumspect**, taking into account the circumstances and the context of use.

**Exception**: AI systems authorised by law to detect, prevent, investigate, or prosecute criminal offences (subject to appropriate safeguards for the rights and freedoms of third parties).

**Practical implementation**:
- Splash screen / first message: "You're chatting with an AI assistant"
- Persistent indicator (badge, icon) where ambiguity could occur
- Voicebot: spoken disclosure at start of call
- Avoid disguising the AI as a specific named human

### 50(2) — Synthetic content (provider)

**Trigger**: AI system, including a GPAI system, generating **synthetic audio, image, video, or text content**.

**Obligation (provider)**: ensure that the **outputs of the AI system are marked in a machine-readable format and detectable as artificially generated or manipulated**. Providers shall ensure their technical solutions are effective, interoperable, robust, and reliable as far as technically feasible.

**Exception**: AI systems performing an **assistive function for standard editing or those that do not substantially alter the input data** or its semantics, or where authorised by law to detect, prevent, investigate, or prosecute criminal offences.

**Practical implementation**:
- C2PA Content Credentials, watermarking schemes (visible and invisible), provenance metadata
- Standards under preparation by CEN-CENELEC; track harmonisation

### 50(3) — Emotion recognition / biometric categorisation (deployer)

**Trigger**: deployer of an emotion recognition system or a biometric categorisation system.

**Obligation (deployer)**: **inform the natural persons exposed thereto of the operation of the system** and process the personal data in accordance with GDPR / LED / EUDPR.

**Exception**: AI systems used for biometric categorisation and emotion recognition permitted by law to detect, prevent, or investigate criminal offences (with safeguards).

**Important interaction with Art. 5**:
- Emotion recognition in **workplaces and educational institutions** is **prohibited** under Art. 5(1)(f) — except medical/safety. If permitted (medical/safety), Art. 50(3) transparency still applies.
- Biometric categorisation **inferring sensitive attributes** is **prohibited** under Art. 5(1)(g) — Art. 50(3) only applies to lawful biometric categorisation.

### 50(4) — Deep fakes and AI-generated public-interest text (deployer)

**Trigger A**: deployer of an AI system that generates or manipulates image, audio, or video content constituting a **deep fake** (Art. 3(60)).

**Obligation (deployer)**: **disclose that the content has been artificially generated or manipulated**.

**Exception A**: where the use is authorised by law to detect, prevent, investigate, or prosecute criminal offences. **Limited exception** for **artistic, creative, satirical, fictional, or analogous works**: the disclosure obligation is limited to disclosure of the existence of generated/manipulated content **in an appropriate manner that does not hamper the display or enjoyment of the work**.

**Trigger B**: deployer of an AI system that generates or manipulates **text** which is published with the purpose of **informing the public on matters of public interest**.

**Obligation (deployer)**: **disclose that the text has been artificially generated or manipulated**.

**Exception B**: text has undergone **human review or editorial control** and a natural or legal person holds **editorial responsibility** for the publication. Also: where authorised by law to detect, prevent, investigate, or prosecute criminal offences.

### 50(5) — Information delivery

The information shall be provided to the natural persons concerned in a **clear and distinguishable manner at the latest at the time of the first interaction or exposure**. The information shall conform to applicable accessibility requirements.

### 50(6) — Coordination with other obligations

Article 50 does **not** affect requirements and obligations set out in Chapter III (high-risk) and is without prejudice to other transparency obligations laid down in Union or national law for AI systems.

## Output

```markdown
# Transparency obligations check (Art. 50) — [system name]

**Date**: [YYYY-MM-DD]
**System**: [...]
**Deployment context**: [...]

## Applicable triggers

| Block | Trigger | Addressee | Status |
|---|---|---|---|
| 50(1) Direct interaction with persons | [Yes/No/Obvious-no-disclosure-needed] | Provider | ... |
| 50(2) Synthetic content output | [Yes/No/Assistive-exempt] | Provider | ... |
| 50(3) Emotion recognition / biometric categorisation | [Yes/No] | Deployer | ... |
| 50(4) Deep fakes | [Yes/No/Artistic-limited] | Deployer | ... |
| 50(4) AI-generated text on public-interest matters | [Yes/No/Editorial-exempt] | Deployer | ... |

## Required disclosures

### As provider:
- [ ] System informs the user it is an AI (50(1)) — text/UI/voice draft
- [ ] Synthetic outputs are marked machine-readable (50(2)) — watermarking/provenance scheme

### As deployer:
- [ ] Affected persons informed about emotion recognition / biometric categorisation (50(3))
- [ ] Deep fake disclosure attached to outputs (50(4))
- [ ] AI-generated text disclosure on public-interest publications (50(4))

## Exceptions analysis

[Note any law-enforcement, artistic-work, editorial-responsibility, or "obvious-AI" exceptions claimed and basis.]

## Implementation notes

- [UX placement, persistent indicator, accessibility, machine-readable format]

## Disclaimer

This Article 50 check is a support tool. Implementation choices for transparency disclosures interact with consumer-protection law, marketing rules, and data-protection law. Penalties for non-compliance with Article 50 reach **EUR 15 million or 3% of total worldwide annual turnover** (Art. 99(4)).
```

## Common patterns

| Pattern | Article 50 result |
|---|---|
| Customer-service chatbot on a website | 50(1) applies — disclose AI |
| Image generator with editing assist | 50(2) applies for synthetic outputs; assistive-edit exemption may narrow |
| Voicebot in B2C support | 50(1) applies — spoken disclosure |
| Deepfake detection system | Not triggered (system detects, does not generate) |
| Deepfake creation tool | 50(4) applies to the deployer of the output |
| News website using AI to draft articles on public-interest topics | 50(4) text trigger — but editorial-responsibility exception may apply |
| Internal AI assistant for drafting (no public output) | 50(4) text trigger does not apply (no publication on public-interest matters) |
| Emotion-aware automotive driver-fatigue monitor | 50(3) applies to deployer; Art. 5(1)(f) exception for safety |
| Workplace emotion recognition for "engagement metrics" | **Prohibited** under Art. 5(1)(f) |

## Limits of this task

- Does not assess interaction with the Digital Services Act (DSA) for very large online platforms.
- Does not provide technical specifications for watermarking / provenance — refer to C2PA, evolving CEN-CENELEC standards.
- Does not address sector-specific transparency overlays (e.g., financial advice disclosures).

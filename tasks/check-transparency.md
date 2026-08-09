# Task: Check transparency obligations (Article 50)

Verify whether an AI system or its outputs trigger transparency obligations under Article 50 of Regulation (EU) 2024/1689, **in force since 2 August 2026**.

> **Article 50 is live and enforceable.** Regulation (EU) 2026/1744 (Digital Omnibus on AI, in force 27 July 2026) deferred only the Chapter III high-risk dates. It did **not** defer Article 50. The single transitional relief: generative AI systems placed on the market or put into service **before 2 August 2026** have until **2 December 2026** to comply with the Art. 50(2) marking and detection duty. Systems that are partly interactive and partly generative benefit from that relief only for the Art. 50(2) marking — their Art. 50(1) disclosure duty applied from 2 August 2026. Content generated before 2 August 2026 needs no retroactive marking, but text generated before and **published on or after** that date must be labelled (Guidelines points 153-154).

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
- [`references/extracts/ai-act-art-50-transparency.md`](../references/extracts/ai-act-art-50-transparency.md) — the legal text
- [`references/extracts/ec-art50-transparency-guidelines.md`](../references/extracts/ec-art50-transparency-guidelines.md) — the Commission's **adopted** Guidelines on Article 50 (C(2026) 5054 final, 20 July 2026), the Commission's official interpretation of every block below. **Non-binding** — cite as persuasive interpretive guidance, never as the norm itself; only the CJEU can interpret the AI Act authoritatively (point 5).

Also relevant:
- **Code of Practice on Transparency of AI-generated Content** (final 10 June 2026) — voluntary, drawn up under Art. 50(7). Per Guidelines point 146 it is the only Union-wide recognised practical framework for demonstrating compliance with Art. 50(2), (4) and (5). Signing is **not required** and adherence is not conclusive evidence of compliance; non-signatories are expected by the Commission to explain how their own measures achieve the same result (§147-148). Treat the Code as a recommended evidential route, not an Article 50 duty. See `sources.yaml` id `code-of-practice-transparency-ai-content-2026`.

## Procedure

For each of Article 50's four blocks, determine: trigger? addressee (provider or deployer)? what disclosure is required? exceptions?

**Before running the blocks — horizontal points (Guidelines Section 2):**

- **The blocks apply cumulatively** (§8). A system generating images inside a conversation triggers 50(1) **and** 50(2) for the provider; if it can produce deep fakes or public-interest text, its deployer additionally owes 50(4). One operator can be provider **and** deployer at once (§15).
- **Provider or deployer?** Putting an in-house system into service under your own name makes you a provider; so does modifying another provider's generative system and releasing it under your own name (§11). A deployer has authority over the **decision to deploy** and the **manner of use** — technical control is not needed (§12). Employees are not separate deployers; the legal person is. A company that merely commissions an agency, without deciding how AI is used, is not a deployer (§14). Hosting services, platforms and broadcasters that only disseminate third-party AI content are **not** deployers (§16-17).
- **Extraterritorial reach**: third-country providers are caught where the **output is used in the Union**; third-country deployers where they **foresee** dissemination in the Union (§10, §13).
- **Exclusions (§18-24)**: purely personal non-professional use removes only the **deployer** duties in 50(3) and 50(4) — the provider's 50(2) marking still applies. Scientific R&D and pre-market testing are out, but **testing in real-world conditions is not**. **Free and open-source AI systems in scope of Article 50 are not exempt**; free/open-source *components* that are not themselves an AI system are outside Article 50.
- **Compliance is not lawfulness (§25)**: satisfying Article 50 does not make the system or its output lawful. It may still be prohibited under Article 5 or high-risk under Article 6, and Article 4 AI literacy applies regardless.
- **GPAI models (§26-27)**: Article 50 binds systems, not models. Where an in-scope system runs on a GPAI model **from the same provider**, the transparency measures may be implemented at model level.

### 50(1) — Direct interaction with natural persons (provider)

**Trigger**: AI system **intended to interact directly with natural persons**.

**Obligation (provider)**: design and develop the system in such a way that **natural persons concerned are informed that they are interacting with an AI system**, unless this is **obvious from the point of view of a natural person who is reasonably well-informed, observant and circumspect**, taking into account the circumstances and the context of use.

**Scope test (Guidelines §30)** — four cumulative elements: (1) an AI system, not rule-based automation; (2) *intended to interact* — a bidirectional exchange with genuine conversational or responsive character; (3) *directly* — real-time or near real-time, excluding output relayed by a human interlocutor; (4) *with natural persons*, including professional users.

**AI agents (§31)**: in scope; must disclose **both** their artificial nature **and** the person on whose behalf they act. Where the provider cannot know in advance whether the agent will meet a natural person, disclosure must be built in at architecture level for every situation where such an interaction is reasonably likely.

**Out of scope (§30-33)**: recommender systems, spam filters, automated translation/transcription, search and retrieval without generation, auto-completion, biometric authentication, backend decision support, predictive maintenance, product visualisation, industrial robots in closed settings.

**Exception**: AI systems authorised by law to detect, prevent, investigate, or prosecute criminal offences (subject to appropriate safeguards for the rights and freedoms of third parties). Does **not** apply where the system is publicly available **and** offers a functionality to report criminal offences — police chatbots, fraud-reporting portals and witness-statement assistants must disclose (§49).

**'Obvious' exception — interpret restrictively (§42-45)**: assess against the reasonably well-informed member of the **targeted and reasonably foreseeable** audience. General awareness that chatbots exist is not enough. **The exception cannot be relied on where children, the elderly, persons with disabilities or low-AI-literacy users may be in the audience.** Obvious: developer code assistants, internal assistants for trained staff, clinical decision support for health professionals, NPCs in single-player games. Not obvious: robotic companion pets, realistic VR avatars, helpdesk chatbots embedded in online platforms.

**Practical implementation**:
- Splash screen / first message: "You're chatting with an AI assistant"
- Persistent indicator (badge, icon) where ambiguity could occur
- Voicebot: spoken disclosure at start of call; audio cues alone are **not** sufficient (§36)
- Avoid disguising the AI as a specific named human
- **Insufficient on their own (§38)**: disclosure only in terms and conditions or documentation; machine-readable marks users cannot perceive; generic site-wide "this website uses AI" statements; vague labels ("assistant"); technical descriptions without explaining the artificial origin
- **Repeat the disclosure (§40)** for vulnerable audiences, sustained or immersive interactions, high-stakes domains (financial, insurance, legal, health advice) and AI agents. The system must **always** disclose when asked about its nature

### 50(2) — Synthetic content (provider)

**Trigger**: AI system, including a GPAI system, generating **synthetic audio, image, video, or text content**.

**Obligation (provider)** — **two duties, not one (§69-78)**:
1. **Mark** outputs in a machine-readable format (watermarks, metadata, cryptographic provenance, logging, fingerprints, or combinations). May be implemented at model level or sourced from an upstream/third-party solution, without displacing the provider's own responsibility to demonstrate compliance.
2. **Provide a means of detection** to persons potentially exposed to the content, giving **human-readable** results. Rely on publicly available industry-standard detection solutions, ideally locally executable. **Marking alone is non-compliant** — this is the most frequently missed half of the obligation.

Both must be **effective, reliable, robust (including against adversarial attacks) and interoperable** across other providers' marking techniques (§79). "Technically feasible" is an **objective** notion: a small provider cannot claim infeasibility that a well-resourced one could not (§81).

**Modalities (§60-63)**: for video, **both the video and its audio** must be marked. 3-D, VR/AR and digital twins are treated as video. AI-agent outputs are in scope only where **perceptible to natural persons** — chain-of-thought and web requests are not.

**Out of scope (§64-68)**: reproducing or rearranging existing content (playlists, ranking); sensor recordings; short sequences (single words, captions, alt-text, UI labels); **source code and adjacent artefacts** (SDKs, SQL, IaC, YAML/JSON config, schemas, APIs, including integral code comments); machine-to-machine-only output; intermediate outputs in closed-loop production workflows (only the final output is marked).

**Exception**: AI systems performing an **assistive function for standard editing or those that do not substantially alter the input data** or its semantics, or where authorised by law to detect, prevent, investigate, or prosecute criminal offences.
- *Exempt (§89-93)*: grammar and spellcheck, minor stylistic polishing, **AI translation of text**, format conversion, compression, noise reduction, cropping, colour adjustment, red-eye and dust removal, face blurring, rescaling, transcription, assistive-technology output.
- *Requires marking*: **summaries**, paraphrasing that changes meaning or structure, object or person insertion/removal, face replacement, voice cloning, realistic video of events that did not occur, composites that change how persons, objects or facts are represented.

**Proportionality carve-outs (§86-88)**: lighter metadata marking for generative systems embedded in closed physical products (in-vehicle navigation); **no** marking or detection for strictly technical industrial/B2B output confined to a pre-defined set of professionals with safeguards against leakage; real-time ephemeral content (games, VR) where marking is not feasible **and** exposed persons are told the content is AI-generated.

**Practical implementation**:
- C2PA Content Credentials, watermarking schemes (visible and invisible), provenance metadata
- Standards under preparation by CEN-CENELEC; track harmonisation
- Adhering to the Code of Practice on Transparency of AI-generated Content is a recognised (voluntary) route to demonstrating compliance; a documented **gap analysis** against its measures is a practical way for non-signatories to evidence equivalence (§147-148). Neither is legally required

### 50(3) — Emotion recognition / biometric categorisation (deployer)

**Trigger**: deployer of an emotion recognition system or a biometric categorisation system.

**Obligation (deployer)**: **inform the natural persons exposed thereto of the operation of the system** and process the personal data in accordance with GDPR / LED / EUDPR. Applies whether the system runs in **real time or ex post** (§100), and to **all** exposed persons **including children** (§106).

**Scope of the information (§105)**: only that the person is exposed to a system being operated. The AI Act does not require stating the reasons or purposes — data-protection law may.

**Means and timing (§107-108)**: no prescribed form (writing, standardised icons, oral, or combinations); choose by place of deployment, likely addressees and length of exposure. Examples: a pop-up before a game launches stating the player's face is recorded and emotions captured; a visible notice at each entrance to a room where visitors' facial images are captured for age-group assignment.

**Note (§104)**: Art. 50(3) applies to **any** lawful biometric categorisation system, including systems that are **not** high-risk (e.g. age or gender classification from biometric data).

**Exception**: AI systems used for biometric categorisation and emotion recognition permitted by law to detect, prevent, or investigate criminal offences (with safeguards). **This exception is broader than the others in Article 50** (§109): it does not require an explicit authorising law, only that the use be permitted under the legal rules governing law enforcement powers.

**Important interaction with Art. 5**:
- Emotion recognition in **workplaces and educational institutions** is **prohibited** under Art. 5(1)(f) — except medical/safety. If permitted (medical/safety), Art. 50(3) transparency still applies.
- Biometric categorisation **inferring sensitive attributes** is **prohibited** under Art. 5(1)(g) — Art. 50(3) only applies to lawful biometric categorisation.

### 50(4) — Deep fakes and AI-generated public-interest text (deployer)

**Trigger A**: deployer of an AI system that generates or manipulates image, audio, or video content constituting a **deep fake** (Art. 3(60)).

**Deep-fake test — four cumulative criteria (§113)**: (1) **appreciable resemblance** to the subject (identity not required); (2) the subject is **realistic** — content defying the laws of nature (dragons, humans flying unaided) is out; (3) it depicts persons, objects, places, entities or events; (4) it would **falsely appear authentic or truthful**. The test is **objective — no intent to deceive is required** (§114). Photorealism makes deep-fake status more likely but is not determinative.

**Audience standard differs from 50(1) (§115)**: not the hypothetical average person. Where children, the elderly or lower-literacy users are in the **reasonably foreseeable** audience, false appearance **to that part of the audience suffices**. Deployers need not account for onward dissemination beyond the intended distribution channels.

**Not deep fakes (§116, examples)**: insignificant manipulations (background edits, lighting, colour correction, noise reduction, compression, cosmetic adjustment); AI voice replication for fictional characters; real actors against an AI-generated background; a real product against an AI background where the ad does not mislead about the product. But **substantial AI editing of journalistic images beyond standard editorial practice is** a deep fake.

**Obligation (deployer)**: **disclose that the content has been artificially generated or manipulated** — clear, distinguishable, and **perceivable without any technical tool or dedicated action** (§117). **The provider's Art. 50(2) machine-readable mark does not discharge this duty.** Where content is disseminated on a VLOP that offers labelling tools, the deployer may rely on those tools within that platform (§127).

**Exception A**: where the use is authorised by law to detect, prevent, investigate, or prosecute criminal offences. **Limited exception** for **evidently artistic, creative, satirical, fictional, or analogous works**: the disclosure obligation is limited to disclosure of the existence of generated/manipulated content **in an appropriate manner that does not hamper the display or enjoyment of the work**.
- **'Evidently' is read strictly (§122)**: the category must be evident to the exposed persons, judged on characteristic formats or styles, context of presentation, and audience expectations. Ambiguous content is excluded. **Where a deep fake mixes an informative and a creative character, the informative character prevails and standard labelling applies.**
- It is an **attenuation, not an exemption** (§123): disclosure is still required, and Art. 50(5) applies in full.
- *Applies*: de-aged or digitally replicated actors in a film; AI music in the style of an existing artist; a clearly humorous satirical image of a politician; deep-fake simulations of real persons inside a game.
- *Does not apply*: teleshopping-style deep-fake product pitches; celebrity images implying events that never happened; a synthetic influencer reviewing a real sponsored product.

**Trigger B**: deployer of an AI system that generates or manipulates **text** which is published with the purpose of **informing the public on matters of public interest**. Three cumulative conditions (§131):
- **Published** = accessible to an indeterminate, fairly large number of unrelated readers, paywalled or not. **Not published**: small closed groups, private correspondence, internal corporate networks.
- **Informing the public** = communicating knowledge, opinions or facts. Very short texts cannot.
- **Matters of public interest** = relevant to society at large and meriting debate or scrutiny — politics, public administration, justice, fundamental rights, public security, public health, environment, consumer safety, and economic, financial, scientific or cultural developments.

*In scope*: an AI summary of a newspaper article on a council decision; AI-manipulated passages of a health-related lifestyle article; AI-manipulated corporate reports with investor information; an AI-generated storm warning from a meteorological institute. *Out of scope*: AI-generated fiction; ordinary advertising copy; a chatbot news summary visible only to the user who prompted it.

**Obligation (deployer)**: **disclose that the text has been artificially generated or manipulated** — same clarity standard as deep fakes (§132).

**Exception B**: text has undergone **human review or editorial control** and a natural or legal person holds **editorial responsibility** for the publication. Both conditions are cumulative (§133-138):
- **Human review** = deliberate examination of the **substance** by persons with relevant knowledge; **fact-checking the accuracy is a minimum requirement**. **Editorial control** = a responsible editorial entity able in practice to approve, alter or reject on substantive grounds.
- **Insufficient (§135)**: spell-checking, formal or procedural checks, the mere existence of an editorial policy, automated review, cursory sign-off.
- **§136**: any substantive AI intervention **after** editorial sign-off voids the exception.
- **§138**: the identity and contact details of the person or function holding editorial responsibility **should be publicly available in an easily findable location** (terms and conditions, colophon).

Also: where authorised by law to detect, prevent, investigate, or prosecute criminal offences.

### 50(5) — Information delivery

The information shall be provided to the natural persons concerned in a **clear and distinguishable manner at the latest at the time of the first interaction or exposure**. The information shall conform to applicable accessibility requirements.

- **Clear (§142)** = noticeable, easy to understand and accessible, including for persons with disabilities and for children where they are in the foreseeable audience. **Distinguishable** = easy to identify as separate from the surrounding content. Information buried in a manual, hidden behind menu layers, or placed in terms of use is **not** clear and distinguishable.
- **First exposure (§143)** means the first exposure of **each** natural person, not just the first one. For interactive systems, at least once at the start of each session; for 50(2) and 50(4), per output. Where people may not see content from its beginning, a beginning-only disclosure is inadequate and must be complemented later.
- **Accessibility (§144)**: Directives (EU) 2016/2102 and (EU) 2019/882 apply where relevant; Article 50 adds no accessibility requirements of its own.

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
- [ ] **Means of detection available to exposed persons, with human-readable results (50(2))** — marking alone is non-compliant

### As deployer:
- [ ] Affected persons informed about emotion recognition / biometric categorisation (50(3))
- [ ] Deep fake disclosure attached to outputs (50(4)) — perceivable without technical tools, not merely the provider's machine-readable mark
- [ ] AI-generated text disclosure on public-interest publications (50(4))

## Four delivery tests (50(5))

- [ ] Perceivable **without tools or dedicated actions**
- [ ] Delivered **at or before first exposure, to every exposed person** (per session for interactions, per output for content)
- [ ] **Specific to this system's outputs**, not a site-wide banner or a clause in the terms
- [ ] Accessible to the foreseeable audience, including children and persons with disabilities

## Dates

| Obligation | Applies from |
|---|---|
| Art. 50(1), (3), (4), (5) | 2 August 2026 — in force |
| Art. 50(2) marking and detection, systems placed on the market on or after 2 Aug 2026 | 2 August 2026 — in force |
| Art. 50(2) marking and detection, systems placed on the market before 2 Aug 2026 | 2 December 2026 |

> Dates per Art. 113 as amended by Reg. (EU) 2026/1744. Article 50 was not deferred.

## Exceptions analysis

[Note any law-enforcement, artistic-work, editorial-responsibility, or "obvious-AI" exceptions claimed and basis.]

## Implementation notes

- [UX placement, persistent indicator, accessibility, machine-readable format, detection means]
- [Code of Practice on Transparency of AI-generated Content (voluntary): signed / gap analysis performed / other evidence of equivalence]

## Disclaimer

This Article 50 check is a support tool. Implementation choices for transparency disclosures interact with consumer-protection law, marketing rules, and data-protection law. Penalties for non-compliance with Article 50 reach **EUR 15 million or 3% of total worldwide annual turnover, whichever is higher** (Art. 99(4)); for SMEs including start-ups, whichever is **lower**; for EU institutions, bodies and agencies, up to EUR 750 000.
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
| AI coding assistant generating source code | 50(2) not triggered — source code and adjacent artefacts are out of scope (§67) |
| AI translation of a document | 50(2) exempt as standard editing (§89-93); an AI **summary** of the same document is not |
| Internal AI assistant for AI-literate staff | 50(1) triggered but the 'obvious' exception is available (§44) |
| Consumer AI companion app | 50(1) applies; 'obvious' unavailable, and periodic reminders are expected (§40, §45) |
| Generative system launched before 2 Aug 2026 | 50(1) already in force; 50(2) marking and detection due by 2 December 2026 |
| B2B engineering-design generator, output confined internally | 50(2) marking and detection may be dispensed with (§87) if the three conditions are met |

## Limits of this task

- Does not assess interaction with the Digital Services Act (DSA) for very large online platforms. Note the complementarity with Art. 35(1)(k) DSA, which covers content that may falsely appear authentic **regardless of the technology used** and binds VLOP/VLOSE providers rather than deployers (§126).
- Does not provide technical specifications for watermarking / provenance — refer to C2PA, evolving CEN-CENELEC standards.
- Does not address sector-specific transparency overlays (e.g., financial advice disclosures).

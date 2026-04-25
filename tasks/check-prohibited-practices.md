# Task: Check prohibited practices (Article 5)

Verify whether a system triggers any of the eight prohibited AI practices under Article 5 of Regulation (EU) 2024/1689. Prohibited practices have been **applicable since 2 February 2025**.

## Goal

For each of the eight prohibitions, determine: **does the system fall within the prohibition?** If yes, the system cannot be lawfully placed on the market or put into service in the EU; the project must be stopped or fundamentally redesigned.

## Inputs needed

- System description (purpose, target users, technical approach)
- Deployment context (workplace? educational institution? public authority? law enforcement?)
- Inputs the system uses (subliminal stimuli? biometric data? behavioural profiling? facial images?)
- Outputs and their consequences (decisions affecting individuals? scoring? identification?)
- Geographic and operational scope

## Sources

Read first:

- [`references/extracts/ai-act-art-5-prohibited.md`](../references/extracts/ai-act-art-5-prohibited.md) — full text of Article 5
- [`references/extracts/ai-act-art-3-definitions.md`](../references/extracts/ai-act-art-3-definitions.md) — definitions used by Article 5 (e.g., "biometric data", "biometric categorisation", "real-time remote biometric identification")

## Procedure

For each of the eight prohibitions, work through the question grid below.

### Prohibition 1 — Subliminal, manipulative, or deceptive techniques (Art. 5(1)(a))

**Trigger**: AI system uses techniques **beyond a person's consciousness** or **purposefully manipulative or deceptive techniques** with the **objective or effect** of materially **distorting behaviour** by appreciably **impairing the ability to make an informed decision**, causing or reasonably likely to cause **significant harm**.

Questions:
- Are there hidden cues (subliminal audio/visual stimuli, dark patterns)?
- Is the user's autonomous decision-making impaired?
- Is significant harm reasonably foreseeable?

Note: legitimate persuasion (advertising, recommendation engines disclosing themselves) is generally **not** caught.

### Prohibition 2 — Exploitation of vulnerabilities (Art. 5(1)(b))

**Trigger**: AI system exploits any of the vulnerabilities of a natural person or specific group due to **age, disability, or specific social or economic situation**, with the objective or effect of materially distorting behaviour, causing or reasonably likely to cause significant harm.

Questions:
- Does the target audience include children, elderly, persons with disabilities, persons in financial hardship?
- Is the exploitation of that vulnerability part of the system's mechanism?

### Prohibition 3 — Social scoring (Art. 5(1)(c))

**Trigger**: AI system used by **public authorities or on their behalf** for the **evaluation or classification** of natural persons or groups based on their **social behaviour or known/inferred personal/personality characteristics**, leading to:

- (i) Detrimental or unfavourable treatment **in social contexts unrelated** to the data origin
- (ii) Detrimental or unfavourable treatment that is **unjustified or disproportionate** to the behaviour or its gravity

Note: private-sector "scoring" is **not** caught here (other rules apply, e.g., Annex III high-risk for credit scoring).

### Prohibition 4 — Predictive policing based on profiling alone (Art. 5(1)(d))

**Trigger**: AI system for risk assessment of natural persons to assess or predict the **risk of committing a criminal offence**, based **solely** on profiling or personality traits.

**Exception**: AI systems that **support** human assessment of involvement in criminal activity **already based on objective and verifiable facts** directly linked to a criminal activity are **not** prohibited.

### Prohibition 5 — Untargeted facial-image scraping (Art. 5(1)(e))

**Trigger**: AI system that creates or expands facial-recognition databases through **untargeted scraping** of facial images from the internet or CCTV footage.

Targeted use of facial images with proper legal basis (consent, specific investigation under existing legal framework) is not in scope; untargeted bulk scraping is.

### Prohibition 6 — Emotion recognition in workplaces and education (Art. 5(1)(f))

**Trigger**: AI system to **infer emotions** of natural persons in the areas of **workplace and educational institutions**.

**Exceptions**: medical or safety reasons (e.g., detecting drowsiness in safety-critical operations).

Note: emotion inference outside these areas is allowed but subject to Article 50 transparency obligations (people must be informed) and may be high-risk under Annex III if it falls in employment, education, biometrics, etc.

### Prohibition 7 — Biometric categorisation inferring sensitive attributes (Art. 5(1)(g))

**Trigger**: Biometric categorisation systems that **categorise natural persons individually** based on their biometric data to **deduce or infer**: race, political opinions, trade union membership, religious or philosophical beliefs, sex life, or sexual orientation.

**Exception**: lawful labelling or filtering of biometric datasets in the area of law enforcement.

### Prohibition 8 — Real-time remote biometric identification in publicly accessible spaces for law enforcement (Art. 5(1)(h))

**Trigger**: Use of **'real-time' remote biometric identification systems** in **publicly accessible spaces** for **the purposes of law enforcement**.

**Exceptions** (narrowly construed): targeted search for specific victims of crimes (abduction, trafficking, sexual exploitation, missing persons), prevention of substantial and imminent threat to life or terrorist attack, or localisation/identification of suspects of serious crimes (Annex II offences). Always subject to:

- Prior authorisation by a judicial authority or independent administrative authority (with limited urgency exception, ex post)
- Member State law transposing the exception (Member States can choose not to enable any exception)
- Strict necessity, proportionality, FRIA, and registration in EU database

Real-time means: capture, comparison, and identification all without significant delay (Art. 3(42)). Post-event remote biometric identification has separate rules (high-risk under Annex III).

## Output

```markdown
# Prohibited practices check — [system name]

**Date**: [YYYY-MM-DD]

## Summary

[CLEAR / ONE OR MORE PROHIBITIONS TRIGGERED / UNCLEAR — review by counsel required]

## Per-prohibition analysis

| # | Prohibition | Triggered? | Reasoning |
|---|---|---|---|
| 1 | Subliminal/manipulative/deceptive techniques (Art. 5(1)(a)) | [No / Possibly / Yes] | [...] |
| 2 | Exploitation of vulnerabilities (Art. 5(1)(b)) | ... | ... |
| 3 | Social scoring by public authorities (Art. 5(1)(c)) | ... | ... |
| 4 | Predictive policing based solely on profiling (Art. 5(1)(d)) | ... | ... |
| 5 | Untargeted facial-image scraping (Art. 5(1)(e)) | ... | ... |
| 6 | Emotion recognition at workplace/education (Art. 5(1)(f)) | ... | ... |
| 7 | Biometric categorisation inferring sensitive attributes (Art. 5(1)(g)) | ... | ... |
| 8 | Real-time remote biometric ID in public spaces / law enforcement (Art. 5(1)(h)) | ... | ... |

## Conclusion

[If triggered: STOP. Recommend redesign or abandonment. The system cannot be lawfully placed on the market or put into service. Penalties: up to EUR 35M or 7% of total worldwide annual turnover (Art. 99(3)).]

[If not triggered: proceed to high-risk classification (`classify-system.md` Step 4) or to Article 50 transparency check.]

## Disclaimer

Article 5 is the most stringent provision of the AI Act. Borderline cases must be reviewed by qualified counsel. The Commission may issue further guidelines (Art. 96) clarifying the scope of these prohibitions; track updates.
```

## Common borderline patterns

- **Persuasive design vs. manipulation**: legitimate UX persuasion (e.g., highlighted defaults, progress indicators) is generally not caught. Hidden manipulation that overrides informed decision-making is.
- **Nudging vulnerable groups in advertising**: targeted advertising to children based on inferred vulnerabilities is a likely trigger.
- **Private credit scoring**: not under Art. 5(1)(c) (which targets public-authority scoring), but is **high-risk** under Annex III area 5(b).
- **Workplace emotion recognition for safety (e.g., drowsiness in drivers)**: exempt; document the medical/safety rationale.
- **Categorisation of customers by demographics**: not the same as biometric categorisation under Art. 5(1)(g) — the latter requires biometric data and inference of sensitive attributes.

## Limits of this task

- Lists the eight prohibitions and the standard exceptions; does not analyse Member State law transposing optional derogations (e.g., real-time RBI for law enforcement).
- Cannot detect prohibitions buried in technical implementation that the user did not disclose.
- Decisions on borderline cases require legal counsel.

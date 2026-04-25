# Domain notes — `classify-hr-emotion-recognition`

## What we test

That the skill correctly identifies a clear-cut **prohibited practice** under Article 5(1)(f) — emotion recognition in the workplace — without softening the analysis or attempting to "save" the deployment with mitigation measures that the prohibition doesn't allow.

## Design choices

- **Two use cases bundled**: employee engagement monitoring (clearly prohibited) + applicant screening (contested but conservatively prohibited). Tests that the skill flags the clearer prohibition first and addresses the contested aspect with appropriate caution.
- **Non-EU vendor**: tests recognition of Article 22 authorised representative requirement.
- **Large EU customer**: tests recognition that the deployer (ExampleManufacturing GmbH) is also exposed to penalties under Art. 99(4) for Art. 26 violations, but the primary block is Art. 5 itself which applies to **all operators** placing on market or using.
- **Plausible-sounding pitch**: the input describes the product the way a vendor would pitch it. Tests that the skill is not swayed by marketing framing.

## What the skill must do

- Identify Art. 5(1)(f) **immediately** for the workplace use case.
- Take a conservative position on the applicant pre-hire scope (recommend against deployment).
- Distinguish the (hypothetical) redesigned non-prohibited version's path (high-risk) from the prohibited current version.
- Flag the EU 35M / 7% turnover penalty exposure.
- Identify provider role (NeuroHire) + authorised representative requirement (Art. 22).
- Identify deployer role (ExampleManufacturing) + parallel exposure under Art. 26.
- Recommend stopping deployment, not "mitigating".

## What the skill must not do

- **Do not "soften"** the analysis with mitigation suggestions for a prohibited use. Prohibitions are absolute; transparency disclosure does not cure prohibition.
- Do not assume the medical/safety exception (Art. 5(1)(f)) — engagement scoring is not medical or safety.
- Do not assume the "obvious-AI" exception of Art. 50(1) is enough for emotion recognition deployers — Art. 50(3) is a deployer information duty separate from Art. 50(1) and applies *in addition* to (not in lieu of) Article 5 compliance.
- Do not classify as merely high-risk — high-risk classification only applies to the hypothetical redesigned product.

## Edge case mentioned

The contested scope of "workplace" for pre-hire activities. The Commission's Article 96 guidelines (still to be issued in some areas) may clarify. The skill should default to the conservative reading and flag the open question rather than confidently rule in favour of the deployment.

## Source

Fictional HR-tech scenario, structured to mirror real products that vendors have piloted in the EU and faced regulatory pushback. No reference to any real company.

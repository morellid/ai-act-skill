# Domain notes — `classify-customer-service-chatbot`

## What we test

That the skill correctly classifies a typical B2C customer-service chatbot built on a third-party GPAI model as **limited risk / Article 50 transparency-only**, not as high-risk, and identifies the role chain (downstream provider of an AI system, not a GPAI provider).

## Design choices

- **Mainstream commercial use case**: this is the most common AI deployment; misclassifying it would damage credibility.
- **Third-party GPAI**: separates ExampleRetail's obligations from the GPAI model provider's Chapter V obligations. Tests that the skill draws the boundary correctly.
- **Multi-jurisdictional**: EU + UK + Switzerland. Reminder that the AI Act applies to systems used within the Union regardless of provider establishment.

## What the skill must do

- Identify ShopAssist as in-scope.
- Quickly clear the eight prohibitions.
- Quickly clear high-risk classification (no Annex III area triggered).
- Trigger Article 50(1) (chatbot disclosure) — the central obligation.
- Note the borderline status of Article 50(2) for synthetic content.
- Distinguish between ExampleRetail's role (downstream AI-system provider/deployer) and the upstream GPAI provider's role.
- Recommend AI literacy (Art. 4) — already in force.

## What the skill must not do

- Don't classify the chatbot as high-risk under Annex III area 5(a) (essential services) — retail customer service is not an "essential public assistance benefit".
- Don't burden ExampleRetail with GPAI provider obligations — they don't apply.
- Don't be vague about the obvious-AI exception in Art. 50(1); the skill should advise explicit disclosure as the safe default.

## Edge case mentioned

If ShopAssist evolves to include a personalised recommender that scores customers for offers, the analysis changes:
- Still not high-risk under area 5(b) (which is about creditworthiness scoring excluding fraud detection)
- Article 50(2) becomes more clearly triggered for AI-generated copy
- GDPR/DPIA implications grow

## Source

Fictional B2C retail scenario. No reference to any real company.

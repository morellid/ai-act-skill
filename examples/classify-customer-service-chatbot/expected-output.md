# Expected output — classification of ShopAssist

# AI Act classification — ShopAssist

**Date**: 2026-04-25
**Analysed system**: ShopAssist — LLM-powered customer-service chatbot for a B2C retailer

## Classification

- **In scope of the AI Act**: Yes
- **Type**: AI system (built on top of a GPAI model from a third party)
- **Risk tier**: **Limited risk** — Article 50 transparency-only
- **GPAI tier**: N/A for ExampleRetail (the GPAI model provider has its own Chapter V obligations — a separate analysis)
- **Organisation's role(s)**: **Provider** of the AI system ShopAssist; **deployer** for its own use; not subject to GPAI obligations as it does not develop or place a GPAI model on the market

## Reasoning

### Step 1 — In-scope test (Art. 2, Art. 3(1))

ShopAssist is a machine-based system operating with autonomy, infers responses from user inputs, and influences a virtual environment (e-commerce interaction). Placed on the EU market for users in the Union. **In scope** of the Regulation. Not exempt under Art. 2(3)–(8): not military, not research-only, not personal non-professional, not free and open source.

### Step 2 — Prohibited practices (Art. 5)

Quick screen — none triggered:
- 5(1)(a) subliminal/manipulative — no, standard customer service interaction with disclosed purpose
- 5(1)(b) exploitation of vulnerabilities — no
- 5(1)(c) social scoring (public authority) — no
- 5(1)(d) predictive policing — no
- 5(1)(e) untargeted facial-image scraping — no
- 5(1)(f) emotion recognition workplace/education — no
- 5(1)(g) biometric categorisation of sensitive attributes — no
- 5(1)(h) real-time RBI in public spaces — no

### Step 3 — High-risk analysis (Art. 6 + Annex III)

- Art. 6(1): not an Annex I product safety component requiring third-party CA
- Art. 6(2) Annex III scan:
  - Area 1 biometrics — no, no biometric data
  - Area 2 critical infrastructure — no
  - Area 3 education — no
  - Area 4 employment — no
  - Area 5 essential services — no (consumer retail, not essential public benefits, creditworthiness, life/health insurance, or emergency dispatch)
  - Area 6 law enforcement — no
  - Area 7 migration/asylum/border — no
  - Area 8 justice/democratic processes — no

**Not high-risk.**

### Step 4 — GPAI analysis

- ExampleRetail does not provide a GPAI model — it integrates a third-party API. ExampleRetail's obligations are AI-system-level, not GPAI-level.
- The third-party GPAI model provider has its own Chapter V obligations (Articles 53–55), independent of this analysis.
- ExampleRetail should obtain Annex XII downstream-provider documentation from the GPAI provider (Article 53(1)(b)).

### Step 5 — Article 50 transparency triggers

- **50(1) — direct interaction with natural persons**: **TRIGGERED**. ShopAssist is a chatbot for customers. ExampleRetail (as provider of ShopAssist) must ensure users are informed they are interacting with an AI. The "obvious from a reasonably well-informed person" exception is risky for retail contexts where users may believe they are texting a human agent — disclose explicitly.
- 50(2) — synthetic content output: borderline. ShopAssist generates text replies. If those replies are short customer-service exchanges, the practical interpretation is that the disclosure under 50(1) doubles as the indication that the content is AI-generated; large-scale synthetic content (e.g., AI-written long-form articles) would clearly trigger 50(2). Track the AI Office code-of-practice for marking standards (Art. 50(7)).
- 50(3) — emotion recognition / biometric categorisation: not triggered.
- 50(4) — deep fakes / AI-generated public-interest text: not triggered.

## Applicable dates

| Obligation | Applies from | Status as of 2026-04-25 |
|---|---|---|
| Prohibitions (Art. 5) + AI literacy (Art. 4) | 2 February 2025 | In force |
| GPAI obligations (relevant to the upstream model provider) | 2 August 2025 | In force |
| Article 50 transparency | **2 August 2026** | Pending |
| High-risk Annex III obligations (not applicable here) | 2 August 2026 | N/A |

## Next-task recommendations

- [x] Run [`tasks/check-transparency.md`](../../tasks/check-transparency.md) for the Article 50 obligations applicable from 2 August 2026
- [ ] Confirm the third-party GPAI provider supplies Annex XII documentation
- [ ] Implement AI literacy measures (Art. 4) for ExampleRetail staff who configure or operate the system

## Concrete actions for ExampleRetail

1. **First-message disclosure**: ShopAssist's first message to a user must include text such as "Hi, I'm ShopAssist — an AI assistant. I can help with products, orders, and returns; I'll connect you to a colleague for anything else."
2. **Persistent indicator**: a small badge in the chat UI ("AI assistant") for the duration of the session.
3. **Accessibility**: AI status disclosure must be perceivable (screen-reader compatible, not relying on colour alone).
4. **Track**: AI Office code-of-practice for content marking under Art. 50(7); adopt machine-readable provenance markers for any AI-generated content beyond conversational text (e.g., AI-generated product descriptions or reviews — these would more clearly trigger 50(2)).
5. **AI literacy** (Art. 4): in force since 2 February 2025. Train staff who design, configure, or operate ShopAssist.
6. **Documentation chain**: obtain and retain Annex XII documentation from the GPAI provider, including the public training-data summary (Art. 53(1)(d)).

## Limits of this classification

- Assumes ShopAssist does not perform recommendation profiling beyond standard search/filter. If a recommender component scores users for personalised offers, re-evaluate against Annex III area 5(b) (creditworthiness — likely not relevant) and Article 50(2).
- Does not address GDPR obligations (Art. 30 register, possible DPIA for tracking integration).
- Does not address Digital Services Act obligations applicable to the e-commerce platform.

## Disclaimer

Support tool, not legal advice. Final classification and Article 50 implementation should be reviewed by qualified counsel before launch in the EU market.

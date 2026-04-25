# Example input — classify a customer-service chatbot

> Synthetic test fixture. Names and details are fictional.

## System

**Name**: ShopAssist

**Provider**: ExampleRetail B.V. (Netherlands, EU-established)

**Description**: an LLM-powered chatbot embedded on a B2C e-commerce site selling clothing and home goods. Available 24/7 to customers and prospects. Functions:

- Answer questions about products, sizes, return policy, shipping
- Help users find products through natural-language search ("blue summer dress, size M, under EUR 80")
- Resolve simple issues: track order, request return label, change delivery address before dispatch
- Escalate to human agent for complex cases (refunds beyond policy, complaints, account issues)

**Underlying technology**: third-party GPAI model (commercial API), retrieval over the company's product catalogue and policy documents, custom prompts and guardrails. ExampleRetail does not train or fine-tune the model.

**Deployment**: production website covering customers in the EU, UK, and Switzerland. ~2M visitors/month.

**Personal data**: collects user inputs (typed messages), session ID, and where logged in, the customer ID. Does not perform profiling or scoring of customers.

## Question

Classify ShopAssist under the AI Act. Identify ExampleRetail's role and the applicable obligations.

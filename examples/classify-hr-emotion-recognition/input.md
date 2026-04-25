# Example input — classify an HR emotion-recognition tool

> Synthetic test fixture. Names and details are fictional.

## System

**Name**: TalentSignal

**Vendor (US)**: NeuroHire Inc., headquartered in Delaware. No EU establishment. Sells globally including to EU customers.

**Sample customer in EU**: ExampleManufacturing GmbH (Germany, 8 000 employees), evaluating TalentSignal for use in screening external job applicants and for periodic engagement assessment of current employees.

## Description

TalentSignal is a SaaS platform that analyses recorded video interviews and webcam-captured working sessions of employees to **infer emotional states** (engagement, stress, motivation, focus, frustration). It outputs:

- For applicants: an "emotional fit" score on a 0–100 scale, intended to help recruiters compare candidates
- For employees: monthly "engagement reports" highlighting individuals or teams flagged as potentially disengaged, stressed, or showing performance concerns

Underlying tech: a proprietary computer-vision model trained on a labelled emotion dataset, plus voice-tone analysis. Outputs are presented in a dashboard for HR managers, with explanations of which features drove the score (eyebrow position, voice prosody markers, etc.).

Deployment: SaaS, deployed in customer's HR stack. Customers configure thresholds and which decisions to base on the outputs.

## Question

Classify TalentSignal under the AI Act. Can it be lawfully placed on the EU market or used in the EU?

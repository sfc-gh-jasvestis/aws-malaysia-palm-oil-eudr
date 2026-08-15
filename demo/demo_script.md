# Demo Script: EUDR Sustainability Compliance
## ~4-Minute Recorded Walkthrough
**Format**: Screen recording with voiceover
**Target**: Customer meeting / booth loop / social share
**Narrative**: "Snowflake indexes the full EUDR regulation, parses certification documents with AI, and tracks compliance gaps across 200 plantations — all native SQL, no external NLP platform needed"
**Demo Mode**: Open app with `?demo=true` for presenter notes

---

## Two Personas

| Persona | Role | Tool | What they care about |
|---|---|---|---|
| **Dato' Sri Mohd Bakke** | CEO Palm Oil Group | React App (SPCS) | Group-level EUDR readiness, export revenue risk, board reporting, regulatory timeline |
| **Dr. Ng Siew Mei** | Sustainability Director | Amazon QuickSight | Certification gaps, deforestation-free evidence, due diligence documentation, RSPO alignment |

---

## What's Built

| Layer | Component | Detail |
|---|---|---|
| **RAW** | 7 tables | PLANTATIONS (200), CERTIFICATIONS (1500), SUPPLY_CHAIN_EVENTS (50000), EUDR_REQUIREMENTS (500), COMPLIANCE_DOCS (150), DEFORESTATION_ALERTS (5000), MPOB_REFERENCE (50) |
| **CURATED** | 4 Dynamic Tables | PLANTATION_COMPLIANCE_STATUS, CERTIFICATION_TIMELINE, SUPPLY_CHAIN_TRACEABILITY, DEFORESTATION_RISK_SCORE |
| **ML** | ML.CLASSIFICATION | Forecasting + anomaly detection |
| **AI** | AI_PARSE_DOCUMENT, AI_EXTRACT, SUMMARIZE | Classification + extraction |
| **Search** | Cortex Search | 500 documents indexed |
| **Agent** | EUDR_COMPLIANCE_AGENT | Semantic View + Search tools |


---

## The Story

Malaysia is the world's second-largest palm oil producer. EU Regulation 2023/1115 (EUDR) requires full deforestation-free proof for every shipment entering the EU by December 2025. A major Malaysian palm oil group with 200 plantations finds 23 estates non-compliant — putting RM 4.8B in annual EU export revenue at risk. The compliance team needs to parse 500 regulation clauses, audit 1,500 certifications, and close gaps in 87 days.

---

## Script

### [0:00–0:45] EXECUTIVE COCKPIT

**Show**: Executive Cockpit tab

> "EUDR deadline in 87 days — 23 of 200 plantations non-compliant (11.5%)."

**Action**: Point at the 87-day countdown KPI

### [0:45–1:30] COMPLIANCE GAPS

**Show**: Compliance Gaps tab

> "Article 9 geolocation evidence is the biggest gap — 15 plantations missing polygon data."

**Action**: Click the 'Geolocation' gap category

### [1:30–2:15] EUDR SEARCH

**Show**: EUDR Search tab

> "Full text of EU Regulation 2023/1115 indexed in Cortex Search — 500 clauses searchable."

**Action**: Type: 'geolocation requirements for palm oil'

### [2:15–3:00] ASK AI

**Show**: Ask AI tab

> "Dato' Sri asks: 'What's our total revenue at risk from non-compliant plantations?'"

**Action**: Type: 'What revenue is at risk from non-compliant plantations?'

### [3:00–3:45] ARCHITECTURE & DATA

**Show**: Architecture & Data tab

> "Six Snowflake capabilities, six AWS services."

**Action**: Walk through architecture diagram


---

## Key Demo Differentiators

1. **Cortex Search on full EUDR regulation text** — Only demo indexing and searching the actual EU regulation (500 clauses)
2. **AI_PARSE_DOCUMENT for certification extraction** — Only demo using document AI to parse RSPO/MSPO certification PDFs
3. **ML.CLASSIFICATION for compliance risk scoring** — Only demo using classification to score plantation compliance risk
4. **Malaysian palm oil EUDR context** — World's 2nd largest producer facing existential EU market access risk
5. **Dynamic Tables for real-time compliance tracking** — Compliance gaps update automatically as new certifications are parsed
6. **AWS Textract + Comprehend integration** — Only demo combining document OCR with regulatory entity extraction for compliance


---

## Demo Prep Checklist

### Data Verification
- [ ] `SELECT COUNT(*) FROM PALM_OIL_EUDR.RAW.PLANTATIONS` → 200
- [ ] `SELECT COUNT(*) FROM PALM_OIL_EUDR.RAW.CERTIFICATIONS` → 1500
- [ ] `SELECT COUNT(*) FROM PALM_OIL_EUDR.RAW.SUPPLY_CHAIN_EVENTS` → 50000

### ML Model Verification
- [ ] `SELECT COUNT(*) FROM PALM_OIL_EUDR.ML.COMPLIANCE_RISK_RESULTS` → >0

### AI/Agent Verification
- [ ] `SELECT COUNT(*) FROM PALM_OIL_EUDR.AI.PARSED_CERTIFICATIONS` → >=1500
- [ ] `SELECT COUNT(*) FROM PALM_OIL_EUDR.AI.EUDR_CLAUSE_EXTRACTIONS` → 500


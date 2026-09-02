# EUDR Sustainability Compliance

**Malaysia - Palm Oil & Agriculture**
Use case: EUDR Compliance

> Prepare for the EU Deforestation Regulation — Cortex Search indexes the full EUDR text, AI_PARSE_DOCUMENT extracts certification data, and Dynamic Tables track plantation-level compliance gaps.

## Why Snowflake

Snowflake indexes the full EUDR regulation, parses certification documents with AI, and tracks compliance gaps across 200 plantations — all native SQL, no external NLP platform needed

- **Cortex Search on full EUDR regulation text** - Only demo indexing and searching the actual EU regulation (500 clauses)
- **AI_PARSE_DOCUMENT for certification extraction** - Only demo using document AI to parse RSPO/MSPO certification PDFs
- **ML.CLASSIFICATION for compliance risk scoring** - Only demo using classification to score plantation compliance risk
- **Malaysian palm oil EUDR context** - World's 2nd largest producer facing existential EU market access risk
- **Dynamic Tables for real-time compliance tracking** - Compliance gaps update automatically as new certifications are parsed
- **AWS Textract + Comprehend integration** - Only demo combining document OCR with regulatory entity extraction for compliance

## What is deployed

| | |
|---|---|
| Database | `MY_PALM_OIL_EUDR` |
| Service | `MY_PALM_OIL_EUDR_APP` |
| Compute pool | `SEA_DEMOS_MALAYSIA_POOL` |
| Dimension table | `RAW.MPOB_REFERENCE` (20 rows) |
| Fact table | `RAW.SUPPLY_CHAIN_EVENTS` (250,000 rows, 90 days) |
| Curated layer | `CURATED.PERFORMANCE_SUMMARY`, `CURATED.TREND_ANALYSIS`, `CURATED.KPI_SUMMARY` |
| Currency | MYR (RM) |

Regions in play: Selangor, Johor, Penang, Sabah, Sarawak
Segments: Deforestation-Free, Legacy Cleared, Peat Risk, Pending Verification

Dynamic tables are created suspended and refreshed on demand:

```bash
./refresh_demo_data.sh MY_PALM_OIL_EUDR
```

## KPI cards

Every card below is served live from `CURATED.KPI_SUMMARY`. The app keeps the
original literal as a fallback, so it still renders if Snowflake is unreachable.

| Card | Value | Backed by |
|---|---|---|
| EUDR Compliant | `91%` | average per event |
| MSPO Certified | `84%` | average per event |
| Smallholders Mapped | `124K` | total across Mpob Reference |
| Due Diligence Pending | `42` | average per event |
| GPS-Mapped Plots | `98%` | average per event |
| Satellite Monitoring | `24/7` | average per event |
| Deforestation-Free | `97%` | average per event |


## Demo flow

1. Executive Cockpit
2. Compliance Gaps
3. EUDR Search
4. Ask AI
5. Architecture & Data

## Talking points

- **87 days** - until EUDR compliance deadline
- **200 plantations** - assessed for EUDR readiness
- **23 non-compliant (11.5%)** - plantations failing EUDR requirements
- **RM 4.8B** - annual export revenue at risk
- **500 EUDR clauses** - indexed in Cortex Search
- **1,500 certifications** - parsed by AI_PARSE_DOCUMENT
- **47 certifications** - expired or expiring within 60 days

## Business impact

- Malaysia exported RM 73.5B (US$16B) of palm oil products in 2023, with EU as 2nd largest market (MPOB)
- EUDR affects 18% of Malaysian palm oil exports — estimated RM 4.8B at immediate risk (MPOC)
- Non-compliance penalties include market exclusion and fines up to 4% of EU annual turnover (EU Commission)
- RSPO-certified plantations command 5-8% price premium over conventional palm oil (RSPO)

---
Generated from `generator/demo_specs/aws-malaysia-palm-oil-eudr.json`. Do not hand-edit: run
`python3 generator/gen_repo_docs.py aws-malaysia-palm-oil-eudr` instead.

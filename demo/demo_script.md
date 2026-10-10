# Malaysia Palm Oil EUDR Readiness

**Malaysia - Palm oil supply chain**
Use case: plot-level traceability and deforestation screening for a fictional Malaysian palm oil group

> A fictional group buys fresh fruit bunches (FFB) through 40 supply bases: 8 mill-hub cities in Sabah, Sarawak and Peninsular Malaysia, crossed with 5 supplier types. The demo shows dynamic-table KPIs, a holdout-evaluated canopy-loss classifier, an FFB delivery forecast and grounded AI answers. Screening results are demo signals, not compliance verdicts.

## Why Snowflake

- **Dynamic tables** reconcile FFB deliveries, plot traceability, screening flags, confirmed canopy-loss cases and declaration rates from the RAW supply-base data; `run_core.py` checks the reconciliation on every build
- **Canopy-loss classification** scores each supply base's probability of a confirmed case in the next 7 days, with published holdout metrics
- **Delivery forecast** projects 14 days of group-wide FFB deliveries with prediction intervals, for mill intake planning
- **Grounded AI**: the Cortex Agent (Analyst over a semantic view, plus Search over SOPs) shows its SQL and SOP citations
- **Live deliveries**: a native weighbridge simulator (Snowflake only) or S3 uploads loaded by Snowpipe (AWS build), then an alert and email

## What is built

| | |
|---|---|
| Dimension table | `RAW.SUPPLY_BASES` (40 rows) |
| Fact table | `RAW.SUPPLY_DAILY` (3,600 supply-base-days, 90 days) |
| Curated layer | `CURATED.KPI_SUMMARY`, `PERFORMANCE_SUMMARY`, `SIGNAL_SUMMARY`, `TREND_ANALYSIS` |
| ML | `ML.CANOPY_RISK_SCORES`, `ML.CANOPY_RISK_HOLDOUT_METRICS`, `ML.DELIVERY_FORECAST`, `ML.GEO_MISMATCH_ANOMALIES` |

Mill-hub cities: Sandakan, Lahad Datu and Tawau (Sabah); Sibu, Miri and Bintulu (Sarawak); Kuantan and Teluk Intan (Peninsular Malaysia).
Supplier types: Own estate, Organised smallholders, Independent smallholders, FFB dealers, Third-party mills.

## KPI cards (live from `CURATED.KPI_SUMMARY`; no fallback values)

| Card | Value from the seeded data |
|---|---|
| Traceability to Plot | 77.7% |
| FFB Deliveries | 175,058 |
| FFB Intake (kt) | 993 |
| Screening Flags | 643 |
| Confirmed Canopy-Loss Cases | 186 |
| Flag Precision | 28.9% |
| Lots Excluded from EU Stock | 74 |
| Supplier Declaration Rate | 70.4% |
| Supply Bases Monitored | 40 |
| Plot Geolocation Coverage | 66.5% |
| Geolocation Checks Pending | 2,429 |
| Registered Plots | 20,873 |

Values are synthetic. A rebuild reproduces them because the data is HASH-seeded; dates are relative to the build day.

## Demo flow

1. Executive Cockpit (Nurul): KPIs, daily FFB deliveries against screening flags, flags and confirmed cases by risk signal, supply base table
2. Predictive (Kelvin): holdout metrics, risk bands, 14-day FFB delivery forecast, geolocation mismatch anomalies
3. Plot Registry (Kelvin): declaration rate, plot geolocation coverage and pending checks, declaration rate against confirmed cases, then generate the action memo
4. Live Deliveries: run `CALL APP.SIMULATE_DELIVERIES(20)` (Snowflake only) or `python aws/publish_deliveries.py --account <AWS_ACCOUNT_ID> --count 20` (AWS build). Then run `EXECUTE ALERT APP.LIVE_DELIVERY_ALERT` and show the alert log and email.
5. Ask AI (Nurul): the Cortex Agent answers metric questions through the semantic view and cites SOPs from Cortex Search. The SQL is shown.
6. QuickSight (AWS build): the same Snowflake tables through DIRECT_QUERY
7. Architecture: both builds side by side

## Talking points

- Fewer than one screening flag in three is confirmed as canopy loss (28.9%). The rest are false positives, and that is where field verification time goes.
- FFB dealers trace the least intake to a geolocated plot (55.7%, against 93.5% for own estates), and the supply base with the most confirmed cases is a dealer base (SB-0031 Teluk Intan FFB dealers).
- Canopy loss alerts near plots produce the most confirmed cases. Fire hotspot cluster flags hit every supply base around a city at once and are never confirmed.
- The risk model is evaluated on a time-based holdout: precision 0.39 and recall 0.34 at 0.5, against a 0.22 base rate. Present it as triage, not a verdict.
- Fire hotspot cluster days are excluded from model training, because the supply base does not drive them.

## Business impact

Use only the sourced references in `README.md` (Business Impact).

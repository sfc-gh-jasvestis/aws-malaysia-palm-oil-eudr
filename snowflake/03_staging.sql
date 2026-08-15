-- ============================================================================
-- 03_STAGING.SQL — Generate synthetic data for EUDR Sustainability Compliance
-- Country: MALAYSIA | Currency: MYR
-- ============================================================================
USE DATABASE PALM_OIL_EUDR;
USE SCHEMA RAW;

-- Data generation scripts are demo-specific.
-- See the handcrafted SQL in the aws-malaysia-semiconductor-yield demo for
-- the full pattern: GENERATOR + UNIFORM + LATERAL for distribution,
-- Cortex Complete for text generation, engineered key demo numbers.

-- Target row counts:
-- PLANTATIONS: 200 rows — Oil palm plantations with geolocation, concession area, and ownership
-- CERTIFICATIONS: 1,500 rows — RSPO, MSPO, ISCC certifications with expiry dates and scope
-- SUPPLY_CHAIN_EVENTS: 50,000 rows — Plantation-to-mill-to-port supply chain transactions
-- EUDR_REQUIREMENTS: 500 rows — EU Regulation 2023/1115 clauses parsed into structured requirements
-- COMPLIANCE_DOCS: 150 rows — Due diligence statements, audit reports, satellite imagery reports
-- DEFORESTATION_ALERTS: 5,000 rows — Global Forest Watch alerts within concession boundaries
-- MPOB_REFERENCE: 50 rows — Malaysian Palm Oil Board regulatory guidance and standards

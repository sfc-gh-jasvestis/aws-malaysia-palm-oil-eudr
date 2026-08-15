-- ============================================================================
-- 04_DYNAMIC_TABLES.SQL — Curated layer for EUDR Sustainability Compliance
-- ============================================================================
USE DATABASE PALM_OIL_EUDR;
USE SCHEMA CURATED;

-- PLANTATION_COMPLIANCE_STATUS: Per-plantation EUDR compliance score and gap analysis
-- Source: PLANTATIONS, CERTIFICATIONS, EUDR_REQUIREMENTS
CREATE OR REPLACE DYNAMIC TABLE CURATED.PLANTATION_COMPLIANCE_STATUS
  TARGET_LAG = '5 minutes'
  WAREHOUSE = EUDR_WH
AS
SELECT * FROM RAW.PLANTATIONS;
-- TODO: Replace with actual join/aggregation logic per demo

-- CERTIFICATION_TIMELINE: Certification expiry and renewal pipeline
-- Source: CERTIFICATIONS, PLANTATIONS
CREATE OR REPLACE DYNAMIC TABLE CURATED.CERTIFICATION_TIMELINE
  TARGET_LAG = '5 minutes'
  WAREHOUSE = EUDR_WH
AS
SELECT * FROM RAW.CERTIFICATIONS;
-- TODO: Replace with actual join/aggregation logic per demo

-- SUPPLY_CHAIN_TRACEABILITY: End-to-end chain from plantation to export port
-- Source: SUPPLY_CHAIN_EVENTS, PLANTATIONS
CREATE OR REPLACE DYNAMIC TABLE CURATED.SUPPLY_CHAIN_TRACEABILITY
  TARGET_LAG = '5 minutes'
  WAREHOUSE = EUDR_WH
AS
SELECT * FROM RAW.SUPPLY_CHAIN_EVENTS;
-- TODO: Replace with actual join/aggregation logic per demo

-- DEFORESTATION_RISK_SCORE: Satellite-based deforestation risk per concession
-- Source: PLANTATIONS, DEFORESTATION_ALERTS
CREATE OR REPLACE DYNAMIC TABLE CURATED.DEFORESTATION_RISK_SCORE
  TARGET_LAG = '5 minutes'
  WAREHOUSE = EUDR_WH
AS
SELECT * FROM RAW.PLANTATIONS;
-- TODO: Replace with actual join/aggregation logic per demo


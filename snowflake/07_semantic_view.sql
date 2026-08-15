-- ============================================================================
-- 07_SEMANTIC_VIEW.SQL — Semantic View for EUDR Sustainability Compliance
-- ============================================================================
USE DATABASE PALM_OIL_EUDR;
USE SCHEMA APP;

CREATE OR REPLACE SEMANTIC VIEW APP.EUDR_COMPLIANCE_ANALYTICS
  COMMENT = 'EUDR compliance, certification, and supply chain analytics'
AS
  TABLES (
    CURATED.PLANTATION_COMPLIANCE_STATUS AS plantation_compliance_status,CURATED.CERTIFICATION_TIMELINE AS certification_timeline,CURATED.SUPPLY_CHAIN_TRACEABILITY AS supply_chain_traceability,CURATED.DEFORESTATION_RISK_SCORE AS deforestation_risk_score
  );

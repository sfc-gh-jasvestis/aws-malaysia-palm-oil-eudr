-- ============================================================================
-- 06_ML_MODELS.SQL — ML Functions for EUDR Sustainability Compliance
-- ============================================================================
USE DATABASE PALM_OIL_EUDR;
USE SCHEMA ML;

-- ML.CLASSIFICATION: COMPLIANCE_RISK_MODEL
CREATE OR REPLACE SNOWFLAKE.ML.CLASSIFICATION ML.COMPLIANCE_RISK_MODEL(
  INPUT_DATA => SYSTEM$REFERENCE('TABLE', 'CURATED.PLANTATION_COMPLIANCE_STATUS'),
  TARGET_COLNAME => 'RISK_LEVEL'
);


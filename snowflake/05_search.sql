-- ============================================================================
-- 05_SEARCH.SQL — Cortex Search for EUDR Sustainability Compliance
-- ============================================================================
USE DATABASE PALM_OIL_EUDR;
USE SCHEMA SEARCH;

CREATE OR REPLACE CORTEX SEARCH SERVICE SEARCH.EUDR_COMPLIANCE_SEARCH
  ON CLAUSE_TEXT
  ATTRIBUTES ARTICLE_NUM, CHAPTER, OBLIGATION_TYPE
  WAREHOUSE = EUDR_WH
  TARGET_LAG = '1 hour'
AS (
  SELECT * FROM RAW.EUDR_REQUIREMENTS
);

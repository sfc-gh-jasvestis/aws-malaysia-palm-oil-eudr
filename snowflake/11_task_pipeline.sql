-- ============================================================================
-- 11_TASK_PIPELINE.SQL — Task DAG for EUDR Sustainability Compliance
-- ============================================================================
USE DATABASE PALM_OIL_EUDR;
USE SCHEMA APP;

CREATE OR REPLACE TASK APP.TASK_PARSE_NEW_DOCS
  WAREHOUSE = EUDR_WH
  SCHEDULE = 'USING CRON 0 */4 * * * UTC'
  COMMENT = 'Parse newly uploaded compliance documents'
AS
  SELECT 1; -- Replace with actual refresh logic

CREATE OR REPLACE TASK APP.TASK_REFRESH_COMPLIANCE
  WAREHOUSE = EUDR_WH
  AFTER APP.TASK_PARSE_NEW_DOCS
  COMMENT = 'Refresh compliance gap analysis'
AS
  SELECT 1; -- Replace with actual refresh logic

CREATE OR REPLACE TASK APP.TASK_REFRESH_ICEBERG
  WAREHOUSE = EUDR_WH
  AFTER APP.TASK_REFRESH_COMPLIANCE
  COMMENT = 'Refresh Iceberg export for auditor access'
AS
  SELECT 1; -- Replace with actual refresh logic

ALTER TASK APP.TASK_REFRESH_ICEBERG RESUME;
ALTER TASK APP.TASK_REFRESH_COMPLIANCE RESUME;
ALTER TASK APP.TASK_PARSE_NEW_DOCS RESUME;

-- ============================================================================
-- 10_ALERTS_NOTIFICATIONS.SQL — Alerts for EUDR Sustainability Compliance
-- ============================================================================
USE DATABASE PALM_OIL_EUDR;
USE SCHEMA APP;

-- Notification integration (email)
CREATE OR REPLACE NOTIFICATION INTEGRATION aws_malaysia_palm_oil_eudr_EMAIL_INT
  TYPE = EMAIL
  ENABLED = TRUE
  ALLOWED_RECIPIENTS = ('<YOUR_EMAIL>');

-- Alert: COMPLIANCE_GAP_ALERT
CREATE OR REPLACE ALERT APP.COMPLIANCE_GAP_ALERT
  WAREHOUSE = EUDR_WH
  SCHEDULE = '5 MINUTE'
  COMMENT = 'EUDR non-compliance threshold exceeded'
IF (EXISTS (
  SELECT 1 FROM CURATED.PLANTATION_COMPLIANCE_STATUS
  WHERE 1=1 -- Condition: NON_COMPLIANT_COUNT > 20 across plantations
))
THEN
  CALL SYSTEM$SEND_EMAIL(
    'aws_malaysia_palm_oil_eudr_EMAIL_INT',
    '<YOUR_EMAIL>',
    '[ALERT] EUDR Sustainability Compliance: EUDR non-compliance threshold exceeded',
    'EUDR non-compliance threshold exceeded'
  );

ALTER ALERT APP.COMPLIANCE_GAP_ALERT RESUME;

-- Alert: CERTIFICATION_EXPIRY_ALERT
CREATE OR REPLACE ALERT APP.CERTIFICATION_EXPIRY_ALERT
  WAREHOUSE = EUDR_WH
  SCHEDULE = '5 MINUTE'
  COMMENT = 'Certification expiring within 30 days'
IF (EXISTS (
  SELECT 1 FROM CURATED.PLANTATION_COMPLIANCE_STATUS
  WHERE 1=1 -- Condition: DAYS_TO_EXPIRY < 30 for any certification
))
THEN
  CALL SYSTEM$SEND_EMAIL(
    'aws_malaysia_palm_oil_eudr_EMAIL_INT',
    '<YOUR_EMAIL>',
    '[ALERT] EUDR Sustainability Compliance: Certification expiring within 30 days',
    'Certification expiring within 30 days'
  );

ALTER ALERT APP.CERTIFICATION_EXPIRY_ALERT RESUME;


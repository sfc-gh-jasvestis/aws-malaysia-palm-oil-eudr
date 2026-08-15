-- ============================================================================
-- 01_MARKETPLACE_INSTALL.SQL — Install marketplace data for EUDR Sustainability Compliance
-- ============================================================================
USE DATABASE PALM_OIL_EUDR;
USE SCHEMA RAW;

-- Free listings to install from Snowflake Marketplace:
-- Install: Snowflake Public Data (Free)
--   https://app.snowflake.com/marketplace/listing/GZTSZ290BV255

-- Paid listing (mock): Global Forest Watch Deforestation Alerts
--   Real data: https://app.snowflake.com/marketplace/listing/GZT0Z5I44YC
--   Using mock table: DEFORESTATION_ALERTS
CREATE TABLE IF NOT EXISTS RAW.DEFORESTATION_ALERTS (
  ID INT AUTOINCREMENT, DATA VARIANT, LOADED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP()
);

-- Paid listing (mock): CEIC ASEAN Macro
--   Real data: https://app.snowflake.com/marketplace/listing/GZTSZRC7HPI
--   Using mock table: MPOB_REFERENCE
CREATE TABLE IF NOT EXISTS RAW.MPOB_REFERENCE (
  ID INT AUTOINCREMENT, DATA VARIANT, LOADED_AT TIMESTAMP DEFAULT CURRENT_TIMESTAMP()
);


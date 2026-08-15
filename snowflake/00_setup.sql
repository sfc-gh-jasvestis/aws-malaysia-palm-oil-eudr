-- ============================================================================
-- EUDR Sustainability Compliance
-- Prepare for the EU Deforestation Regulation — Cortex Search indexes the full EUDR text, AI_PARSE_DOCUMENT extracts certification data, and Dynamic Tables track plantation-level compliance gaps.
-- ============================================================================
USE ROLE ACCOUNTADMIN;
CREATE DATABASE IF NOT EXISTS PALM_OIL_EUDR;
CREATE WAREHOUSE IF NOT EXISTS EUDR_WH WAREHOUSE_SIZE = 'MEDIUM' AUTO_SUSPEND = 120 AUTO_RESUME = TRUE;
USE DATABASE PALM_OIL_EUDR;
CREATE SCHEMA IF NOT EXISTS RAW;
CREATE SCHEMA IF NOT EXISTS CURATED;
CREATE SCHEMA IF NOT EXISTS ML;
CREATE SCHEMA IF NOT EXISTS AI;
CREATE SCHEMA IF NOT EXISTS SEARCH;
CREATE SCHEMA IF NOT EXISTS APP;

USE WAREHOUSE EUDR_WH;

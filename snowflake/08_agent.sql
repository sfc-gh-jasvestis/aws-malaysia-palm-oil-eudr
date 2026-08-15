-- ============================================================================
-- 08_AGENT.SQL — Cortex Agent for EUDR Sustainability Compliance
-- ============================================================================
USE DATABASE PALM_OIL_EUDR;
USE SCHEMA APP;

CREATE OR REPLACE CORTEX AGENT APP.EUDR_COMPLIANCE_AGENT
  COMMENT = 'EUDR Sustainability Compliance AI Assistant'
  MODEL = 'claude-opus-4-8'
  TOOLS = (
    SEMANTIC_VIEW_TOOL(SEMANTIC_VIEW => 'PALM_OIL_EUDR.APP.EUDR_COMPLIANCE_ANALYTICS'),    CORTEX_SEARCH_TOOL(CORTEX_SEARCH_SERVICE => 'PALM_OIL_EUDR.SEARCH.EUDR_COMPLIANCE_SEARCH', TOOL_DESCRIPTION => 'Search documents for Palm Oil & Agriculture information')
  )
  SYSTEM_PROMPT = 'You are the EUDR Compliance Agent for a Malaysian palm oil group with 200 plantations across Peninsular Malaysia, Sabah, and Sarawak.';

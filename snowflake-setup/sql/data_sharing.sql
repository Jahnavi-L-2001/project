-- =========================================================
-- 08_data_sharing.sql
-- Share curated/output objects with another Snowflake
-- account (or your own, for a self-share demo/test).
-- =========================================================

USE DATABASE ANALYTICS_DB;

-- Create the share
CREATE OR REPLACE SHARE sales_data_share;

-- Grant it access to the database/schema
GRANT USAGE ON DATABASE ANALYTICS_DB TO SHARE sales_data_share;
GRANT USAGE ON SCHEMA RAW TO SHARE sales_data_share;

-- Share specific objects — your sales mart, not the raw sensitive data
GRANT SELECT ON TABLE RAW.ORDERS TO SHARE sales_data_share;

-- If you want to share the dbt-built mart too, grant on its actual schema (DBT_JL or wherever it landed):
-- GRANT USAGE ON SCHEMA DBT_JL TO SHARE sales_data_share;
-- GRANT SELECT ON TABLE DBT_JL.MART_SALES_BY_CATEGORY TO SHARE sales_data_share;

-- Confirm what's in the share
SHOW SHARES;
DESC SHARE sales_data_share;

-- Account identifier, needed if you want to add a real consumer account to this share
SELECT CURRENT_ACCOUNT();
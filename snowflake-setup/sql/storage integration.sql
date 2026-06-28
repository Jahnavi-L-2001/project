-- =========================================================
-- 02_storage_integration.sql
-- Links Snowflake to the S3 bucket. Requires ACCOUNTADMIN
-- (or a role with CREATE INTEGRATION privilege).
-- Contains an AWS role ARN -> do NOT treat this file as
-- fully public; keep the bucket/role scoped tightly.
-- =========================================================

USE DATABASE ANALYTICS_DB;
USE SCHEMA RAW;

CREATE OR REPLACE STORAGE INTEGRATION s3_int
  TYPE = EXTERNAL_STAGE
  STORAGE_PROVIDER = 'S3'
  ENABLED = TRUE
  STORAGE_AWS_ROLE_ARN = 'arn:aws:iam::765425736190:role/snowflake_s3_role'
  STORAGE_ALLOWED_LOCATIONS = ('s3://marjsnfk/snowflake_dbt_project/');

DESC STORAGE INTEGRATION s3_int;
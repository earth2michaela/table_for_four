-- ============================================================================
-- STARTER SNIPPET 1 of 4 : staging DDL  (Healthcare - Table for Four)
-- Run from the project folder:
--   psql -h <HOST> -U <YOUR_ROLE> -d dataeng -f starter/01_create_staging_starter.sql
-- This creates ONE example table so you can see the pattern. YOU must write the
-- DDL for every other CSV in /data, choosing sensible data types.
-- If your instructor gave you your own schema (e.g. student_jdoe), replace
-- 'staging' below with that schema name.
-- Never put passwords in this file.
-- ============================================================================
CREATE SCHEMA IF NOT EXISTS staging;

DROP TABLE IF EXISTS staging.patients;
CREATE TABLE staging.patients (
    patient_id        VARCHAR(20),
    first_name        VARCHAR(100),
    last_name         VARCHAR(100),
    date_of_birth     DATE,
    gender            VARCHAR(100),
    zip_code          VARCHAR(100),
    insurance_id      VARCHAR(20),
    primary_language  VARCHAR(100),
    phone             VARCHAR(100),
    email             VARCHAR(100),
    registration_date DATE
);

-- Staging tables mirror the CSV exactly. We deliberately do NOT add PRIMARY KEY
-- or NOT NULL here: a staging table must accept whatever the source sends so you
-- can measure its quality afterwards (see 03_verify_starter.sql).

-- TODO: one CREATE TABLE per remaining CSV file (look at each header + data first!)

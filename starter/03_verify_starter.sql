-- ============================================================================
-- STARTER SNIPPET 3 of 4 : verification queries   (Healthcare)
-- Run after loading. Capture the output for your report (section 3.3).
-- ============================================================================

-- 1) Row count (compare to: wc -l data/patients.csv  minus 1 header line)
SELECT 'staging.patients' AS table_name, COUNT(*) AS row_count FROM staging.patients;

-- 2) Eyeball a few rows
SELECT * FROM staging.patients LIMIT 10;

-- 3) Null profile for every column (edit the column list for your table)
SELECT
    COUNT(*) FILTER (WHERE patient_id IS NULL) AS patient_id_nulls,
    COUNT(*) FILTER (WHERE first_name IS NULL) AS first_name_nulls,
    COUNT(*) FILTER (WHERE last_name IS NULL) AS last_name_nulls,
    COUNT(*) FILTER (WHERE date_of_birth IS NULL) AS date_of_birth_nulls,
    COUNT(*) FILTER (WHERE gender IS NULL) AS gender_nulls,
    COUNT(*) FILTER (WHERE zip_code IS NULL) AS zip_code_nulls,
    COUNT(*) FILTER (WHERE insurance_id IS NULL) AS insurance_id_nulls,
    COUNT(*) FILTER (WHERE primary_language IS NULL) AS primary_language_nulls,
    COUNT(*) FILTER (WHERE phone IS NULL) AS phone_nulls,
    COUNT(*) FILTER (WHERE email IS NULL) AS email_nulls,
    COUNT(*) FILTER (WHERE registration_date IS NULL) AS registration_date_nulls
FROM staging.patients;

-- 4) Is 'patient_id' really unique? (A key that is not unique changes your whole model.)
SELECT patient_id, COUNT(*) AS copies
FROM staging.patients
GROUP BY patient_id
HAVING COUNT(*) > 1
ORDER BY copies DESC
LIMIT 20;

-- 5) Profile the text columns: do category values look consistent?
--    (copy / paste this pattern for any column you want to inspect)
-- SELECT some_text_column, COUNT(*) FROM staging.patients GROUP BY 1 ORDER BY 2 DESC;

-- 6) Do the other files share this table's id? (example join check - adapt per file)
-- SELECT COUNT(*) FROM staging.<other_table> o
-- LEFT JOIN staging.patients t USING (patient_id)
-- WHERE t.patient_id IS NULL;

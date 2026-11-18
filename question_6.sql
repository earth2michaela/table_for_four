
SELECT
    p.patient_id,
    p.date_of_birth,
    EXTRACT(YEAR FROM AGE(CURRENT_DATE, p.date_of_birth::date)) AS age,
    CASE
        WHEN EXTRACT(YEAR FROM AGE(CURRENT_DATE, p.date_of_birth::date)) < 18 THEN 'Under 18'
        WHEN EXTRACT(YEAR FROM AGE(CURRENT_DATE, p.date_of_birth::date)) BETWEEN 18 AND 34 THEN '18-34'
        WHEN EXTRACT(YEAR FROM AGE(CURRENT_DATE, p.date_of_birth::date)) BETWEEN 35 AND 49 THEN '35-49'
        WHEN EXTRACT(YEAR FROM AGE(CURRENT_DATE, p.date_of_birth::date)) BETWEEN 50 AND 64 THEN '50-64'
        ELSE '65+'
    END AS age_group,
    p.gender,
    p.primary_language,
    i.insurance_id,
    i.payer_name,
    i.plan_type
FROM {{ ref('stg_patients') }} p
LEFT JOIN {{ ref('stg_insurance_plans') }} i
    ON p.insurance_id = i.insurance_id

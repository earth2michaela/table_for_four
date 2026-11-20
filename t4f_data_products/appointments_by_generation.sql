{{ config(materialized='table') }}

WITH patient_appointments AS (
    SELECT
        a.appointment_id,
        a.appointment_type,
        a.appointment_status,
        CASE
            WHEN p.dob IS NULL THEN 'Unknown'
            WHEN EXTRACT(YEAR FROM p.dob) <= 1945
                THEN 'Born before 1946'
            WHEN EXTRACT(YEAR FROM p.dob) BETWEEN 1946 AND 1964
                THEN 'Baby Boomers'
            WHEN EXTRACT(YEAR FROM p.dob) BETWEEN 1965 AND 1980
                THEN 'Generation X'
            WHEN EXTRACT(YEAR FROM p.dob) BETWEEN 1981 AND 1996
                THEN 'Millennials'
            WHEN EXTRACT(YEAR FROM p.dob) BETWEEN 1997 AND 2012
                THEN 'Generation Z'
            ELSE 'Born 2013 or later'
        END AS generation
    FROM {{ ref('fact_appointment') }} AS a
    LEFT JOIN {{ ref('dim_patient') }} AS p
        ON a.patient_key = p.patient_key
),
counts AS (
    SELECT
        'Appointment type' AS category,
        appointment_type AS category_value,
        generation,
        COUNT(DISTINCT appointment_id) AS appointment_count
    FROM patient_appointments
    WHERE generation <> 'Unknown'
    GROUP BY appointment_type, generation

    UNION ALL

    SELECT
        'Appointment status' AS category,
        appointment_status AS category_value,
        generation,
        COUNT(DISTINCT appointment_id) AS appointment_count
    FROM patient_appointments
    WHERE generation <> 'Unknown'
    GROUP BY appointment_status, generation
)
SELECT
    category,
    category_value,
    generation,
    appointment_count,
    DENSE_RANK() OVER (
        PARTITION BY category, category_value
        ORDER BY appointment_count DESC
    ) AS generation_rank
FROM counts
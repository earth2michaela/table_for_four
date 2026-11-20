{{ config(materialized='table') }}

SELECT
    i.insurance_key,
    i.insurer_name,
    i.plan_type,
    i.avg_copay,
    i.annual_deductible,
    COUNT(*) AS resolved_appointments,
    SUM(CASE WHEN LOWER(a.appointment_status) = 'no-show' THEN 1 ELSE 0 END) AS no_show_count,
    ROUND(
        100.0 * SUM(CASE WHEN LOWER(a.appointment_status) = 'no-show' THEN 1 ELSE 0 END)
        / COUNT(*), 2
    ) AS no_show_rate_pct
FROM {{ ref('fact_appointment') }} a
LEFT JOIN {{ ref('dim_insurance') }} i
    ON a.insurance_key = i.insurance_key
WHERE LOWER(a.appointment_status) IN ('completed', 'cancelled', 'no-show')
GROUP BY i.insurance_key, i.insurer_name, i.plan_type, i.avg_copay, i.annual_deductible

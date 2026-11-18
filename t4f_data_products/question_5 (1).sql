
SELECT
    a.appointment_status,
    a.appointment_type,
    i.payer_name,
    i.plan_type,
    COUNT(*) AS appointment_count
FROM {{ ref('stg_appointments') }} a
LEFT JOIN {{ ref('stg_patients') }} p
    ON a.patient_id = p.patient_id
LEFT JOIN {{ ref('stg_insurance_plans') }} i
    ON p.insurance_id = i.insurance_id
GROUP BY
    a.appointment_status,
    a.appointment_type,
    i.payer_name,
    i.plan_type
ORDER BY
    i.plan_type,
    a.appointment_status,
    a.appointment_type

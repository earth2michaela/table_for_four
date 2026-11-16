SELECT
    a.appointment_status,
    i.payer_name,
    i.plan_type,
    COUNT(i.insurance_id) AS insurance_count
FROM {{ ref('stg_appointments') }} a
LEFT JOIN {{ ref('stg_patients') }} p
    ON a.patient_id = p.patient_id
LEFT JOIN {{ ref('stg_insurance_plans') }} i
    ON p.insurance_id = i.insurance_id
GROUP BY
    a.appointment_status,
    i.payer_name,
    i.plan_type
ORDER BY
    a.appointment_status,
    insurance_count DESC
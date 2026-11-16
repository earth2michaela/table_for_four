{{ config(materialized="view") }}
SELECT f.appointment_id, f.appointment_type, f.appointment_status, f.scheduled_date, f.admit_date, f.discharge_date, d.diagnosis_category  
FROM  {{ref('fact_appointment')}} AS f
INNER JOIN {{ref('dim_diagnosis')}} AS d
ON f.diagnosis_key = d.diagnosis_key
WHERE d.chronic_flag = 1


{{ config(materialized="view") }}
SELECT f.appointment_id, f.encounter_occured, d.diagnosis_category, d.chronic_flag,fa.facility_name, fa.city, fa.state, de.department_name, f.admit_date, f.scheduled_date 
FROM  {{ref('fact_appointment')}} AS f
LEFT JOIN {{ref('dim_diagnosis')}} AS d
ON f.diagnosis_key = d.diagnosis_key
LEFT JOIN {{ref('dim_facility')}} AS fa
ON f.facility_key = fa.facility_key
LEFT JOIN {{ref('dim_department')}} AS de
ON f.department_key = de.department_key
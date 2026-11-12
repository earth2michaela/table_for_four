-- dim_patient.sql
{{ config(materialized="table") }}

select 
    patient_id as patient_key,
    first_name,
    last_name,
    date_of_birth as dob,
    gender,
    zip_code,
    primary_language,
    email,
    registration_date
from {{ref('stg_patients')}}
    

-- approach 2: flatten insurance plan within patient to make it star
-- select 
--     p.patient_id as patient_key,
--     p.first_name,
--     p.last_name,
--     p.date_of_birth as dob,
--     p.gender,
--     p.zip_code,
--     p.primary_language,
--     p.phone as phone_number,
--     p.email,
--     p.registration_date,

--     p.insurance_id,
--     i.payer_name,
--     i.plan_type,
--     i.avg_copay,
--     i.annual_deductible
-- from {{ref('stg_patients')}} p 
-- left join {{ref('stg_insurance_plans')}} i on i.insurance_id = p.patient_id
-- from {{ref('stg_patients')}}
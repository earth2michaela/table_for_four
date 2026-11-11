-- stg_patients.sql

select 
    patient_id,
    insurance_id,
    first_name,
    last_name,
    date_of_birth,
    gender,
    zip_code,
    primary_language,
    phone,
    email,
    registration_date::date as registration_date
from {{source('festival', 'patients')}}
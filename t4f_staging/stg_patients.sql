-- stg_patients.sql

select 
    patient_id,
    insurance_id,
    first_name,
    last_name,
    date_of_birth,
    CASE 
        when gender ilike '%F%' then 'F'
        else 'M'
        END AS gender,
    zip_code,
    primary_language,
    phone,
    email,
    registration_date::date as registration_date
from {{source('festival', 'patients')}}
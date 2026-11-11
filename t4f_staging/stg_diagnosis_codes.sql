-- stg_diagnosis_codes.sql

select 
    diagnosis_code,
    diagnosis_description,
    diagnosis_category,
    chronic_flag
from {{source('festival', 'diagnosis_codes')}}

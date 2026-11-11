-- dim_diagnosis.sql
{{ config(materialized="table") }}

select 
    diagnosis_code as diagnosis_key,
    diagnosis_description,
    diagnosis_category,
    chronic_flag
from {{ref('stg_diagnosis_codes')}}
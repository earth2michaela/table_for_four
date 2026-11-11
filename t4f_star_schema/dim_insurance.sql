-- dim_insurance.sql
{{ config(materialized="table") }}

select 
    insurance_id as insurance_key,
    payer_name as insurer_name,
    plan_type,
    avg_copaym
    annual_deductible
from {{ref('stg_insurance_plans')}}
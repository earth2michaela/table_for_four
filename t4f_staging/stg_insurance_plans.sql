-- stg_insurance_plans.sql

select distinct -- to remove the duplicate rows
    insurance_id,
    payer_name,
    plan_type,
    avg_copay,
    annual_deductible
from {{source('festival', 'insurance_plans')}}
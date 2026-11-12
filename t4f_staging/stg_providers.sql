-- stg_providers.sql

select
    provider_id,
    provider_name,
    specialty,
    npi_number,
    department_id,
    hire_date::date as hire_date
from {{source('festival', 'providers')}}
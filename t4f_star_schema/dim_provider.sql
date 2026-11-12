-- dim_provider.sql
{{ config(materialized="table") }}

select 
    provider_id as provider_key,
    provider_name,
    specialty as provider_specialty,
    npi_number,
    hire_date
from {{ref('stg_providers')}}

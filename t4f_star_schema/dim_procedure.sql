-- dim_procedire.sql
{{ config(materialized="table") }}

select 
    procedure_code as procedure_key,
    procedure_description,
    base_cost
from {{ref('stg_procedure_codes')}}
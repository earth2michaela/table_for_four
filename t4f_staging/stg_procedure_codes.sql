-- stg_procedure_codes.sql

select 
    procedure_code,
    procedure_description,
    base_cost
from {{source('festival', 'procedure_codes')}}
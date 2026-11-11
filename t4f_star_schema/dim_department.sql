-- dim_department.sql
{{ config(materialized="table") }}

select 
    department_id as department_key,
    department_name,
    cost_center
from {{ref('stg_departments')}}
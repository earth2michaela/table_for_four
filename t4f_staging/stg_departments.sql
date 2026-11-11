-- stg_departments.sql

select 
    department_id,
    facility_id,
    department_name,
    cost_center
from {{source('festival', 'departments')}}

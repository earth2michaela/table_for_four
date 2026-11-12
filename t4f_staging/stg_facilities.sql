-- stg_facilities.sql

select 
    facility_id,
    facility_name,
    city,
    state, 
    licensed_beds
from {{source('festival', 'facilities')}}
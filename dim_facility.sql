-- dim_facility.sql
{{ config(materialized="table") }}

select 
    facility_id as facility_key,
    facility_name,
    city,
    state,
    licensed_beds
from {{ref('stg_facilities')}}
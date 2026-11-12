-- stg_appointments.sql
-- grain: per appointment scheduled

select 
    appointment_id,
    patient_id,
    provider_id,
    facility_id,
    encounter_id,
    diagnosis_code,
    scheduled_date::date as scheduled_date,
    scheduled_time,
    LOWER(appointment_type) as appointment_type,
    LOWER(appointment_status) as appointment_status
from {{source('festival', 'appointments')}}



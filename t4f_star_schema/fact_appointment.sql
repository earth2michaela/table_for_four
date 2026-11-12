-- fact_appointment.sql

with a as (select * from {{ref('stg_appointments')}}),
    pt as (select * from {{ref('stg_patients')}}),
    e as (select * from {{ref('stg_encounters')}})

SELECT 
    a.appointment_id,
    a.encounter_id as encounter_id, -- null if never occured
    (a.encounter_id is not null) as encounter_occured, -- for quick look up

    -- key to dimensions
    a.patient_id as patient_key,
    a.provider_id as provider_key,
    a.facility_id as facility_key,
    a.diagnosis_code as diagnosis_key,
    e.department_id as department_key,   -- from encounter
    e.procedure_code as procedure_key,   -- from encounter
    pt.insurance_id as insurance_key,    -- from patient
    
    a.appointment_type,
    a.appointment_status,
    e.encounter_type,
    
    a.scheduled_date,
    a.scheduled_time,
    e.admit_date,
    e.discharge_date
from a
inner join pt on pt.patient_id = a.patient_id
left join e on e.encounter_id = a.encounter_id

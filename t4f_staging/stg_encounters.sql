-- stag_encounters.sql

select 
    encounter_id,
    patient_id,
    provider_id,
    facility_id,
    department_id, 
    diagnosis_code,
    procedure_code,
    encounter_type,
    admit_date::date,
    discharge_date::date,
    encounter_status,
    total_charge,
    insurance_paid,
    patient_paid
from {{source('festival', 'encounters')}}



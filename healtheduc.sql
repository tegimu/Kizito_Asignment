-- Death notification form
select 
doc::jsonb->>'_id'as id,
doc::jsonb->>'_rev'as rev,
doc::jsonb->>'form'as form,
doc::jsonb->>'from'as from,
doc::jsonb->>'type'as type,
doc::jsonb->'fields'->'meta'->>'instanceID'as instanceID,
<<<<<<< HEAD
doc::jsonb->'fields'->'meta'->>'deprecatedID'as deprecatedID,
doc::jsonb->'geolocation_log'->'recording'->>'speed' AS geolocation_log_speed,
doc::jsonb->'geolocation_log'->'recording'->>'heading' AS geolocation_log_heading, 	doc::jsonb->'geolocation_log'->'recording'->>'accuracy' AS geolocation_log_accuracy,
(doc::jsonb->'geolocation_log'->'recording'->>'altitude')::decimal AS geolocation_log_altitude,
(doc::jsonb->'geolocation_log'->'recording'->>'latitude'):: decimal AS geolocation_log_latitude,
(doc::jsonb->'geolocation_log'->'recording'->>'longitude'):: decimal AS geolocation_log_longitude,
doc::jsonb->'geolocation_log'->'recording'->>'altitudeAccuracy' AS altitudeAccuracy,
doc::jsonb->'geolocation_log'->>'timestamp' AS timestamp
 	
=======
doc::jsonb->'fields'->'meta'->>'deprecatedID'as deprecatedID
-- Add other fields as necessary by Anibare
doc::jsonb->'fields'->'inputs'->'user'->>'contact_id' AS user_contact_id,
doc::jsonb->'fields'->'inputs'->> 'source' AS source,
doc::jsonb->'fields'->'inputs'->'contact'->>'_id' AS contact_id,
doc::jsonb->'fields'->'inputs'->'contact'->>'sex' AS sex,
doc::jsonb->'fields'->'inputs'->'contact'->>'name' AS name,
doc::jsonb->'fields'->'inputs'->'contact'->'parent'->>'_id' AS parent_idl1,
doc::jsonb->'fields'->'inputs'->'contact'->'parent'->'parent'->>'_id' AS parent_idl2,
doc::jsonb->'fields'->'inputs'->'contact'->>'date_of_birth' AS date_of_birth,
doc::jsonb->'fields'->'inputs'->>'source_id' AS source_id,
doc::jsonb->'fields'->'inputs'->>'t_client_id' AS client_id,
doc::jsonb->'fields'->'inputs'->>'t_user_name' AS user_name,
doc::jsonb->'fields'->'inputs'->>'t_client_age' AS client_age,
doc::jsonb->'fields'->'inputs'->>'t_client_sex' AS client_sex,
doc::jsonb->'fields'->'inputs'->>'t_user_phone' AS user_phone,
doc::jsonb->'fields'->'inputs'->>'t_client_name' AS client_name,
doc::jsonb->'fields'->'inputs'->>'t_user_contact_id' AS user_contact_id,
doc::jsonb->'fields'->'inputs'->>'t_client_birth_date' AS client_birth_date,
doc::jsonb->'fields'->'inputs'->>'t_client_death_date' AS client_death_date,
doc::jsonb->'fields'->'inputs'->>'t_client_cause_of_death' AS client_cause_of_death,
doc::jsonb->'fields'->'inputs'->>'t_client_place_of_death' AS client_place_of_death,
doc::jsonb->'fields'->'inputs'->>'t_client_death_report_date' AS client_death_report_date,
doc::jsonb->'fields'->'inputs'->>'t_client_place_of_death_other' AS client_place_of_death_other,
doc::jsonb->'fields'->'inputs'->>'t_client_national_identification_number' AS client_national_identification_number,
doc::jsonb->'fields'->'r_summary'->>'submit' AS submit,
doc::jsonb->'fields'->'r_summary'->>'s_findings' AS s_findings,
doc::jsonb->'fields'->'r_summary'->>'summary_h1' AS summary_h1,
doc::jsonb->'fields'->'r_summary'->>'s_instruction' AS s_instruction,
doc::jsonb->'fields'->'r_summary'->>'s_actions_taken' AS s_actions_taken,
doc::jsonb->'fields'->'r_summary'->>'s_person_details' AS s_person_details,
doc::jsonb->'fields'->'r_summary'->>'actions_labels_en' AS actions_labels_en,
doc::jsonb->'fields'->'r_summary'->>'actions_labels_lg' AS actions_labels_lg,
doc::jsonb->'fields'->'r_summary'->>'s_verification_status' AS s_verification_status,
doc::jsonb->'fields'->'r_summary'->>'verification_status_label' AS verification_status_label,
doc::jsonb->'fields'->'r_summary'->>'s_death_verification_status' AS s_death_verification_status,
doc::jsonb->'fields'->>'patient_id' AS patient_id,
doc::jsonb->'fields'->>'date_of_death' AS date_of_death,
doc::jsonb->'fields'->>'needs_signoff' AS needs_signoff,
doc::jsonb->'fields'->>'supervisor_id' AS supervisor_id,
--others start from here
>>>>>>> 2748fc625772fe61ece81771ab984b90b614cb1b
FROM "Reports".death_notification
WHERE type = 'data_record'
AND TRIM(doc) LIKE '{%' -- Ensures it starts with an opening curly brace after trimming whitespace
AND doc::jsonb->>'form' = 'death_notification';
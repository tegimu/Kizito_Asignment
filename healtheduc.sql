-- Death notification form
select 
doc::jsonb->>'_id'as id,
doc::jsonb->>'_rev'as rev,
doc::jsonb->>'form'as form,
doc::jsonb->>'from'as from,
doc::jsonb->>'type'as type,
doc::jsonb->'fields'->'meta'->>'instanceID'as instanceID,
doc::jsonb->'fields'->'meta'->>'deprecatedID'as deprecatedID,
doc::jsonb->'geolocation_log'->'recording'->>'speed' AS geolocation_log_speed,
doc::jsonb->'geolocation_log'->'recording'->>'heading' AS geolocation_log_heading, 	doc::jsonb->'geolocation_log'->'recording'->>'accuracy' AS geolocation_log_accuracy,
(doc::jsonb->'geolocation_log'->'recording'->>'altitude')::decimal AS geolocation_log_altitude,
(doc::jsonb->'geolocation_log'->'recording'->>'latitude'):: decimal AS geolocation_log_latitude,
(doc::jsonb->'geolocation_log'->'recording'->>'longitude'):: decimal AS geolocation_log_longitude,
doc::jsonb->'geolocation_log'->'recording'->>'altitudeAccuracy' AS altitudeAccuracy,
doc::jsonb->'geolocation_log'->>'timestamp' AS timestamp
 	
FROM "Reports".death_notification
WHERE type = 'data_record'
AND TRIM(doc) LIKE '{%' -- Ensures it starts with an opening curly brace after trimming whitespace
AND doc::jsonb->>'form' = 'death_notification';
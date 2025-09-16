-- Death notification form
select 
doc::jsonb->>'_id'as id,
doc::jsonb->>'_rev'as rev,
doc::jsonb->>'form'as form,
doc::jsonb->>'from'as from,
doc::jsonb->>'type'as type,
doc::jsonb->'fields'->'meta'->>'instanceID'as instanceID,
doc::jsonb->'fields'->'meta'->>'deprecatedID'as deprecatedID
FROM "Reports".death_notification
WHERE type = 'data_record'
AND TRIM(doc) LIKE '{%' -- Ensures it starts with an opening curly brace after trimming whitespace
AND doc::jsonb->>'form' = 'death_notification';
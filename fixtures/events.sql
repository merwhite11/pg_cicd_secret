SELECT
    concat('evt_', toString(rand() % 100000)) AS event_id,
    concat('conv_', toString(rand() % 10000)) AS conversation_id,
    concat('usr_', toString(rand() % 5000)) AS user_id,
    ['message_sent', 'message_received', 'conversation_started', 'conversation_ended', 'user_typing'][(rand() % 5) + 1] AS event_type,
    toDateTime('2025-08-05') - toIntervalDay(rand() % 30) - toIntervalHour(rand() % 24) - toIntervalMinute(rand() % 60) AS event_timestamp,
    concat('{"content":"', toString(rand()), '","metadata":{"client":"web","version":"', toString(1 + rand() % 10), '.', toString(rand() % 10), '"}}') AS payload
FROM numbers(10)
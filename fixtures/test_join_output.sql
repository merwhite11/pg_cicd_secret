SELECT
    concat('evt_', toString(rand() % 10000)) AS event_id,
    concat('conv_', toString(rand() % 100)) AS conversation_id,
    concat('user_', toString(rand() % 500)) AS user_id,
    ['message_sent', 'message_received', 'conversation_started', 'conversation_ended', 'reaction_added'][(rand() % 5) + 1] AS event_type,
    now() - rand() % (86400 * 30) AS event_timestamp
FROM numbers(10)
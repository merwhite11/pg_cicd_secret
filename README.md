
# Tinybird PostgreSQL Integration Project

## Overview
This project demonstrates how to integrate Tinybird with PostgreSQL databases, allowing for efficient data querying and joining between Tinybird datasources and external PostgreSQL tables.

## Data Sources

### events
This datasource handles event data in NDJSON format with information about user interactions.

**Schema:**
- `event_id` - Unique identifier for each event
- `conversation_id` - Identifier linking to a conversation
- `user_id` - Identifier for the user who triggered the event
- `event_type` - Type of event that occurred
- `event_timestamp` - When the event occurred
- `payload` - Additional event data

**Ingestion Example:**
```bash
curl -X POST "https://api.us-west-2.aws.tinybird.co/v0/events?name=events" \
     -H "Authorization: Bearer $TB_ADMIN_TOKEN" \
     -d '{"event_id":"e123", "conversation_id":"c456", "user_id":"u789", "event_type":"message", "event_timestamp":"2023-06-15 10:30:00", "payload":"{\"text\":\"Hello world\"}"}'
```

### copy_pg_target
This datasource stores IDs copied from the PostgreSQL table through the copy_pg_query pipe.

**Schema:**
- `id` - String identifier copied from PostgreSQL

**Ingestion Example:**
```bash
curl -X POST "https://api.us-west-2.aws.tinybird.co/v0/events?name=copy_pg_target" \
     -H "Authorization: Bearer $TB_ADMIN_TOKEN" \
     -d '{"id":"c123"}'
```

### copy_pg_target_1
This datasource stores IDs copied from the PostgreSQL table through the pg_id_query_1 pipe.

**Schema:**
- `id` - String identifier copied from PostgreSQL

**Ingestion Example:**
```bash
curl -X POST "https://api.us-west-2.aws.tinybird.co/v0/events?name=copy_pg_target_1" \
     -H "Authorization: Bearer $TB_ADMIN_TOKEN" \
     -d '{"id":"c123"}'
```

### test_join_output
This datasource stores the output of the test_join pipe, containing joined event data with PostgreSQL records.

**Schema:**
- `event_id` - Unique identifier for each event
- `conversation_id` - Identifier linking to a conversation
- `user_id` - Identifier for the user who triggered the event
- `event_type` - Type of event that occurred
- `event_timestamp` - When the event occurred

**Ingestion Example:**
```bash
curl -X POST "https://api.us-west-2.aws.tinybird.co/v0/events?name=test_join_output" \
     -H "Authorization: Bearer $TB_ADMIN_TOKEN" \
     -d '{"event_id":"e123", "conversation_id":"c456", "user_id":"u789", "event_type":"message", "event_timestamp":"2023-06-15 10:30:00"}'
```

## Endpoints

### pg_id_query
This endpoint queries and returns IDs directly from a PostgreSQL table.

**Usage:**
```bash
curl -X GET "https://api.us-west-2.aws.tinybird.co/v0/pipes/pg_id_query.json?token=$TB_ADMIN_TOKEN"
```

### test_join
This endpoint demonstrates how to join data between Tinybird's events datasource and records from a PostgreSQL table.

**Usage:**
```bash
curl -X GET "https://api.us-west-2.aws.tinybird.co/v0/pipes/test_join.json?token=$TB_ADMIN_TOKEN"
```

### copy_pg_query
This is a COPY pipe that transfers IDs from PostgreSQL into the copy_pg_target datasource. This pipe is not an endpoint but is executed internally to populate the copy_pg_target datasource.

### pg_id_query_1
This is a COPY pipe that transfers IDs from PostgreSQL into the copy_pg_target_1 datasource.

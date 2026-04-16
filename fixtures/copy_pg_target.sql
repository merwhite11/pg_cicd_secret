SELECT
    concat('id_', toString(rand() % 10000)) AS id
FROM numbers(10)
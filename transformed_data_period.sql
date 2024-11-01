{{ config(materialized='table') }}

WITH source_data AS (
    SELECT
    index,
    to_timestamp("Arrival DtTm", 'YYYY/MM/DD HH12:MI:SS AM') AS arrival_date,
    to_timestamp("Alarm DtTm", 'YYYY/MM/DD HH12:MI:SS AM') AS alarm_date
    FROM
        case_study.fi_raw_data  
)

SELECT
    index AS tp_id,
    EXTRACT(EPOCH FROM (arrival_date - alarm_date)) / 60 AS time_period_min
FROM
    source_data
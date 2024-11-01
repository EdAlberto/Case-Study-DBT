{{ config(materialized='table') }}

WITH source_data AS (
    SELECT
    index,
    "Battalion"
    FROM
        case_study.fi_raw_data  
)

SELECT
    index AS nd_id,
    "Battalion" AS battalion
FROM
    source_data
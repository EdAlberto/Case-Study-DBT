{{ config(materialized='table') }}

WITH source_data AS (
    SELECT
    index,
    neighborhood_district AS district
    FROM
        case_study.fi_raw_data  
)

SELECT
    index AS nd_id,
    district
FROM
    source_data
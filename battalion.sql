{{ config(
    materialized='table'
) }}

select * from {{ ref('transformed_data_battalion') }}
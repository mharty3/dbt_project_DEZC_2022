{{ config(materialized='view') }}

select * from {{ source('staging', 'green_tripdata_partitoned') }}

limit 100


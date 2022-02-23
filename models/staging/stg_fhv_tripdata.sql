{{ config(materialized='view') }}


select 

dispatching_base_num,
pickup_datetime,
dropoff_datetime,
PULocationID as pickup_locationid,
DOLocationID as dropoff_locationid,
SR_Flag as sr_flag,
Affiliated_base_number as affiliated_base_number
		
from {{ source('staging', 'fhv_tripdata_partitoned') }}

-- dbt build --m <model.sql> --var 'is_test_run: false'
{% if var('is_test_run', default=true) %}

  limit 100

{% endif %}
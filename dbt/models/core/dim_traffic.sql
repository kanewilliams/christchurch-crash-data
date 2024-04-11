{{
    config(
        materialized='table'
    )
}}

with traffic_data as (
    select *
    from {{ ref('stg_traffic_data') }}
)

select Date, classweight, sum(trafficcount)
from traffic_data
group by Date, classweight
order by Date, classweight
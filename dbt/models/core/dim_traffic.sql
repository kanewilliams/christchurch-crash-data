{{
    config(
        materialized='table'
    )
}}

with traffic_data as (
    select *
    from {{ ref('stg_traffic_data') }}
)

select Date as year, sum(trafficcount) as total_traffic_count
from traffic_data
group by year
order by year

-- classweight TBD
-- select Date, classweight, sum(trafficcount) as total_traffic_count
-- from traffic_data
-- group by Date, classweight
-- order by Date, classweight
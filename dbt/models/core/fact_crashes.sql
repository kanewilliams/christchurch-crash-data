{{
    config(
        materialized='table'
    )
}}

with crashes as (
    select *
    from {{ ref('dim_crashes') }}
),
traffic as (
    select *
    from {{ ref('dim_traffic') }}
)


select crashes.year as year, crashes.fatal, traffic.total_traffic_count
from crashes 
left join traffic 
on crashes.year = traffic.year
order by year
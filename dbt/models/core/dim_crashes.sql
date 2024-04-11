{{
    config(
        materialized='table'
    )
}}

with crash_data as (
    select *
    from {{ ref('stg_crash_data') }}
)

select crashYear as year, has_bicycle, sum(fatalCount) as fatal
from crash_data
group by crashYear, has_bicycle
order by crashYear, has_bicycle
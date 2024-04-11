with 

source as (

    select * from {{ source('staging', 'traffic_data') }}

),

renamed as (

    select
        startdate,
        siteid,
        regionname,
        sitereference,
        classweight,
        sitedescription,
        lanenumber,
        flowdirection,
        trafficcount,
        date

    from source

)

select * from renamed

-- dbt build --select <model_name> --vars '{'is_test_run': 'false'}'
{% if var('is_test_run', default=true) %}

  limit 1000

{% endif %}
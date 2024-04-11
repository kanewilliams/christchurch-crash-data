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

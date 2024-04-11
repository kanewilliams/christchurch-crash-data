with 

source as (

    select * from {{ source('staging', 'crash_data') }}

),

renamed as (

    select
        x,
        y,
        objectid,
        advisoryspeed,
        areaunitid,
        bicycle,
        case when cast(bicycle as int) > 0 then 1 else 0 end as has_bicycle,
        bridge,
        cast(bus as int) as bus,
        carstationwagon,
        cliffbank,
        crashdirectiondescription,
        crashfinancialyear,
        crashlocation1,
        crashlocation2,
        crashroadsideroad,
        crashseverity,
        crashshdescription,
        crashyear,
        debris,
        directionroledescription,
        ditch,
        cast(fatalcount as int) as fatalcount,
        fence,
        flathill,
        guardrail,
        holiday,
        houseorbuilding,
        intersection,
        kerb,
        light,
        meshblockid,
        minorinjurycount,
        moped,
        motorcycle,
        numberoflanes,
        objectthrownordropped,
        otherobject,
        othervehicletype,
        overbank,
        parkedvehicle,
        pedestrian,
        phoneboxetc,
        postorpole,
        region,
        roadcharacter,
        roadlane,
        roadsurface,
        roadworks,
        schoolbus,
        seriousinjurycount,
        sliporflood,
        speedlimit,
        strayanimal,
        streetlight,
        suv,
        taxi,
        temporaryspeedlimit,
        tlaid,
        tlaname,
        trafficcontrol,
        trafficisland,
        trafficsign,
        train,
        tree,
        truck,
        unknownvehicletype,
        urban,
        vanorutility,
        vehicle,
        waterriver,
        weathera,
        weatherb

    from source

)

select * from renamed

-- dbt build --select <model_name> --vars '{'is_test_run': 'false'}'
{% if var('is_test_run', default=true) %}

  limit 1000

{% endif %}
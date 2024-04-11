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
        bridge,
        bus,
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
        fatalcount,
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

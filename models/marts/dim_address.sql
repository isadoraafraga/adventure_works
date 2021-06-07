with
    address as (
        select
            /*Primary Key*/
            addressid 

            /*Foreign Keys*/
            , stateprovinceid

           /*Other Columns*/
            , spatiallocation
            , rowguid
            , postalcode
            , modifieddate
            , city
            , addressline2
            , addressline1
        from {{ ref('stg_address')}}
    )

    ,    stateprovince as (
        select
             /*Primary Key*/
            stateprovinceid

            /*Foreign Keys*/
            , territoryid
            , countryregioncode

           /*Other Columns*/
            , stateprovincecode
            , rowguid
            , name
            , modifieddate
            , isonlystateprovinceflag
        from {{ ref('stg_stateprovince')}}
    )

    , transformed as (
        select
        row_number() over (order by addressid) as address_sk
            , address.addressid
            , address.stateprovinceid
            , address.spatiallocation
            , address.rowguid
            , address.postalcode
            , address.modifieddate
            , address.city
            , address.addressline2
            , address.addressline1
            , stateprovince.name
            , stateprovince.countryregioncode
        from address
        left join stateprovince on address.stateprovinceid = stateprovince.stateprovinceid
    )
    select * from transformed
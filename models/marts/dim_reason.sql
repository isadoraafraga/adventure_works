with
    reason as (
        select
            /*Primary Key*/
            salesreasonid

           /*Other Columns*/
            , name
            , modifieddate
            , reasontype
        from {{ ref('stg_salesreason')}}
    )

    ,    reasonorder as (
        select
            /*Primary Key*/
            salesreasonid

            /*Foreign Keys*/
            , salesorderid

           /*Other Columns*/
            , modifieddate
        from {{ ref('stg_orderheadersalesreason')}}
    )

    , transformed as (
        select
            reasonorder.salesreasonid
            , reasonorder.salesorderid
            , reason.name
            , reason.modifieddate
            , reason.reasontype
        from reasonorder
        left join reason on reasonorder.salesreasonid = reason.salesreasonid
    )
    select * from transformed
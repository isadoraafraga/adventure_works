with
    source as (
        select
            /*Primary Key*/
            salesorderid

            /*Foreign Keys*/
            , customerid
            , shipmethodid
            , billtoaddressid
            , salespersonid
            , currencyrateid
            , creditcardid
            , territoryid
            , shiptoaddressid

           /*Other Columns*/
            , purchaseordernumber
            , modifieddate
            , rowguid
            , taxamt
            , onlineorderflag
            , status
            , orderdate
            , creditcardapprovalcode
            , subtotal
            , revisionnumber
            , freight
            , duedate
            , totaldue
            , shipdate
            , accountnumber

           /*Stitch Columns*/
            , _sdc_batched_at
            , _sdc_extracted_at as last_etl_run
            , _sdc_received_at
            , _sdc_sequence
            , _sdc_table_version
        from {{ source('adventure_works','salesorderheader')}}
    )

    select * from source
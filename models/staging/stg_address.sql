with
    source as (
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

           /*Stitch Columns*/
            , _sdc_batched_at
            , _sdc_extracted_at as last_etl_run
            , _sdc_received_at
            , _sdc_sequence
            , _sdc_table_version
        from {{ source('adventure_works','address')}}
    )

    select * from source
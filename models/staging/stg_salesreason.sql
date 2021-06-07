with
    source as (
        select
            /*Primary Key*/
            salesreasonid

           /*Other Columns*/
            , name
            , modifieddate
            , reasontype
           
           /*Stitch Columns*/
            , _sdc_batched_at
            , _sdc_extracted_at as last_etl_run
            , _sdc_received_at
            , _sdc_sequence
            , _sdc_table_version
        from {{ source('adventure_works','salesreason')}}
    )

    select * from source
with
    source as (
        select
            /*Primary Key*/
            customerid

            /*Foreign Keys*/
            , territoryid
            , storeid
            , personid

           /*Other Columns*/
            , rowguid
            , modifieddate

           /*Stitch Columns*/
            , _sdc_batched_at
            , _sdc_extracted_at as last_etl_run
            , _sdc_received_at
            , _sdc_sequence
            , _sdc_table_version
        from `desafio-indicium`.`adventure_works`.`customer`
    )

    select * from source
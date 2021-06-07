with
    source as (
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

           /*Stitch Columns*/
            , _sdc_batched_at
            , _sdc_extracted_at as last_etl_run
            , _sdc_received_at
            , _sdc_sequence
            , _sdc_table_version
        from `desafio-indicium`.`adventure_works`.`stateprovince`
    )

    select * from source
with
    source as (
        select
            /*Primary Key*/
            businessentityid

           /*Other Columns*/
            , title
            , suffix
            , rowguid
            , persontype
            , namestyle
            , modifieddate
            , middlename
            , lastname
            , firstname
            , emailpromotion

           /*Stitch Columns*/
            , _sdc_batched_at
            , _sdc_extracted_at as last_etl_run
            , _sdc_received_at
            , _sdc_sequence
            , _sdc_table_version
        from `desafio-indicium`.`adventure_works`.`person`
    )

    select * from source
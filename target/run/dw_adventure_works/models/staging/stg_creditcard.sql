

  create or replace view `desafio-indicium`.`dw_adventure_works`.`stg_creditcard`
  OPTIONS()
  as with
    source as (
        select
            /*Primary Key*/
            creditcardid

           /*Other Columns*/
            , modifieddate
            , expyear
            , expmonth
            , cardtype
            , cardnumber


           /*Stitch Columns*/
            , _sdc_batched_at
            , _sdc_extracted_at as last_etl_run
            , _sdc_received_at
            , _sdc_sequence
            , _sdc_table_version
        from `desafio-indicium`.`adventure_works`.`creditcard`
    )

    select * from source;


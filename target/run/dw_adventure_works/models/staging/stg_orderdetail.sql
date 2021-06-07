

  create or replace view `desafio-indicium`.`dw_adventure_works`.`stg_orderdetail`
  OPTIONS()
  as with
    source as (
        select
            /*Primary Key*/
            salesorderid

            /*Foreign Keys*/
            , specialofferid
            , salesorderdetailid
            , productid

           /*Other Columns*/
            , unitpricediscount
            , unitprice
            , rowguid
            , orderqty
            , unitprice * (1 - unitpricediscount) * orderqty as saleprice
            , modifieddate
            , carriertrackingnumber

           /*Stitch Columns*/
            , _sdc_batched_at
            , _sdc_extracted_at as last_etl_run
            , _sdc_received_at
            , _sdc_sequence
            , _sdc_table_version
        from `desafio-indicium`.`adventure_works`.`salesorderdetail`
    )

    select * from source;


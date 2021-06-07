

  create or replace table `desafio-indicium`.`dw_adventure_works`.`dim_reason`
  
  
  OPTIONS()
  as (
    with
    reason as (
        select
            /*Primary Key*/
            salesreasonid

           /*Other Columns*/
            , name
            , modifieddate
            , reasontype
        from `desafio-indicium`.`dw_adventure_works`.`stg_salesreason`
    )

    ,    reasonorder as (
        select
            /*Primary Key*/
            salesreasonid

            /*Foreign Keys*/
            , salesorderid

           /*Other Columns*/
            , modifieddate
        from `desafio-indicium`.`dw_adventure_works`.`stg_orderheadersalesreason`
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
  );
    
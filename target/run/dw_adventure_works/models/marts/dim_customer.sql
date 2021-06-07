

  create or replace table `desafio-indicium`.`dw_adventure_works`.`dim_customer`
  
  
  OPTIONS()
  as (
    with
    person as (
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
            from `desafio-indicium`.`dw_adventure_works`.`stg_person`
        )

    , customer as (
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
        from `desafio-indicium`.`dw_adventure_works`.`stg_customer`
    )

    , transformed as (
        select
        row_number() over (order by customerid) as customer_sk
        , customer.customerid
        , customer.territoryid
        , customer.storeid
        , customer.personid
        , customer.rowguid
        , customer.modifieddate
        , person.middlename
        , person.lastname
        , person.firstname
        from customer
        left join person on customer.customerid = person.businessentityid
    )

    select * from transformed
  );
    
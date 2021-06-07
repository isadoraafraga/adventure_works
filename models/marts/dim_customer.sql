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
            from {{ ref('stg_person')}}
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
        from {{ ref('stg_customer')}}
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
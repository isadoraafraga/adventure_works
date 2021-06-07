

  create or replace view `desafio-indicium`.`dw_adventure_works`.`dim_person`
  OPTIONS()
  as with
    selected as (
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

    , transformed as (
        select
        row_number() over (order by businessentityid) as person_sk
        , *
        from selected
    )

    select * from transformed;


with
    selected as (
        select
           /*Primary Key*/
            creditcardid

           /*Other Columns*/
            , modifieddate
            , expyear
            , expmonth
            , cardtype
            , cardnumber
        from {{ ref('stg_creditcard')}}
    )

    , transformed as (
        select
        row_number() over (order by creditcardid) as creditcard_sk
        , *
        from selected
    )

    select * from transformed
with
    selected as (
        select
             /*Primary Key*/
            productid

            /*Foreign Keys*/
            , productsubcategoryid
            , productmodelid

           /*Other Columns*/
            , weightunitmeasurecode
            , weight
            , style
            , standardcost
            , sizeunitmeasurecode
            , size
            , sellstartdate
            , sellenddate
            , safetystocklevel
            , reorderpoint
            , productnumber
            , productline
            , name
            , modifieddate
            , makeflag
            , listprice
            , finishedgoodsflag
            , daystomanufacture
            , color
            , class
        from `desafio-indicium`.`dw_adventure_works`.`stg_product`
    )

    , transformed as (
        select
        row_number() over (order by productid) as product_sk
        , *
        from selected
    )

    select * from transformed
with
    source as (
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

           /*Stitch Columns*/
            , _sdc_batched_at
            , _sdc_extracted_at as last_etl_run
            , _sdc_received_at
            , _sdc_sequence
            , _sdc_table_version
        from `desafio-indicium`.`adventure_works`.`product`
    )

    select * from source
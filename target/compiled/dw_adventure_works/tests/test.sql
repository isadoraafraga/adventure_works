
with dbt__CTE__INTERNAL_test as (
with   
    validation_id as (
        select count(distinct salesorderid) as ord_qty
        from `desafio-indicium`.`dw_adventure_works`.`fact_order_details`
    )
  
    ,    validation_qt as (
        select sum(orderqty) as sum_qty
        from `desafio-indicium`.`dw_adventure_works`.`fact_order_details`
    )

    ,    validation_price as (
        select sum(saleprice) as sum_price
        from `desafio-indicium`.`dw_adventure_works`.`fact_order_details`
    )

    select * from validation_id where ord_qty != 31465
    select * from validation_qt where sum_qty != 274914
    select * from validation_price where sum_price != 109846381.399888
)select count(*) from dbt__CTE__INTERNAL_test
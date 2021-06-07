
    
    



select count(*) as validation_errors
from (

    select
        salesorderid

    from `desafio-indicium`.`dw_adventure_works`.`fact_order_details`
    where salesorderid is not null
    group by salesorderid
    having count(*) > 1

) validation_errors



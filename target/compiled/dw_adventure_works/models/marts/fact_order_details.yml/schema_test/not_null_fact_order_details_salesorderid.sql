
    
    



select count(*) as validation_errors
from `desafio-indicium`.`dw_adventure_works`.`fact_order_details`
where salesorderid is null




    
    



select count(*) as validation_errors
from (

    select
        salesorder_sk

    from `desafio-indicium`.`dw_adventure_works`.`dim_reason`
    where salesorder_sk is not null
    group by salesorder_sk
    having count(*) > 1

) validation_errors



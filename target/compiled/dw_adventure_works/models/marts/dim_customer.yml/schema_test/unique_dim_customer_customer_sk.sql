
    
    



select count(*) as validation_errors
from (

    select
        customer_sk

    from `desafio-indicium`.`dw_adventure_works`.`dim_customer`
    where customer_sk is not null
    group by customer_sk
    having count(*) > 1

) validation_errors



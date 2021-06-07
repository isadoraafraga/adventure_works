
    
    



select count(*) as validation_errors
from (

    select
        creditcard_sk

    from `desafio-indicium`.`dw_adventure_works`.`dim_creditcard`
    where creditcard_sk is not null
    group by creditcard_sk
    having count(*) > 1

) validation_errors



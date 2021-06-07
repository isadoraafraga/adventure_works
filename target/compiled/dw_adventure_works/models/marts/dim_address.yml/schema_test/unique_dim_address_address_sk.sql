
    
    



select count(*) as validation_errors
from (

    select
        address_sk

    from `desafio-indicium`.`dw_adventure_works`.`dim_address`
    where address_sk is not null
    group by address_sk
    having count(*) > 1

) validation_errors



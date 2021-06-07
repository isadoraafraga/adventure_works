
    
    



select count(*) as validation_errors
from (

    select
        reason_sk

    from `desafio-indicium`.`dw_adventure_works`.`dim_reason`
    where reason_sk is not null
    group by reason_sk
    having count(*) > 1

) validation_errors



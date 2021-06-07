
    
    



select count(*) as validation_errors
from (

    select
        reasonorder_sk

    from `desafio-indicium`.`dw_adventure_works`.`dim_reason`
    where reasonorder_sk is not null
    group by reasonorder_sk
    having count(*) > 1

) validation_errors



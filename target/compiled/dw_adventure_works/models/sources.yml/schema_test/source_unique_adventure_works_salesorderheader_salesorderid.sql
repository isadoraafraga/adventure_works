
    
    



select count(*) as validation_errors
from (

    select
        salesorderid

    from `desafio-indicium`.`adventure_works`.`salesorderheader`
    where salesorderid is not null
    group by salesorderid
    having count(*) > 1

) validation_errors



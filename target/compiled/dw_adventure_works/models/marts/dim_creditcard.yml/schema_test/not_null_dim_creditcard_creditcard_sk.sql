
    
    



select count(*) as validation_errors
from `desafio-indicium`.`dw_adventure_works`.`dim_creditcard`
where creditcard_sk is null



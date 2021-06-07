
    
    




select count(*) as validation_errors
from (
    select creditcard_fk as id from `desafio-indicium`.`dw_adventure_works`.`fact_order_details`
) as child
left join (
    select creditcard_sk as id from `desafio-indicium`.`dw_adventure_works`.`dim_creditcard`
) as parent on parent.id = child.id
where child.id is not null
  and parent.id is null



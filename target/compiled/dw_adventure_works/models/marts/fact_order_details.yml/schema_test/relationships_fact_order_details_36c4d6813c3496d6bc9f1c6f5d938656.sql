
    
    




select count(*) as validation_errors
from (
    select reason_fk as id from `desafio-indicium`.`dw_adventure_works`.`fact_order_details`
) as child
left join (
    select reason_sk as id from `desafio-indicium`.`dw_adventure_works`.`dim_reason`
) as parent on parent.id = child.id
where child.id is not null
  and parent.id is null



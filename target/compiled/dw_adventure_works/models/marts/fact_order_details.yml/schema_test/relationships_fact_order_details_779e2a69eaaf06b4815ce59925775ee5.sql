
    
    




select count(*) as validation_errors
from (
    select address_fk as id from `desafio-indicium`.`dw_adventure_works`.`fact_order_details`
) as child
left join (
    select address_sk as id from `desafio-indicium`.`dw_adventure_works`.`dim_address`
) as parent on parent.id = child.id
where child.id is not null
  and parent.id is null



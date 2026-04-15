
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select id_item
from "postgres"."public_staging"."stg_itens_pedido"
where id_item is null



  
  
      
    ) dbt_internal_test

    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select id_pedido
from "postgres"."public_staging"."stg_pedidos"
where id_pedido is null



  
  
      
    ) dbt_internal_test
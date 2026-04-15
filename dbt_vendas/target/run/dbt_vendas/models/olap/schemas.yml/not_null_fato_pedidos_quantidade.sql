
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select quantidade
from "postgres"."public_olap"."fato_pedidos"
where quantidade is null



  
  
      
    ) dbt_internal_test

    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select valor_total_item
from "postgres"."public_olap"."fato_pedidos"
where valor_total_item is null



  
  
      
    ) dbt_internal_test
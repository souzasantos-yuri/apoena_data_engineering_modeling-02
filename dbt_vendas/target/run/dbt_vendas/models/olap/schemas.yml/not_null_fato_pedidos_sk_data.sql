
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select sk_data
from "postgres"."public_olap"."fato_pedidos"
where sk_data is null



  
  
      
    ) dbt_internal_test
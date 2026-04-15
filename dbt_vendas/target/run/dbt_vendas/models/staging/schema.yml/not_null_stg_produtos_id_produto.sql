
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    



select id_produto
from "postgres"."public_staging"."stg_produtos"
where id_produto is null



  
  
      
    ) dbt_internal_test
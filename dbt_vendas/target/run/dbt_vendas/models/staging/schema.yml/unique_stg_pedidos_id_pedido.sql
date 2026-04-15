
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

select
    id_pedido as unique_field,
    count(*) as n_records

from "postgres"."public_staging"."stg_pedidos"
where id_pedido is not null
group by id_pedido
having count(*) > 1



  
  
      
    ) dbt_internal_test

    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

select
    sk_pedido as unique_field,
    count(*) as n_records

from "postgres"."public_olap"."fato_pedidos"
where sk_pedido is not null
group by sk_pedido
having count(*) > 1



  
  
      
    ) dbt_internal_test
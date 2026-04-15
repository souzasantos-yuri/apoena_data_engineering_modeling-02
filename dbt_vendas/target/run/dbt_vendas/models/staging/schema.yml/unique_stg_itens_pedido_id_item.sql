
    
    select
      count(*) as failures,
      count(*) != 0 as should_warn,
      count(*) != 0 as should_error
    from (
      
    
  
    
    

select
    id_item as unique_field,
    count(*) as n_records

from "postgres"."public_staging"."stg_itens_pedido"
where id_item is not null
group by id_item
having count(*) > 1



  
  
      
    ) dbt_internal_test
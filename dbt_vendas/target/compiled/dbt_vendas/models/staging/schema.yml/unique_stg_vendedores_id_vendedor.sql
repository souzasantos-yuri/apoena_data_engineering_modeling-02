
    
    

select
    id_vendedor as unique_field,
    count(*) as n_records

from "postgres"."public_staging"."stg_vendedores"
where id_vendedor is not null
group by id_vendedor
having count(*) > 1




    
    

select
    sk_produto as unique_field,
    count(*) as n_records

from "postgres"."public_olap"."dim_produtos"
where sk_produto is not null
group by sk_produto
having count(*) > 1



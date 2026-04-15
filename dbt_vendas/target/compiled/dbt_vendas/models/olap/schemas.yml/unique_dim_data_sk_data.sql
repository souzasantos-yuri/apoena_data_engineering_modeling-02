
    
    

select
    sk_data as unique_field,
    count(*) as n_records

from "postgres"."public_olap"."dim_data"
where sk_data is not null
group by sk_data
having count(*) > 1




    
    

with child as (
    select sk_data as from_field
    from "postgres"."public_olap"."fato_pedidos"
    where sk_data is not null
),

parent as (
    select sk_data as to_field
    from "postgres"."public_olap"."dim_data"
)

select
    from_field

from child
left join parent
    on child.from_field = parent.to_field

where parent.to_field is null




  
    

  create  table "postgres"."public_staging"."stg_itens_pedido__dbt_tmp"
  
  
    as
  
  (
    select
    id_item,
    id_pedido,
    id_produto,
    quantidade::int              as quantidade,
    preco_unitario::numeric(10, 2) as preco_unitario,
    subtotal::numeric(10, 2)     as subtotal
from "postgres"."public_raw"."raw_itens_pedido"
where id_item is not null
  );
  
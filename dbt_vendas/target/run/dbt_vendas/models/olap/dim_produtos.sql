
  
    

  create  table "postgres"."public_olap"."dim_produtos__dbt_tmp"
  
  
    as
  
  (
    select
    id_produto      as sk_produto,
    nome_produto,
    nome_categoria,
    preco_unitario,
    estoque
from "postgres"."public_staging"."stg_produtos"
where ativo = true
  );
  
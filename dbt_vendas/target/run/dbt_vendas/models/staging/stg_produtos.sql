
  
    

  create  table "postgres"."public_staging"."stg_produtos__dbt_tmp"
  
  
    as
  
  (
    select
    p.id_produto,
    trim(p.nome_produto)        as nome_produto,
    p.preco_unitario::numeric   as preco_unitario,
    c.nome_categoria,
    p.estoque::int              as estoque,
    p.ativo::boolean            as ativo
from "postgres"."public_raw"."raw_produtos" p

left join "postgres"."public_raw"."raw_categorias" c 
    on p.id_categoria = c.id_categoria

where p.id_produto is not null
  );
  
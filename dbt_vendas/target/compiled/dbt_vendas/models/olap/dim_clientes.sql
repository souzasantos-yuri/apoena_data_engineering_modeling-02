select
    id_cliente   as sk_cliente,
    nome_cliente,
    email,
    cidade,
    uf,
    data_cadastro
from "postgres"."public_staging"."stg_clientes"
where ativo = true
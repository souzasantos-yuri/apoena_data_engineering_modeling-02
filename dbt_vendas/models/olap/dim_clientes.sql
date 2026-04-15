select
    id_cliente   as sk_cliente,
    nome_cliente,
    email,
    cidade,
    uf,
    data_cadastro
from {{ ref('stg_clientes') }}
where ativo = true
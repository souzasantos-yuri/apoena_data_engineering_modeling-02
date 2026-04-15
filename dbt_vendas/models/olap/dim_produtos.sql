select
    id_produto      as sk_produto,
    nome_produto,
    nome_categoria,
    preco_unitario,
    estoque
from {{ ref('stg_produtos') }}
where ativo = true
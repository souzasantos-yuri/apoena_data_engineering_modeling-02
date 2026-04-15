select
    p.id_produto,
    trim(p.nome_produto)        as nome_produto,
    p.preco_unitario::numeric   as preco_unitario,
    c.nome_categoria,
    p.estoque::int              as estoque,
    p.ativo::boolean            as ativo
from {{ ref('raw_produtos') }} p

left join {{ ref('raw_categorias') }} c 
    on p.id_categoria = c.id_categoria

where p.id_produto is not null
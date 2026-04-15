select
    id_item,
    id_pedido,
    id_produto,
    quantidade::int              as quantidade,
    preco_unitario::numeric(10, 2) as preco_unitario,
    subtotal::numeric(10, 2)     as subtotal
from {{ ref('raw_itens_pedido') }}
where id_item is not null
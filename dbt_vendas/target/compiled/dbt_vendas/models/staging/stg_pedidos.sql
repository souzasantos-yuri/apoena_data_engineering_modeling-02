select
    id_pedido,
    id_cliente,
    id_vendedor,
    data_pedido::date           as data_pedido,
    upper(trim(status))         as status,
    valor_total::numeric(10, 2) as valor_total
from "postgres"."public_raw"."raw_pedidos"
where id_pedido is not null
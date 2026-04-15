select
    id_cliente,
    trim(initcap(nome))    as nome_cliente,
    lower(trim(email))     as email,
    trim(telefone)         as telefone,
    initcap(trim(cidade))  as cidade,
    upper(trim(estado))    as uf,
    data_cadastro::date    as data_cadastro,
    ativo::boolean         as ativo
from "postgres"."public_raw"."raw_clientes"
where id_cliente is not null
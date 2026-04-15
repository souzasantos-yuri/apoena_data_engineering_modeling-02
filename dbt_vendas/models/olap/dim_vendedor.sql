select
    id_vendedor   as sk_vendedor,
    nome_vendedor,
    email_vendedor,
    regiao,
    data_admissao
from {{ ref('stg_vendedores') }}
select
    id_vendedor,
    trim(nome)              as nome_vendedor,
    lower(trim(email))      as email_vendedor,
    trim(regiao)            as regiao,
    data_admissao::date     as data_admissao
from {{ ref('raw_vendedores') }}
where id_vendedor is not null
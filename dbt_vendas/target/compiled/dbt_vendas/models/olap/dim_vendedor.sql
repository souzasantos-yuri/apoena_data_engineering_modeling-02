select
    id_vendedor   as sk_vendedor,
    nome_vendedor,
    email_vendedor,
    regiao,
    data_admissao
from "postgres"."public_staging"."stg_vendedores"
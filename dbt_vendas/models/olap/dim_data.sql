select
    to_char(data, 'YYYYMMDD')::int   as sk_data,
    data::date                        as data_completa,
    extract(day    from data)::int    as dia,
    extract(month  from data)::int    as mes,
    extract(year   from data)::int    as ano,
    extract(quarter from data)::int   as trimestre,
    to_char(data, 'TMMonth')          as nome_mes,
    to_char(data, 'TMDay')            as dia_semana,
    case
        when extract(dow from data) in (0, 6) then true
        else false
    end                               as fim_de_semana
from generate_series(
    '2023-01-01'::date,
    '2025-12-31'::date,
    '1 day'::interval
) as data
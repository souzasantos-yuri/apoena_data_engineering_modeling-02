DO $$
DECLARE
    v_id_pedido     INT;
    v_id_cliente    INT;
    v_id_vendedor   INT;
    v_data_pedido   DATE;
    v_status        TEXT;
    v_valor_total   NUMERIC(10,2);

    v_id_produto    INT;
    v_quantidade    INT;
    v_preco         NUMERIC(10,2);
    v_n_itens       INT;

    v_clientes      INT[]  := ARRAY[1,2,3,4,5];
    v_vendedores    INT[]  := ARRAY[1,2,3];
    v_produtos      INT[]  := ARRAY[1,2,3,4,5,6,7,8];
    v_status_list   TEXT[] := ARRAY['entregue','entregue','entregue','enviado','pendente','cancelado'];

    v_precos        NUMERIC[] := ARRAY[4500.00, 3200.00, 7800.00, 2800.00, 6500.00, 900.00, 150.00, 350.00];

    v_produtos_lote INT[];
    v_idx_prod      INT;
    i               INT;
    j               INT;
BEGIN
    -- Limpa e reinicia
    TRUNCATE oltp.itens_pedido RESTART IDENTITY CASCADE;
    TRUNCATE oltp.pedidos      RESTART IDENTITY CASCADE;

    RAISE NOTICE 'Tabelas limpas. Iniciando geração de 50.000 pedidos...';

    FOR i IN 1..50000 LOOP

        -- Sorteia atributos do pedido
        v_id_cliente  := v_clientes  [1 + floor(random() * array_length(v_clientes,  1))::INT];
        v_id_vendedor := v_vendedores[1 + floor(random() * array_length(v_vendedores, 1))::INT];
        v_status      := v_status_list[1 + floor(random() * array_length(v_status_list, 1))::INT];
        v_data_pedido := DATE '2023-01-01' + (random() * 730)::INT;
        v_valor_total := 0;

        -- Insere pedido (valor_total zerado por enquanto)
        INSERT INTO oltp.pedidos (id_cliente, id_vendedor, data_pedido, status, valor_total)
        VALUES (v_id_cliente, v_id_vendedor, v_data_pedido, v_status, 0)
        RETURNING id_pedido INTO v_id_pedido;

        -- Sorteia 2 ou 3 produtos distintos
        v_n_itens     := 2 + floor(random() * 2)::INT;  -- 2 ou 3
        v_produtos_lote := ARRAY[]::INT[];

        WHILE array_length(v_produtos_lote, 1) IS NULL
           OR array_length(v_produtos_lote, 1) < v_n_itens LOOP

            v_idx_prod := 1 + floor(random() * 8)::INT;

            -- Garante que o produto ainda não foi sorteado neste pedido
            IF NOT (v_produtos[v_idx_prod] = ANY(v_produtos_lote)) THEN
                v_produtos_lote := array_append(v_produtos_lote, v_produtos[v_idx_prod]);

                v_quantidade := 1 + floor(random() * 3)::INT;
                v_preco      := round((v_precos[v_idx_prod] * (0.90 + random() * 0.20))::NUMERIC, 2);

                INSERT INTO oltp.itens_pedido (id_pedido, id_produto, quantidade, preco_unitario)
                VALUES (v_id_pedido, v_produtos[v_idx_prod], v_quantidade, v_preco);

                v_valor_total := v_valor_total + (v_quantidade * v_preco);
            END IF;
        END LOOP;

        -- Atualiza valor_total do pedido
        UPDATE oltp.pedidos
           SET valor_total = round(v_valor_total, 2)
         WHERE id_pedido = v_id_pedido;

        -- Log a cada 5.000 pedidos
        IF i % 5000 = 0 THEN
            RAISE NOTICE '% pedidos inseridos...', i;
        END IF;

    END LOOP;

    RAISE NOTICE '✅ Concluído! 50.000 pedidos gerados.';
END;
$$;
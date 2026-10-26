SELECT
    COUNT(DISTINCT p.pedido_id) AS pedidos_entregues,

    SUM(ip.quantidade) AS unidades_vendidas,

    ROUND(
        SUM(
            ip.quantidade * ip.preco_unitario
            * (1 - ip.desconto_pct / 100.0)
        ), 2
    ) AS faturamento_liquido,

    ROUND(
        SUM(ip.quantidade * pr.custo_unitario), 2
    ) AS custo_estimado,

    ROUND(
        SUM(
            ip.quantidade * ip.preco_unitario
            * (1 - ip.desconto_pct / 100.0)
        )
        - SUM(ip.quantidade * pr.custo_unitario),
        2
    ) AS lucro_bruto_estimado,

    ROUND(
        100.0 * (
            SUM(
                ip.quantidade * ip.preco_unitario
                * (1 - ip.desconto_pct / 100.0)
            )
            - SUM(ip.quantidade * pr.custo_unitario)
        )
        / NULLIF(
            SUM(
                ip.quantidade * ip.preco_unitario
                * (1 - ip.desconto_pct / 100.0)
            ), 0
        ), 2
    ) AS margem_percentual

FROM pedidos p

JOIN itens_pedido ip
    ON p.pedido_id = ip.pedido_id

JOIN produtos pr
    ON ip.produto_id = pr.produto_id

WHERE p.status_pedido = 'Entregue';
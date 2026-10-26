WITH itens_entregues AS (
    SELECT
        p.pedido_id,
        pr.produto_id,
        pr.categoria,
        ip.quantidade,
        ip.preco_unitario,
        ip.desconto_pct,
        pr.custo_unitario
    FROM pedidos p
    JOIN itens_pedido ip
        ON p.pedido_id = ip.pedido_id
    JOIN produtos pr
        ON ip.produto_id = pr.produto_id
    WHERE p.status_pedido = 'Entregue'
)
SELECT
    categoria,
    COUNT(DISTINCT pedido_id) AS pedidos_entregues,
    SUM(quantidade) AS unidades_vendidas,
    ROUND(
        SUM(quantidade * preco_unitario
            * (1 - desconto_pct / 100.0)), 2
    ) AS faturamento_liquido,
    ROUND(
        SUM(quantidade * (
            preco_unitario * (1 - desconto_pct / 100.0)
            - custo_unitario
        )), 2
    ) AS lucro_bruto_estimado,
    ROUND(
        100.0 * SUM(quantidade * (
            preco_unitario * (1 - desconto_pct / 100.0)
            - custo_unitario
        ))
        / NULLIF(SUM(quantidade * preco_unitario
            * (1 - desconto_pct / 100.0)), 0),
        2
    ) AS margem_percentual
FROM itens_entregues
GROUP BY categoria
ORDER BY faturamento_liquido DESC;
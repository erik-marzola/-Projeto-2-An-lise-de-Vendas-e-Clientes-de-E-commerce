WITH itens_entregues AS (
    SELECT
        p.pedido_id,
        pr.produto_id,
        pr.nome_produto,
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
    produto_id,
    nome_produto,
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
    ) AS lucro_bruto_estimado
FROM itens_entregues
GROUP BY produto_id, nome_produto, categoria
ORDER BY faturamento_liquido DESC
LIMIT 10;
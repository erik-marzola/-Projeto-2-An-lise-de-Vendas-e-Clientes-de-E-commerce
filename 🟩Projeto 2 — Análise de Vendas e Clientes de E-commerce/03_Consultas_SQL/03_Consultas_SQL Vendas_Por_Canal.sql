WITH vendas_itens AS (
    SELECT
        p.pedido_id,
        p.canal_venda,
        ip.quantidade,
        ip.quantidade * ip.preco_unitario
            * (1 - ip.desconto_pct / 100.0) AS receita_item,
        ip.quantidade * pr.custo_unitario AS custo_item
    FROM pedidos p
    JOIN itens_pedido ip
        ON p.pedido_id = ip.pedido_id
    JOIN produtos pr
        ON ip.produto_id = pr.produto_id
    WHERE p.status_pedido = 'Entregue'
)
SELECT
    canal_venda,
    COUNT(DISTINCT pedido_id) AS pedidos,
    SUM(quantidade) AS unidades,
    ROUND(SUM(receita_item), 2) AS faturamento,
    ROUND(SUM(custo_item), 2) AS custo_estimado,
    ROUND(SUM(receita_item) - SUM(custo_item), 2) AS lucro_estimado,
    ROUND(
        100.0 * (SUM(receita_item) - SUM(custo_item))
        / NULLIF(SUM(receita_item), 0), 2
    ) AS margem_pct,
    ROUND(
        SUM(receita_item) / COUNT(DISTINCT pedido_id), 2
    ) AS ticket_medio
FROM vendas_itens
GROUP BY canal_venda
ORDER BY faturamento DESC;
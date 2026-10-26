WITH vendas_geograficas AS (
    SELECT
        p.pedido_id,
        c.regiao,
        COALESCE(
            NULLIF(UPPER(TRIM(c.estado)), ''),
            'Não informado'
        ) AS estado,
        ip.quantidade,
        ip.quantidade * ip.preco_unitario
            * (1 - ip.desconto_pct / 100.0) AS receita_item,
        ip.quantidade * pr.custo_unitario AS custo_item
    FROM clientes c
    JOIN pedidos p
        ON c.cliente_id = p.cliente_id
    JOIN itens_pedido ip
        ON p.pedido_id = ip.pedido_id
    JOIN produtos pr
        ON ip.produto_id = pr.produto_id
    WHERE p.status_pedido = 'Entregue'
)
SELECT
    regiao,
    estado,
    COUNT(DISTINCT pedido_id) AS pedidos,
    SUM(quantidade) AS unidades,
    ROUND(SUM(receita_item), 2) AS faturamento,
    ROUND(SUM(receita_item) - SUM(custo_item), 2) AS lucro_estimado,
    ROUND(
        100.0 * (SUM(receita_item) - SUM(custo_item))
        / NULLIF(SUM(receita_item), 0), 2
    ) AS margem_pct
FROM vendas_geograficas
GROUP BY regiao, estado
ORDER BY faturamento DESC;
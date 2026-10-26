SELECT
    c.cliente_id,
    c.nome_cliente,
    COUNT(DISTINCT p.pedido_id) AS pedidos_entregues,
    SUM(ip.quantidade) AS unidades_vendidas,
    ROUND(
        SUM(
            ip.quantidade * ip.preco_unitario
            * (1 - ip.desconto_pct / 100.0)
        ), 2
    ) AS faturamento_liquido,
    ROUND(
        SUM(
            ip.quantidade *
            (
                ip.preco_unitario
                * (1 - ip.desconto_pct / 100.0)
                - pr.custo_unitario
            )
        ), 2
    ) AS lucro_bruto_estimado
FROM clientes c
JOIN pedidos p
    ON c.cliente_id = p.cliente_id
JOIN itens_pedido ip
    ON p.pedido_id = ip.pedido_id
JOIN produtos pr
    ON ip.produto_id = pr.produto_id
WHERE p.status_pedido = 'Entregue'
GROUP BY
    c.cliente_id,
    c.nome_cliente
ORDER BY
    pedidos_entregues DESC,
    faturamento_liquido DESC
LIMIT 10;
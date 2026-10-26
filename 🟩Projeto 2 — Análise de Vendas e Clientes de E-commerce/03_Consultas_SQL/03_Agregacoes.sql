SELECT
    COUNT(*) AS total_itens_pedido,
    SUM(quantidade) AS unidades_vendidas,
    ROUND(AVG(preco_unitario), 2) AS preco_medio_unitario,
    ROUND(AVG(desconto_pct), 2) AS desconto_medio_pct
FROM itens_pedido;
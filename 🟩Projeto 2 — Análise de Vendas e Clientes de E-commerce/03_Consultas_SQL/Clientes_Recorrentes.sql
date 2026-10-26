WITH pedidos_por_cliente AS (
    SELECT
        cliente_id,
        COUNT(*) AS total_pedidos
    FROM pedidos
    WHERE status_pedido = 'Entregue'
    GROUP BY cliente_id
)
SELECT
    COUNT(*) AS clientes_com_pedidos,
    SUM(
        CASE
            WHEN total_pedidos > 1 THEN 1
            ELSE 0
        END
    ) AS clientes_recorrentes,
    ROUND(
        100.0 * SUM(
            CASE
                WHEN total_pedidos > 1 THEN 1
                ELSE 0
            END
        ) / COUNT(*),
        2
    ) AS percentual_recorrentes,
    ROUND(AVG(total_pedidos), 2) AS media_pedidos_por_cliente
FROM pedidos_por_cliente;
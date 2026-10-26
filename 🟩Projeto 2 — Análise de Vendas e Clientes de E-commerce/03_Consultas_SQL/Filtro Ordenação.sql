SELECT
    cliente_id,
    nome_cliente,
    cidade,
    estado

FROM clientes
WHERE estado = 'SP'
ORDER BY cidade ASC
LIMIT 20;
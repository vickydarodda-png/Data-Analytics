USE Ventas_Tech_DB_

-- Consulta 1: Resumen ejecutivo mensual --
SELECT
	MONTH (fecha_venta) as mes,
	SUM (cantidad * precio_unitario) as Total_facturado,
	AVG (cantidad * precio_unitario) as Ticket_promedio
FROM Ventas
GROUP BY MONTH (fecha_venta)
ORDER BY mes;

--Consulta 2: Ranking de productos -- 
SELECT TOP 5
    id_producto,
    SUM(cantidad) AS unidades_vendidas,
    SUM(cantidad * precio_unitario) AS total_generado
FROM Ventas
GROUP BY id_producto
ORDER BY total_generado DESC;

--Consulta 3: Clientes recurrentes -- 
SELECT
    id_cliente,
    COUNT(*) AS cantidad_pedidos,
    SUM(cantidad * precio_unitario) AS total_gastado
FROM Ventas
GROUP BY id_cliente
HAVING COUNT(*) > 1;

-- Consulta 4: Meses por encima/por debajo del promedio --
SELECT
    MONTH(fecha_venta) AS mes,
    SUM(cantidad * precio_unitario) AS total_facturado,
    CASE
        WHEN SUM(cantidad * precio_unitario) >
             AVG(SUM(cantidad * precio_unitario)) OVER ()
        THEN 'Por encima'
        ELSE 'Por debajo'
    END AS comparacion_promedio
FROM Ventas
GROUP BY MONTH(fecha_venta)
ORDER BY mes;


-- ==========================================
-- BLOQUE DE CIERRE: HALLAZGOS
-- ==========================================
-- 1.El producto 1 fue el que más facturó, con $3.600 

-- 2. Los 5 clientes registrados realizaron más de un pedido

-- 3. El cliente 1 fue el que más gastó durante el período analizado,
--    con un total de $2.640 en sus compras.






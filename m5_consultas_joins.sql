USE Ventas_Tech_DB_;

-- =========================================================
-- MÓDULO 5 - CONSULTAS CON JOINS
-- Proyecto: Ventas Tech
-- =========================================================

-- CONSULTA 1 - VISTA BASE DEL PROYECTO
-- INNER JOIN

SELECT
v.fecha_venta AS fecha,
c.id_cliente,
c.nombre AS nombre_cliente,
c.ciudad,
p.nombre_producto,
cat.nombre_categoria AS categoria,
v.cantidad,
v.precio_unitario,
v.cantidad * v.precio_unitario AS total_venta
FROM Ventas AS v
INNER JOIN Clientes AS c
	ON v.id_cliente = c.id_cliente
INNER JOIN Productos AS p
	ON v.id_producto = p.id_producto
INNER JOIN Categorias AS cat
	ON p.id_categoria = cat.id_categoria
ORDER BY v.fecha_venta;


-- =========================================================
-- CONSULTA 2 - CLIENTES SIN VENTAS
-- LEFT JOIN
-- =========================================================

SELECT
c.nombre,
c.email,
c.fecha_registro
FROM Clientes AS c
LEFT JOIN Ventas AS v
	ON c.id_cliente = v.id_cliente
WHERE v.id_venta IS NULL;


-- =========================================================
-- CONSULTA 3 - PRODUCTOS SIN VENTAS
-- LEFT JOIN
-- =========================================================

SELECT
p.nombre_producto,
cat.nombre_categoria AS categoria,
p.precio
FROM Productos AS p
INNER JOIN Categorias AS cat
	ON p.id_categoria = cat.id_categoria
LEFT JOIN Ventas AS v
	ON p.id_producto = v.id_producto
WHERE v.id_venta IS NULL;


-- =========================================================
-- CONSULTA 4 - CONSOLIDADO POR ORIGEN
-- UNION ALL
-- =========================================================

SELECT
canal,
SUM(total_venta) AS total_ventas
FROM
(
SELECT
fecha_venta,
cantidad * precio_unitario AS total_venta,
'Periodo 1' AS canal
FROM Ventas
WHERE fecha_venta BETWEEN '2024-03-01' AND '2024-03-10'

UNION ALL

SELECT
fecha_venta,
cantidad * precio_unitario AS total_venta,
'Periodo 2' AS canal
FROM Ventas
WHERE fecha_venta BETWEEN '2024-03-11' AND '2024-03-31'
) AS ventas_periodos
GROUP BY canal
ORDER BY canal;

-- =========================================================
-- BLOQUE DE CIERRE - HALLAZGOS
-- =========================================================
-- 1. La vista enriquecida permite relacionar las 10 ventas
-- registradas con sus respectivos clientes, productos
-- y categorías, incorporando también la ciudad como
-- dimensión geográfica.

-- 2. Todos los clientes registrados realizaron al menos
-- una compra, por lo que no se identificaron clientes
-- sin ventas.


-- 3. Todos los productos registrados tuvieron al menos
-- una venta, por lo que no se identificaron productos
-- sin movimiento.















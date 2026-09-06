CREATE DATABASE Ventas_Tech_db_M3_FINAL

DROP TABLE IF EXISTS ventas;
DROP TABLE IF EXISTS productos;
DROP TABLE IF EXISTS clientes;
DROP TABLE IF EXISTS categorias;
DROP TABLE IF EXISTS territorios;

USE Ventas_Tech_db_M3_FINAL;

CREATE TABLE Categorias (
id_categoria INT PRIMARY KEY, 
nombre VARCHAR (100) NOT NULL
);

CREATE TABLE Productos (
id_producto INT PRIMARY KEY,
nombre VARCHAR (100) NOT NULL, 
marca VARCHAR (100)NOT NULL,
precio DECIMAL (10,2) NOT NULL,
costo DECIMAL (10,2) NOT NULL,
id_categoria INT, 

	FOREIGN KEY (id_categoria)
	REFERENCES categorias (id_categoria)
);

CREATE TABLE Territorios (
id_territorio INT PRIMARY KEY, 
región VARCHAR (100) NOT NULL,
pais VARCHAR (100) NOT NULL,
provincia_localidad VARCHAR (100) NOT NULL
);

CREATE TABLE Clientes (
id_cliente INT PRIMARY KEY, 
nombre_apellido VARCHAR (200) NOT NULL, 
Email VARCHAR (250),  
ciudad VARCHAR (100) NOT NULL, 
tipo_cliente VARCHAR (100) NOT NULL,
fecha_registro DATE,
id_territorio INT,

	FOREIGN KEY (id_territorio)
	REFERENCES Territorios (id_territorio)
);

CREATE TABLE Ventas (
id_venta INT PRIMARY KEY,
fecha_venta DATE NOT NULL,
id_cliente INT NOT NULL, 
id_producto INT NOT NULL,
cantidad_total INT NOT NULL, 
total_venta DECIMAL (10,2) NOT NULL, 
canal VARCHAR (200) NOT NULL,
descuento_aplicado DECIMAL (5,2),

	FOREIGN KEY (id_cliente)
	REFERENCES Clientes (id_cliente),

	FOREIGN KEY (id_producto)
	REFERENCES Productos (id_producto)
);


INSERT INTO Categorias (id_categoria, nombre)
VALUES 
(1,'computacion'),
(2,'audio'),
(3, 'fotografia');

INSERT INTO Productos (id_producto, nombre, marca, precio, costo, id_categoria)
VALUES
(1, 'Notebook IdeaPad 3', 'Lenovo', 850000.00, 650000.00, 1), 
(2, 'Mouse inalambrico M185', 'Logitech', 25000.00, 15000.00, 1),
(3, 'Celular Galaxy A15', 'Samsung', 350000.00, 270000.00, 2),
(4, 'Iphone 15', 'Apple', 900000.00, 700000.00, 2),
(5, 'Auriculares WH-CH520', 'Sony', 80000.00, 60000.00, 3), 
(6, 'Parlante portatil', 'JBL', 120000.00, 90000.00, 3);

INSERT INTO Territorios (id_territorio, región, pais, provincia_localidad)
VALUES
(1, 'GBA', 'Argentina', 'Tigre'),
(2, 'GBA', 'Argentina', 'Olivos'),
(3, 'Buenos Aires', 'Argentina', 'La Plata');

INSERT INTO Clientes (id_cliente, nombre_apellido, email, ciudad, tipo_cliente, fecha_registro, id_territorio)
VALUES
(1, 'Martina Gonzalez', 'martina.gonzalez@gmail.com', 'Tigre', 'Minorista', '2026-01-15', 1),
(2, 'Lucas Olgado', 'lucasolgado@gmail.com', 'Olivos', 'Minorista', '2026-08-20', 2),
(3, 'Clara Rodriguez', 'clara_rodriguez@gmail.com', 'La Plata', 'Minorista', '2026-09-4', 3);

INSERT INTO Ventas (id_venta, fecha_venta, id_cliente, id_producto, cantidad_total, total_venta, canal, descuento_aplicado)
VALUES
(1, '2026-04-01', 1, 1, 1, 850000.00, 'Online', 0.00),
(2, '2026-08-09', 2, 3, 1, 47500.00, 'Tienda', 5.00),
(3, '2026-05-19', 3, 2, 2, 315000.00, 'Tienda', 10.00),
(4, '2026-03-02', 1, 2, 3, 250000.00, 'Online', 0.00),
(5, '2026-02-17', 2, 2, 2, 150000.00, 'Online', 10.00),
(6, '2026-07-19', 3, 3, 2, 85000.00, 'Tienda', 5.00),
(7, '2026-08-09', 1, 2, 1, 120000.00, 'Online', 0.00),
(8, '2026-05-04', 2, 2, 2, 200000.00, 'Online', 5.00),
(9, '2026-03-04', 1, 2, 1, 80000.00, 'Tienda', 5.00),
(10, '2026-04-06', 2, 3, 2, 100000.00, 'Tienda', 0.00);


SELECT *
FROM categorias

SELECT *
FROM productos

SELECT *
FROM territorios

SELECT *
FROM clientes

SELECT *
FROM ventas
CREATE DATABASE Ventas_Tech_DB;

DROP TABLE IF EXISTS Ventas;
DROP TABLE IF EXISTS Productos;
DROP TABLE IF EXISTS Clientes;
DROP TABLE IF EXISTS Categorias;

CREATE TABLE Categorias (
id_categoria INT PRIMARY KEY,
nombre_categoria VARCHAR(50) NOT NULL,
descripcion VARCHAR(200)
);

CREATE TABLE Clientes (
id_clientes INT PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
email VARCHAR(100) UNIQUE,
ciudad VARCHAR(50),
fecha_registro DATE NOT NULL
);

CREATE TABLE Productos (
id_producto INT PRIMARY KEY,
nombre_producto VARCHAR(100) NOT NULL,
precio DECIMAL (10,2) NOT NULL,
stock INT DEFAULT 0, 
activo TINYINT DEFAULT 1,
id_categoria INT,
	FOREIGN KEY (id_categoria)
        REFERENCES Categorias (id_categoria)
); 

CREATE TABLE Ventas (
id_venta INT PRIMARY KEY,
id_clientes INT,
id_producto INT,
cantidad INT NOT NULL,
precio_unitario DECIMAL (10,2) NOT NULL,
fecha_venta DATE NOT NULL,
	FOREIGN KEY (id_clientes)
		REFERENCES Clientes (id_clientes),

	FOREIGN KEY (id_producto)
		REFERENCES Productos (id_producto)
);


INSERT INTO Categorias (id_categoria, nombre_categoria, descripcion)
VALUES
(1, 'Computacion', 'Aaptops, PCs y monitores'),
(2, 'Accesorios', 'Perifericos y complementos'),
(3, 'Audio', 'Auriculares y parlantes'),
(4, 'Almacenamiento', 'Discos y memorias');

INSERT INTO Clientes (id_clientes, nombre, email, ciudad, fecha_registro)
VALUES
(1, 'Maria Lopez', 'maria@mail.com', 'Buenos Aires', '2024-02-05'),
(2, 'Carlos Ruiz', 'carlos@mail.com', 'Cordoba', '2024-01-10'),
(3, 'Ana Gómez',     'ana@mail.com',     'Rosario',      '2024-02-01'),
(4, 'Pedro Sanz',    'pedro@mail.com',   'Mendoza',      '2024-02-15'),
(5, 'Laura Torres',  'laura@mail.com',   'Tucumán',      '2024-03-01');

INSERT INTO Productos (id_producto, nombre_producto, id_categoria, precio, stock, activo)
VALUES
(1, 'Laptop Pro 15',       1, 1200.00, 15, 1),
(2, 'Mouse Inalámbrico',   2,   28.00, 80, 1),
(3, 'Monitor 4K 27"',      1,  450.00, 12, 1),
(4, 'Auriculares BT Pro',  3,  120.00, 35, 1),
(5, 'SSD Externo 1TB',     4,  130.00, 18, 1),
(6, 'Teclado Mecánico',    2,   95.00, 40, 1);

INSERT INTO Ventas (id_venta, id_clientes, id_producto, cantidad, precio_unitario, fecha_Venta)
VALUES
(1,  1, 1, 2, 1200.00, '2024-03-05'),
(2,  2, 2, 5,   28.00, '2024-03-06'),
(3,  3, 3, 1,  450.00, '2024-03-07'),
(4,  1, 4, 2,  120.00, '2024-03-08'),
(5,  4, 5, 3,  130.00, '2024-03-10'),
(6,  2, 6, 4,   95.00, '2024-03-11'),
(7,  5, 1, 1, 1200.00, '2024-03-12'),
(8,  3, 2, 8,   28.00, '2024-03-13'),
(9,  4, 4, 1,  120.00, '2024-03-14'),
(10, 5, 3, 2,  450.00, '2024-03-15');


SELECT *
FROM categorias;

SELECT *
FROM clientes;

SELECT *
FROM productos;

SELECT *
FROM ventas;






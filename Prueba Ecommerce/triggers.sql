create database ecommerce;

USE ecommerce;

CREATE TABLE Categories (
id SERIAL PRIMARY KEY,
name VARCHAR(50)
);

CREATE TABLE Products (
id SERIAL PRIMARY KEY,
name VARCHAR(100),
image VARCHAR(255),
price DECIMAL(9,2),
stock INT,
on_stock BOOLEAN,
description TEXT,
category_id INTEGER REFERENCES Categories(id)
);

CREATE TABLE Users (
id int auto_increment PRIMARY KEY,
name VARCHAR(100),
lastname VARCHAR(100),
email VARCHAR(100),
address VARCHAR(200),
user_role ENUM ('client', 'admin', 'superadmin'),
is_admin BOOLEAN,
password VARCHAR(100),
image VARCHAR(255)
);

CREATE TABLE Orders (
id SERIAL PRIMARY KEY,
total_price DECIMAL(9,2),
state ENUM ('Cart', 'Created', 'Processing', 'Canceled','Complete'),
date DATE,
user_id INTEGER REFERENCES Users(id)
);

CREATE TABLE OrderLines (
id SERIAL PRIMARY KEY,
subtotal DECIMAL(9,2),
quantity INT,	
order_id INTEGER REFERENCES Orders(id),
product_id INTEGER REFERENCES Products(id)

);

-- CARGAMOS LOS REGISTROS:
INSERT INTO Categories (name) VALUES
('Jamón'),
('Aceitunas'),
('Paella'),
('Queso'),
('Tortilla'),
('Gazpacho'),
('Chorizo'),
('Turrón'),
('Pulpo'),
('Vino'),
('Calamares'),
('Postre'),
('Pimientos'),
('Sangría'),
('Patatas');

INSERT INTO Products (name, image, price, stock, on_stock, description, category_id)
VALUES
('Jamón Ibérico', 'jamon.jpg', 99.99, 50, TRUE, 'Delicioso jamón ibérico de bellota, curado
durante meses para obtener su sabor único.', (SELECT id FROM Categories WHERE name
= 'Jamón')),
('Aceitunas Manzanilla', 'aceitunas.jpg', 5.99, 100, TRUE, 'Aceitunas verdes de la
variedad Manzanilla, un aperitivo clásico en la gastronomía española.', (SELECT id FROM
Categories WHERE name = 'Aceitunas')),
('Paella Valenciana', 'paella.jpg', 29.99, 30, TRUE, 'Auténtica paella valenciana, preparada
con arroz, mariscos frescos, pollo, conejo y especias.', (SELECT id FROM Categories
WHERE name = 'Paella')),
('Queso Manchego', 'queso.jpg', 14.99, 40, TRUE, 'Queso manchego elaborado con leche
de oveja, de sabor intenso y textura cremosa.', (SELECT id FROM Categories WHERE
name = 'Queso')),
('Tortilla Española', 'tortilla.jpg', 9.99, 50, TRUE, 'Clásica tortilla española hecha con
patatas, cebolla y huevos, un plato imprescindible en cualquier celebración.', (SELECT id
FROM Categories WHERE name = 'Tortilla')),
('Gazpacho Andaluz', 'gazpacho.jpg', 7.99, 60, TRUE, 'Refrescante gazpacho andaluz,
una sopa fría de tomate, pimiento, pepino, ajo y aceite de oliva.', (SELECT id FROM
Categories WHERE name = 'Gazpacho')),
('Chorizo Español', 'chorizo.jpg', 12.99, 30, TRUE, 'Chorizo español curado, elaborado
con carne de cerdo y especias tradicionales, perfecto para tapas.', (SELECT id FROM
Categories WHERE name = 'Chorizo')),
('Turrón de Jijona', 'turron.jpg', 8.99, 80, TRUE, 'Dulce turrón de Jijona, un postre
navideño elaborado con almendras, miel y azúcar.', (SELECT id FROM Categories WHERE
name = 'Turrón')),
('Pulpo a la Gallega', 'pulpo.jpg', 34.99, 20, TRUE, 'Exquisito pulpo a la gallega, cocido y
servido con pimentón, aceite de oliva y sal gorda.', (SELECT id FROM Categories WHERE
name = 'Pulpo')),
('Vino Rioja', 'vino.jpg', 19.99, 70, TRUE, 'Vino tinto Rioja, elaborado en la región vinícola
de La Rioja, conocido por su sabor frutal y suave.', (SELECT id FROM Categories WHERE
name = 'Vino')),
('Calamares a la Romana', 'calamares.jpg', 11.99, 40, TRUE, 'Calamares a la romana,
fritos en una masa ligera y crujiente, perfectos como tapa o entrante.', (SELECT id FROM
Categories WHERE name = 'Calamares')),
('Crema Catalana', 'crema.jpg', 6.99, 45, TRUE, 'Deliciosa crema catalana, un postre
tradicional similar a la crema brûlée, con una capa crujiente de azúcar caramelizado.',
(SELECT id FROM Categories WHERE name = 'Postre')),
('Pimientos de Padrón', 'pimientos.jpg', 4.99, 90, TRUE, 'Pimientos de Padrón, pequeños
y verdes, cocinados en aceite y espolvoreados con sal, un aperitivo sorprendentemente
sabroso.', (SELECT id FROM Categories WHERE name = 'Pimientos')),
('Sangría Española', 'sangria.jpg', 8.99, 25, TRUE, 'Refrescante sangría española,
preparada con vino tinto, frutas frescas y un toque de brandy.', (SELECT id FROM
Categories WHERE name = 'Sangría')),
('Patatas Bravas', 'patatas.jpg', 7.99, 55, TRUE, 'Patatas bravas, cubiertas con una salsa
picante de tomate y alioli, un clásico de la cocina española para compartir.', (SELECT id
FROM Categories WHERE name = 'Patatas'));

INSERT INTO Users (name, lastname, email, address, user_role, is_admin, password,
image) VALUES
('Juan', 'González', 'juan@example.com', 'Calle 123', 'client', FALSE, 'contraseña123',
'avatar1.jpg'),
('María', 'López', 'maria@example.com', 'Avenida 456', 'client', FALSE, 'contraseña456',
'avatar2.jpg'),
('Pedro', 'Martínez', 'pedro@example.com', 'Plaza Principal', 'admin', TRUE, 'admin123',
'avatar3.jpg'),
('Laura', 'Pérez', 'laura@example.com', 'Calle 789', 'client', FALSE, 'contraseña789',
'avatar4.jpg'),
('Ana', 'Sánchez', 'ana@example.com', 'Avenida 1011', 'client', FALSE, 'contraseña1011',
'avatar5.jpg'),
('Luis', 'Gómez', 'luis@example.com', 'Paseo 1213', 'client', FALSE, 'contraseña1213',
'avatar6.jpg'),
('Elena', 'Díaz', 'elena@example.com', 'Carrera 1415', 'client', FALSE, 'contraseña1415',
'avatar7.jpg'),
('Carlos', 'Rodríguez', 'carlos@example.com', 'Camino 1617', 'admin', TRUE, 'admin456',
'avatar8.jpg'),
('Sara', 'Fernández', 'sara@example.com', 'Sendero 1819', 'client', FALSE,
'contraseña1819', 'avatar9.jpg'),
('Pablo', 'García', 'pablo@example.com', 'Ronda 2021', 'client', FALSE, 'contraseña2021',
'avatar10.jpg'),
('Sofía', 'Morales', 'sofia@example.com', 'Travesía 2223', 'client', FALSE,
'contraseña2223', 'avatar11.jpg'),
('Javier', 'Ruiz', 'javier@example.com', 'Plaza 2425', 'superadmin', TRUE,
'superadmin123', 'avatar12.jpg'),
('Eva', 'Jiménez', 'eva@example.com', 'Callejón 2627', 'client', FALSE, 'contraseña2627',
'avatar13.jpg'),
('Diego', 'Ortega', 'diego@example.com', 'Bulevar 2829', 'client', FALSE, 'contraseña2829',
'avatar14.jpg'),
('Natalia', 'Hernández', 'natalia@example.com', 'Avenida 3031', 'client', FALSE,
'contraseña3031', 'avatar15.jpg');

INSERT INTO Orders (total_price, state, date, user_id) VALUES
(100.50, 'Complete', '2024-02-01', 3),
(75.25, 'Complete', '2024-02-02', 2),
(150.80, 'Processing', '2024-02-03', 5),
(200.00, 'Created', '2024-02-04', 1),
(50.75, 'Complete', '2024-02-05', 10),
(180.60, 'Processing', '2024-02-06', 13),
(90.35, 'Complete', '2024-02-07',10),
(120.20, 'Processing', '2024-02-08', 2),
(160.90, 'Created', '2024-02-09', 8),
(70.45, 'Complete', '2024-02-10',4),
(135.75, 'Processing', '2024-02-11', 5),
(95.30, 'Created', '2024-02-12', 6),
(180.25, 'Complete', '2024-02-13', 11),
(200.50, 'Processing', '2024-02-14', 15),
(110.75, 'Created', '2024-02-15', 7);

INSERT INTO OrderLines (subtotal, quantity, order_id, product_id) VALUES
(50.25, 2, 1, 1),
(25.00, 1, 2, 3),
(30.50, 3, 3, 2),
(40.00, 1, 4, 4),
(15.75, 2, 5, 5),
(60.30, 1, 6, 6),
(45.35, 2, 7, 7),
(40.10, 1, 8, 8),
(80.90, 3, 9, 9),
(35.45, 1, 10, 10),
(60.75, 2, 11, 11),
(45.30, 1, 12, 12),
(90.25, 4, 13, 13),
(100.50, 1, 14, 14),
(55.75, 3, 15, 15);


INSERT INTO Categories (name) VALUES
('Quesadillas'),
('Empanadas'),
('Ensaladas'),
('Infusiones');

-- Registros adicionales para la tabla Products

INSERT INTO Products (name, image, price, stock, on_stock, description, category_id)
VALUES
('Quesadilla de Pollo', 'quesadilla.jpg', 8.99, 25, TRUE, 'Deliciosa quesadilla rellena de pollo, queso y verduras.', (SELECT id FROM Categories WHERE name = 'Quesadillas')),
('Quesadilla de Queso', 'quesadilla_queso.jpg', 6.99, 30, TRUE, 'Quesadilla de queso fundido, una opción vegetariana y deliciosa.', (SELECT id FROM Categories WHERE name = 'Quesadillas')),
('Empanada de Carne', 'empanada_carne.jpg', 3.99, 40, TRUE, 'Empanada argentina rellena de carne picada, cebolla y especias.', (SELECT id FROM Categories WHERE name = 'Empanadas')),
('Empanada de Pollo', 'empanada_pollo.jpg', 3.99, 35, TRUE, 'Empanada casera rellena de pollo desmenuzado, un clásico latinoamericano.', (SELECT id FROM Categories WHERE name = 'Empanadas')),
('Ensalada César', 'ensalada_cesar.jpg', 10.99, 20, TRUE, 'Ensalada clásica César con lechuga romana, crutones, pollo a la parrilla y aderezo César.', (SELECT id FROM Categories WHERE name = 'Ensaladas')),
('Ensalada Griega', 'ensalada_griega.jpg', 9.99, 15, TRUE, 'Ensalada fresca griega con pepino, tomate, cebolla roja, aceitunas, queso feta y aderezo de limón.', (SELECT id FROM Categories WHERE name = 'Ensaladas'));

-- Registros extras:

-- Registros para la tabla Products con algunos campos nulos
INSERT INTO Products (name, price, stock, description, category_id)
VALUES
('Producto 1', 10.99, 50, 'Descripción del producto 1', 1),
('Producto 2', 20.50, NULL, NULL, 2),
('Producto 3', 15.75, 30, NULL, NULL),
('Producto 4', NULL, 40, 'Descripción del producto 4', 4),
('Producto 5', 5.99, NULL, 'Descripción del producto 5', 5);

-- Registros para la tabla Users con algunos campos nulos
INSERT INTO Users (name, lastname, email, address, user_role, is_admin, password, image)
VALUES
('Usuario 1', 'Apellido 1', 'usuario1@example.com', 'Dirección 1', 'client', FALSE, 'password1', 'imagen1.jpg'),
('Usuario 2', 'Apellido 2', 'usuario2@example.com', NULL, 'client', FALSE, 'password2', NULL),
('Usuario 3', 'Apellido 3', NULL, 'Dirección 3', 'client', FALSE, 'password3', 'imagen3.jpg'),
('Usuario 4', 'Apellido 4', 'usuario4@example.com', 'Dirección 4', 'admin', TRUE, NULL, 'imagen4.jpg'),
('Usuario 5', NULL, 'usuario5@example.com', 'Dirección 5', 'client', FALSE, 'password5', NULL);

-- Registros para la tabla Orders con algunos campos nulos
INSERT INTO Orders (total_price, state, date, user_id)
VALUES
(100.00, 'Complete', '2024-02-20', 1),
(75.50, NULL, '2024-02-21', 2),
(NULL, 'Processing', '2024-02-22', 3),
(150.25, NULL, NULL, 4),
(50.99, 'Canceled', '2024-02-24', NULL);

-- Registros para la tabla OrderLines con algunos campos nulos
INSERT INTO OrderLines (subtotal, quantity, order_id, product_id)
VALUES
(20.00, 2, 1, NULL),
(NULL, 3, 2, 2),
(30.50, 1, NULL, 3),
(40.25, 2, 4, 4),
(15.99, NULL, 5, 5);

-- 1. Actualizar el stock despues de realizar una compra
DELIMITER //
CREATE TRIGGER stock_after_purchase
AFTER INSERT ON OrderLines
FOR EACH ROW
BEGIN  
    -- Actualizar el stock restando la cantidad de productos vendido
    UPDATE products
    SET stock = stock - NEW.quantity
    WHERE id = new.product_id;
END;
//
DELIMITER ;

drop trigger stock_after_purchase;

INSERT INTO OrderLines (subtotal, quantity, order_id, product_id)
VALUES (20.00, 10, 1, 1);

-- Actualizar el precio total del pedido despues de agregar un nuevo producto
DELIMITER //
CREATE TRIGGER total_after_new_product
AFTER INSERT ON OrderLines
FOR EACH ROW
BEGIN
	UPDATE Orders
    SET total_price = total_price + (NEW.subtotal * NEW.quantity)
    WHERE id = NEW.order_id;
END;
//
DELIMITER ;

-- Prueba
-- Verificar el precio antes del cambio
SELECT total_price FROM orders WHERE id = 1;

-- Insertar un orderlines nuevo para que cambie el precio total
INSERT INTO OrderLines (subtotal, quantity, order_id, product_id) VALUES
(1.00, 5, 1, 1);

-- Verificar el precio luego del cambio
SELECT total_price FROM orders WHERE id = 1;

-- Restriccion para evitar la eliminacion de categorias utilizadas por algun producto
DELIMITER //
CREATE TRIGGER before_categories_delete
BEFORE DELETE ON categories
FOR EACH ROW
BEGIN
	IF EXISTS (SELECT 1 FROM products WHERE category_id = old.id) then
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No se puede eliminar la categoría porque hay productos asociados a ella';
    END IF;
END;
//
DELIMITER ;

-- Prueba
-- Intentar borrar una categoria con un producto asociado
delete from categories where id = 1; 

-- Registro de cambios en el precio de los productos
drop table price_change;
CREATE TABLE price_change (
	id INT AUTO_INCREMENT PRIMARY KEY,
    old_price DECIMAL(9,2),
    new_price DECIMAL(9,2),
    fecha_registro TIMESTAMP,
    product_id INTEGER REFERENCES Products(id)
);
drop trigger after_products_price_change;
DELIMITER //
CREATE TRIGGER after_products_price_change
AFTER UPDATE ON products
FOR EACH ROW
BEGIN
	IF NEW.price <> OLD.price THEN
		INSERT INTO price_change (old_price, new_price, fecha_registro, product_id)
		VALUES (old.price, new.price, now(), new.id);
    END IF;
END;
//
DELIMITER ;

-- Prueba
-- Actualizacion de precio
UPDATE products
SET price = 10
WHERE id = 1;

UPDATE products
SET price = 19.99
WHERE id = 4;

-- NOTIFICAR EL ADMINISTRADOR CUANDO EL STOCK DE UN PRODUCTO SEA BAJO
CREATE TABLE notifications (
	id INT AUTO_INCREMENT PRIMARY KEY,
    mensaje TEXT,
    type VARCHAR(25),
    user_id INTEGER REFERENCES Users(id)
);

drop trigger notifications_where_low_stock;
DELIMITER //
CREATE TRIGGER notifications_where_low_stock
AFTER UPDATE ON products
FOR EACH ROW
BEGIN

	IF new.stock < 10 THEN
		INSERT INTO notifications (mensaje, type, user_id)
		VALUES (CONCAT('Se ha insertado una nueva notificación con ID de producto: ', NEW.id), 'Warning', (Select id from users where user_role = 'superadmin' limit 1));
    END IF;
END;
//
DELIMITER 

-- Prueba
-- Quitar stock de un producto
UPDATE products
SET stock = 9
WHERE id = 2;

-- Restriccion para evitar la eliminacion de suusarios con pedidos pendientes
drop trigger before_users_delete;
DELIMITER //
CREATE TRIGGER before_users_delete
BEFORE DELETE ON Users
FOR EACH ROW
BEGIN
	IF EXISTS (SELECT 1 FROM orders WHERE user_id = old.id and state != 'Created' or state = 'Processing') then
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'No se puede eliminar el usuario porque tiene pedidos pendientes';
    END IF;
END;
//
DELIMITER ;

-- Prueba
-- Intentar borrar un usuario con pedidos pendientes
DELETE FROM users WHERE id = 3;

-- Bloquear pedidos cunado un producto esta fuera de stock
drop trigger check_product_stock_integer;
DELIMITER //
CREATE TRIGGER check_product_stock_integer
BEFORE INSERT ON Orderlines
FOR EACH ROW
BEGIN
	DECLARE product_stock INT;
    DECLARE msj VARCHAR(50);
    
    SELECT stock INTO product_stock
    FROM products WHERE NEW.product_id = id; 
    
    SELECT CONCAT('No se puede eliminar el usuario porque tiene pedidos pendientes porque el producto solo tiene', '', product_stock, '', 'de stock');
    IF NEW.quantity > product_stock THEN
		SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = msj;
    END IF;
END;
//
DELIMITER ;

-- Actualizar el estado del pedido cuando se agrega un producto del carrito
drop trigger if exists after_orderline_insert;
DELIMITER //
CREATE TRIGGER after_orderline_insert
AFTER INSERT ON Orderlines
FOR EACH ROW
BEGIN
    
    UPDATE orders
    SET state = 'Cart'
    WHERE id = NEW.order_id;
    
END;
//
DELIMITER ;

select * from products;
select * from notifications;
select * from price_change;
select * from OrderLines;
select * from Orders;
select * from Users;
select * from categories;
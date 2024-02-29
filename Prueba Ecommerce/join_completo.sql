-- Registros adicionales para la tabla Categories

INSERT INTO Categories (name) VALUES
('Quesadillas'),
('Empanadas'),
('Ensaladas'),,
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

Registros extras:

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


Actividades:

-- 1. Obtener el nombre y la categoría de todos los productos junto con su precio:

SELECT distinct p.name, c.name AS category, p.price
FROM Products p
JOIN Categories c 
ON p.category_id = c.id;

--2. Mostrar el nombre y la cantidad de stock disponible para todos los productos que tienen un 
-- precio superior a $10:

SELECT name, stock
FROM Products
WHERE price > 10;

-- 3. Listar el nombre de los productos y su descripción que están en stock:

SELECT name, description
FROM Products
WHERE on_stock = TRUE;


-- 4. Obtener el nombre de usuario y la dirección de todos los administradores:

SELECT name, address
FROM Users
WHERE is_admin = TRUE;

-- 5. Mostrar el nombre del producto y el estado de todas las órdenes que tienen un total superior a $100:

SELECT p.name, o.state, o.total_price
FROM Products p
JOIN OrderLines ol 
ON p.id = ol.product_id
JOIN Orders o 
ON ol.order_id = o.id
WHERE o.total_price > 100 and o.state = 'Complete'
order by total_price;

-- 6. Listar el nombre del producto, la cantidad de stock disponible y el estado de todas las órdenes que 
-- contienen cada producto:


SELECT distinct p.name AS product_name, p.stock, o.state
FROM Products p
LEFT JOIN OrderLines ol 
ON p.id = ol.product_id
LEFT JOIN Orders o 
ON ol.order_id = o.id
-- where state ='Complete'
order by p.name;


-- 7. Mostrar el nombre del usuario, el estado de la orden y el precio total de todas las órdenes
-- creadas por usuarios que no sean administradores:


SELECT u.name AS user_name, u.is_admin, o.state, o.total_price
FROM Users u
JOIN Orders o 
ON u.id = o.user_id
WHERE u.is_admin = FALSE;

SELECT u.name AS user_name, u.is_admin, o.state, o.total_price, user_role
FROM Users u
JOIN Orders o 
ON u.id = o.user_id
WHERE u.user_role NOT IN ('admin', 'superadmin');

SELECT u.name AS user_name, u.is_admin, o.state, o.total_price, user_role
FROM Users u
JOIN Orders o 
ON u.id = o.user_id
WHERE u.user_role = 'client';


-- 8. Obtener el nombre de usuario y la cantidad total gastada por cada usuario:


SELECT u.name AS user_name, SUM(o.total_price) AS total_gasto
FROM Users u
JOIN Orders o 
ON u.id = o.user_id
GROUP BY u.name;


-- 9. Listar el nombre del producto y el total de veces que ha sido comprado:

SELECT p.name AS product_name, COUNT(*) 
FROM Products p
JOIN OrderLines ol 
ON p.id = ol.product_id
GROUP BY p.name;


select * from products;
select * from orderlines
order by product_id;

-- 9 Listar el nombre del producto y el total de veces(cantidad total) que ha sido comprado:

SELECT p.name, sum(quantity) AS total_ventas
FROM Products p
JOIN OrderLines ol 
ON p.id = ol.product_id
GROUP BY p.name;


-- 10. Mostrar el nombre del usuario y la cantidad de productos distintos que ha comprado:            

SELECT u.name AS user_name, COUNT(DISTINCT ol.product_id) AS distinct_products_purchased
FROM Users u
JOIN Orders o 
ON u.id = o.user_id
JOIN OrderLines ol 
ON o.id = ol.order_id
GROUP BY u.name;

SELECT p.name AS product_name, u.name AS user_name, COUNT(DISTINCT ol.product_id) AS distinct_products_purchased
FROM Users u
JOIN Orders o 
ON u.id = o.user_id
JOIN OrderLines ol 
ON o.id = ol.order_id
JOIN Products p 
ON p.id = ol.product_id
GROUP BY u.name, p.name;

-- 11. Mostrar el nombre del producto y la cantidad de stock disponible, incluyendo tanto los productos 
--que tienen stock como los que no:

SELECT name AS product_name, COALESCE(stock, 0) AS available_stock
FROM Products;

SELECT name AS product_name, stock AS available_stock
FROM Products;

-- La función COALESCE se utiliza para manejar los valores nulos en el caso de que un producto 
-- no tenga stock disponible.


-- 12. Obtener el nombre del usuario y el estado de todas las órdenes que han sido iniciadas, 
-- incluyendo los usuarios que no tienen una correspondencia en la tabla de ordenes:

select * from users;

SELECT  u.lastname,u.name, o.state
FROM Orders o
right JOIN Users u 
ON o.user_id = u.id
order by u.lastname;

SELECT  u.lastname,u.name, o.state
FROM Orders o
JOIN Users u 
ON o.user_id = u.id
order by u.lastname;

-- 13. Listar el nombre del producto y el estado de todas las órdenes, incluyendo las productos que no tienen una 
-- correspondencia en la tabla de ordenes:

SELECT p.name AS product_name, o.state
FROM Products p 
LEFT JOIN orderlines ol 
ON p.id = ol.product_id
LEFT JOIN Orders o 
ON ol.order_id = o.id;

-- 14. Obtener el nombre del usuario y la cantidad de órdenes completadas que ha realizado cada usuario, 
-- incluyendo aquellos usuarios que no han realizado órdenes completadas:

SELECT u.name AS user_name, COUNT(o.id) AS completed_orders
FROM Users u
LEFT JOIN Orders o ON u.id = o.user_id AND o.state = 'Complete'
GROUP BY u.name;

-- 15. Mostrar el nombre del producto y la cantidad total de veces que ha sido comprado, incluyendo 
-- aquellos productos que no han sido comprados:

SELECT p.name AS product_name, COUNT(ol.id) AS total_purchases
FROM Products p
LEFT JOIN OrderLines ol ON p.id = ol.product_id
GROUP BY p.name;

-- 16. Obtener el nombre del usuario y la cantidad de productos distintos que ha comprado, incluyendo aquellos 
-- usuarios que no han realizado ninguna compra:

SELECT u.name AS user_name, COUNT(DISTINCT ol.product_id) AS distinct_products_purchased
FROM Users u
LEFT JOIN Orders o ON u.id = o.user_id
LEFT JOIN OrderLines ol ON o.id = ol.order_id
GROUP BY u.name;
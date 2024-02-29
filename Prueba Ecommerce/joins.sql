-- Seleccionar con inner join todo de la tabla de users y orders
select u.name, u.lastname, o.total_price, o.state 
from users u
inner join orders o
on u.id = o.user_id
order by u.id;

-- Left Join entre las tablas categories y productos
select p.name as producto, c.name as categoria, p.price  
from categories c
left join products p
on c.id = p.category_id;

-- Right Join entre las tablas orderlines y order
select ol.subtotal, ol.quantity, o.total_price, o.state, o.user_id
from orderlines ol
right join orders o
on ol.order_id = o.id;

-- Meter mas categorias
INSERT INTO Categories (name) VALUES
('Quesadillas'),
('Empanadas'),
('Ensaladas'),
('Infusiones');

-- Añadir mas productos
INSERT INTO Products (name, image, price, stock, on_stock, description, category_id)
VALUES
('Quesadilla de Pollo', 'quesadilla.jpg', 8.99, 25, TRUE, 'Deliciosa quesadilla rellena de pollo, queso y verduras.', (SELECT id FROM Categories WHERE name = 'Quesadillas')),
('Quesadilla de Queso', 'quesadilla_queso.jpg', 6.99, 30, TRUE, 'Quesadilla de queso fundido, una opción vegetariana y deliciosa.', (SELECT id FROM Categories WHERE name = 'Quesadillas')),
('Empanada de Carne', 'empanada_carne.jpg', 3.99, 40, TRUE, 'Empanada argentina rellena de carne picada, cebolla y especias.', (SELECT id FROM Categories WHERE name = 'Empanadas')),
('Empanada de Pollo', 'empanada_pollo.jpg', 3.99, 35, TRUE, 'Empanada casera rellena de pollo desmenuzado, un clásico latinoamericano.', (SELECT id FROM Categories WHERE name = 'Empanadas')),
('Ensalada César', 'ensalada_cesar.jpg', 10.99, 20, TRUE, 'Ensalada clásica César con lechuga romana, crutones, pollo a la parrilla y aderezo César.', (SELECT id FROM Categories WHERE name = 'Ensaladas')),
('Ensalada Griega', 'ensalada_griega.jpg', 9.99, 15, TRUE, 'Ensalada fresca griega con pepino, tomate, cebolla roja, aceitunas, queso feta y aderezo de limón.', (SELECT id FROM Categories WHERE name = 'Ensaladas'));

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

-- Obtener el nombre y la categoria de todos los productos junto con su precio
select distinct p.name as producto, c.name as categoria, p.price
from products p
join categories c
on p.category_id = c.id;

-- Mostrar el nombre y la cantidad de stock disponible para todos los productos 
-- que tienen un precio superior a $10
select name, stock 
from products 
where price > 10;

-- 4. Obtener el nombre de usuario y la dirección de todos los administradores:
select distinct name, description
from products
where on_stock = true;

-- 5. Mostrar el nombre del producto y el estado de todas las órdenes que tienen un total superior a $100:
select distinct p.name, o.state, o.total_price
from orders o
join orderlines l
on o.id = l.order_id
join products p
on p.id = l.order_id
where o.total_price > 100;

-- 6. Listar el nombre del producto, la cantidad de stock disponible y el estado de todas las órdenes que 
-- contienen cada producto:
select distinct p.name, p.stock, o.state
from orders o
left join orderlines l
on o.id = l.order_id
left join products p
on p.id = l.order_id;

-- 7. Mostrar el nombre del usuario, el estado de la orden y el precio total de todas las órdenes
-- creadas por usuarios que no sean administradores:
select u.name, o.state, o.total_price
from orders o
join users u
on u.id = o.user_id
where u.is_admin = false;

-- 8. Obtener el nombre de usuario y la cantidad total gastada por cada usuario:
select u.name as user_name, SUM(o.total_price) as total_gasto
from users u
join orders o
on u.id = o.user_id
group by u.name;

-- 9 Listar el nombre del producto y el total de veces(cantidad total) que ha sido comprado:
select p.name, sum(o.quantity)
from products p
join orderlines o 
on p.id = o.product_id
group by p.name;

-- 10. Mostrar el nombre del usuario y la cantidad de productos distintos que ha comprado:  
select u.name, count(distinct ol.product_id) as productos_distintos, p.name as producto
from users u
join orders o
on u.id = o.user_id
join orderlines ol
on o.id = ol.order_id
join products p
on ol.product_id  = p.id
group by u.name ,p.name;

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
select u.name, o.state
from users u
left join orders o
on u.id = o.user_id;

-- 13. Listar el nombre del producto y el estado de todas las órdenes, incluyendo las productos que no tienen una 
-- correspondencia en la tabla de ordenes:
select p.name as producto, o.state
from products p
left join orderlines ol
on ol.product_id = p.id
left join orders o
on ol.order_id = o.id;

-- 14. Obtener el nombre del usuario y la cantidad de órdenes completadas que ha realizado cada usuario, 
-- incluyendo aquellos usuarios que no han realizado órdenes completadas:
select u.name, count(o.id) as orden_completa
from users u
left join orders o
on u.id = o.user_id and o.state = 'Complete'
group by u.name;
select * from users;

-- 15. Mostrar el nombre del producto y la cantidad total de veces que ha sido comprado, incluyendo 
-- aquellos productos que no han sido comprados:
select p.name as producto, count(ol.id) as cantidad_comprada
from products p
left join orderlines ol
on p.id = ol.product_id
group by p.name;

-- 16. Obtener el nombre del usuario y la cantidad de productos distintos que ha comprado, incluyendo aquellos 
-- usuarios que no han realizado ninguna compra:
select u.name as user_name, count(distinct ol.product_id) as prodcutos_comprados
from users u
left join orders o on o.user_id = u.id
left join orderlines ol on ol.order_id = o.id
-- left join products p on ol.product_id = p.id
group by u.name, p.name;
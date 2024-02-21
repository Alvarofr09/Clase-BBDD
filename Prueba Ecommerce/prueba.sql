-- Mostrar todos los productos en stock:
select * from products where on_stock = true;

-- Mostrar todos los pedidos en estado 'Completo':
select * from orders where state = 'Complete';

-- Mostrar todos los usuarios que son administradores:
select * from users where is_admin = TRUE;

-- Mostrar todos los productos con un precio superior a $10:
select name from products where price > 10;

-- Mostrar todos los pedidos realizados por un usuario específico:
select * from orders where user_id = 1;

-- Mostrar todos los productos en una categoría específica:
select * from products where category_id = 1;

-- Mostrar el total de ventas para cada producto:
select subtotal from orderlines group by name;

SELECT (select name from Users where id=product_id), (select lastname from Users where
id=product_id), SUM(subtotal) AS total_sales FROM OrderLines GROUP BY product_id;

-- Mostrar todos los pedidos realizados en una fecha específica:
select * from orders where date = '2024-02-02';

-- Mostrar el nombre y apellido de todos los usuarios ordenados alfabéticamente:
select name, lastname from users order by name asc, lastname asc;

-- Mostrar el nombre y la descripción de todos los productos:
select name, description from products;

-- Mostrar el total de ventas para cada usuario:
select user_id, sum(total_price) as total_sales from orders group by user_id

-- Mostrar el nombre de todas las categorías ordenadas alfabéticamente:
select name from categories order by name asc;

-- Mostrar el número total de productos en stock:
select sum(stock) as total_productos from products;

-- Mostrar el total de ingresos por ventas:
SELECT SUM(total_price) AS total_income FROM Orders WHERE state = 'Complete';

-- Mostrar el nombre de los productos y su precio, ordenados de menor a mayor precio:
select name, price from products order by price asc;

-- Mostrar el número de pedidos en cada estado:
SELECT state, COUNT(*) AS num_orders FROM Orders GROUP BY state;

-- Mostrar el nombre del producto más caro:
select name from products order by price desc limit 1;

-- Mostrar el nombre de los productos con menos de 10 unidades en stock:
select name from products where stock >= 10;

-- Mostrar el promedio de precios de los productos:
select avg(price) from products;

-- Mostrar el número total de pedidos:
select count(*) from orders;

-- 21- Buscar productos por nombre( filtro por nombre, por ejemplo buscar 'al'
SELECT * FROM Products WHERE name LIKE '%al%';

-- 22- Verificar la disponibilidad de un producto específico:
SELECT name, stock FROM Products WHERE id = 8;

-- 23- Actualizar la información de un usuario:
UPDATE Users SET name = 'nuevo_nombre', lastname = 'nuevo_apellido' WHERE id = 6;
select * from users where id = 6;

-- 24- Agregar un producto al carrito de compras:
INSERT INTO OrderLines (subtotal, quantity, order_id, product_id)
VALUES (18.77, 12, 3, 13);
select * from orderlines;

-- 25- Actualizar el estado de una orden:
UPDATE Orders SET state = 'Complete' WHERE id = 5;
select state from Orders where id = 5;

-- 26- Eliminar un producto del carrito de compras: id(order)=5, id(product)=5
select * from orders;
select * from orderlines;
DELETE FROM OrderLines WHERE order_id = 5 AND product_id = 5;

-- 27- Eliminar un usuario (id =10) y todas sus órdenes asociadas:

-- No puedes eliminar el usuario con id = 10 directamente porque hay órdenes asociadas a
-- ese usuario en la tabla de orderlines. Esto se debe a la restricción de clave externa en la
-- base de datos que garantiza la integridad referencial.

-- Para eliminar correctamente un usuario y todas sus órdenes asociadas, primero debes
-- eliminar las entradas correspondientes en la tabla de orderlines, y luego eliminar las
-- órdenes y finalmente el usuario.

-- Eliminar las líneas de pedido asociadas al usuario
DELETE FROM OrderLines WHERE order_id IN (SELECT id FROM Orders WHERE user_id = 10);

-- Eliminar las órdenes del usuario
DELETE FROM Orders WHERE user_id = 10;

-- Finalmente, eliminar el usuario
DELETE FROM Users WHERE id = 10;
select * from users;

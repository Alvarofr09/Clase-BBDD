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
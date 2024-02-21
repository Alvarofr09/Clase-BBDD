select * from users where id in (select id from users where user_role = 'admin');

select * from products where id in (select id from products where on_stock = true);

select name, address from users where id in (select distinct user_id from orders);

select * from products where id in (select id from products) order by price desc;

select * from orders where id in (select id from orders where order_state = 'Complete')

select description from products where id in (select id from products where on_stock = true and price > 8)

select name, price from products where category_id in (select id from categories where name = 'Aceitunas')

select name, lastname from users where id in (select user_id from orders where date = '2024-02-05')
-- 
select id, nombre from jugador where id_videojuego in (select id_videojuego from jugador group by id_videojuego having count(*) >= 2);

select id, nombre from jugador where id_videojuego = ANY (select id_videojuego from jugador group by id_videojuego having count(*) >= 2);

select id, nombre from jugador where id_videojuego = some (select id_videojuego from jugador group by id_videojuego having count(*) >= 2);

-- Recupera todos los jugadores que juegan un juego en Español
select id_videojuego, nombre from jugador where id_videojuego in (select id from videojuego where lenguaje = 'ES');

-- Recuperar nombre de los jugadores con mayor edad
select nombre, edad from jugador order by edad desc limit 1;

select nombre from jugador where edad = (select MAX(edad) from jugador)

-- Recuperar los datos de jugadores que participan en videojuegos que estan puntuandos menos de 8.5
select nombre from jugador where id_videojuego in (select id from videojuego where nota < 8.5);

-- Obtener los titulos de los videojuegos que tienen una puntuacion superior a la puntuacion promedio de todos los videojuegos
select titulo, nota from videojuego where nota > (select avg(nota) from videojuego)

-- Contar el numero de jugadores que juegas al menos a un videojuego en español
select count(*) from jugador where id_videojuego in (select id from videojuego where lenguaje = 'ES');

-- Calcular la edad minima y maxima de los jugadores en la base de datos
select min(edad) as edad_minima, max(edad) as edad_maxima from jugador;

-- Listar los titulos de los videojuegos que tienen al menos un jugador famoso
select titulo from videojuego where id in (select id_videojuego from jugador where es_famoso = true)

-- Calcular el promedio de edad de los jugadores que juegan a videojuegos con una puntutacion superior a 8
select round(avg(edad))from jugador where id_videojuego in (select id from videojuego where nota > 8)

-- Listar los nombre de los jugadores que tienen la misma edad que el jugador mas joven
select nombre from jugador where edad = (select min(edad) from jugador )

-- Contar el numero de videojuegos que tienen al menos 3 jugadores asociados
select count(*) from videojuego where id in (select id_videojuego from jugador group by id_videojuego having count(*) >= 3)

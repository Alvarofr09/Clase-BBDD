CREATE TABLE peliculas (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    actor_principal VARCHAR(100),
    año INTEGER,
    director VARCHAR(100),
    score DECIMAL(3,1),
    votacion INTEGER,
    duracion INTEGER,
    premios INTEGER
);

INSERT INTO peliculas (nombre, actor_principal, año, director, score, votacion, duracion, premios) VALUES
('Titanic', 'Leonardo DiCaprio', 1997, 'James Cameron', 8.5, 500, 195, 11),
('El Padrino', 'Marlon Brando', 1972, 'Francis Ford Coppola', 9.0, 600, 175, 3),
('La La Land', 'Ryan Gosling', 2016, 'Damien Chazelle', 7.8, 400, 128, 6),
('El Señor de los Anillos: La Comunidad del Anillo', 'Elijah Wood', 2001, 'Peter Jackson', 8.9, 550, 178, 4),
('La Lista de Schindler', 'Liam Neeson', 1993, 'Steven Spielberg', 8.7, 520, 195, 7),
('Forrest Gump', 'Tom Hanks', 1994, 'Robert Zemeckis', 8.2, 480, 142, 6),
('Gladiator', 'Russell Crowe', 2000, 'Ridley Scott', 8.4, 510, 155, 5),
('El Rey León', NULL, 1994, 'Roger Allers, Rob Minkoff', 8.8, 540, 88, 2),
('Pulp Fiction', 'John Travolta', 1994, 'Quentin Tarantino', 8.9, 550, 154, 1),
('Interestelar', 'Matthew McConaughey', 2014, 'Christopher Nolan', 8.6, 530, 169, 1),
('El Origen', 'Leonardo DiCaprio', 2010, 'Christopher Nolan', 8.7, 520, 148, 4),
('Toy Story', NULL, 1995, 'John Lasseter', 8.5, 500, 81, 4),
('Parasite', NULL, 2019, 'Bong Joon-ho', 8.6, 530, 132, 4),
('Jurassic Park', 'Sam Neill', 1993, 'Steven Spielberg', 8.3, 490, 127, 3),
('La Vida es Bella', 'Roberto Benigni', 1997, 'Roberto Benigni', 8.9, 550, 116, 3),
('Los Increíbles', NULL, 2004, 'Brad Bird', 8.4, 510, 115, 2),
('Matrix', 'Keanu Reeves', 1999, 'Lana Wachowski, Lilly Wachowski', 8.7, 520, 136, 4),
('Harry Potter y la Piedra Filosofal', 'Daniel Radcliffe', 2001, 'Chris Columbus', 8.1, 470, 152, 7),
('El Lobo de Wall Street', 'Leonardo DiCaprio', 2013, 'Martin Scorsese', 8.8, 540, 180, 0),
('Avatar', 'Sam Worthington', 2009, 'James Cameron', 8.5, 500, 162, 3);

-- Ejercicio de crear vista
create view cinco_mayor_score as select nombre from peliculas order by score desc limit 5;

select * from cinco_mayor_score;

-- Crear una secuencia - Un tipo serial pero personalizado
create sequence my_sequence start with 1 increment by 2 minvalue 1 maxvalue 20 cycle;
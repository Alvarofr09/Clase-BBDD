CREATE TABLE videojuego (
	id SERIAL PRIMARY KEY,
	titulo VARCHAR(100) NOT NULL,
	lenguaje VARCHAR(5) NOT NULL,
	resumen TEXT,
	nota DECIMAL(3,1),
	total_jugadores INT DEFAULT 0
);

CREATE TABLE jugador (
	id SERIAL PRIMARY KEY,
	nombre VARCHAR(80) NOT NULL,
	edad INT NOT NULL,
	es_famoso BOOLEAN NOT NULL DEFAULT FALSE,
	id_videojuego INT NOT NULL,
	FOREIGN KEY (id_videojuego) REFERENCES videojuego (id),
	fecha_registro DATE
);

INSERT INTO videojuego (titulo, lenguaje, resumen, nota, total_jugadores) VALUES
('The Witcher 3: Wild Hunt', 'EN', 'Un juego de rol de acción en un mundo de fantasía
abierto, donde los jugadores asumen el papel de Geralt de Rivia, un cazador de monstruos
conocido como un Witcher.', 9.3, 15000000),
('Red Dead Redemption 2', 'EN', 'Un épico juego de acción y aventuras en un vasto mundo
abierto del Viejo Oeste americano, desarrollado por Rockstar Games.', 9.8, 12000000),
('Cyberpunk 2077', 'EN', 'Un juego de rol de acción en un mundo abierto futurista, donde los
jugadores asumen el papel de un mercenario conocido como V, en la peligrosa ciudad de
Night City.', 7.2, 8000000),
('The Legend of Zelda: Breath of the Wild', 'EN', 'Un juego de aventuras de mundo abierto,
donde los jugadores controlan a Link, quien despierta de un largo sueño para explorar
Hyrule y derrotar al malvado Calamity Ganon.', 9.5, 10000000),
('God of War', 'EN', 'Un juego de acción y aventuras en tercera persona, donde los
jugadores controlan a Kratos, un semidiós espartano que emprende un viaje con su hijo
Atreus a través de la mitología nórdica.', 9.7, 11000000),
('Grand Theft Auto V', 'EN', 'Un juego de acción y aventuras en un mundo abierto, donde los
jugadores pueden explorar la ciudad ficticia de Los Santos y el condado de Blaine.', 9.6,
20000000),
('Super Mario Odyssey', 'EN', 'Un juego de plataformas en 3D, donde los jugadores
controlan a Mario mientras viaja a través de diversos reinos en su nave, el Odyssey, para
rescatar a la Princesa Peach de Bowser.', 9.4, 15000000),
('Dark Souls III', 'EN', 'Un juego de rol de acción en tercera persona, conocido por su alta
dificultad y su diseño de mundo interconectado, donde los jugadores luchan contra
monstruos y jefes desafiantes.', 9.0, 6000000),
('Bloodborne', 'EN', 'Un juego de rol de acción en tercera persona, desarrollado por
FromSoftware, conocido por su atmósfera oscura y su combate desafiante, donde los
jugadores exploran la ciudad gótica de Yharnam.', 9.1, 5000000),
('Persona 5', 'EN', 'Un juego de rol japonés en el que los jugadores controlan a un estudiante
transferido conocido como Joker, quien lleva una doble vida como ladrón fantasma para
robar el corazón de los corruptos.', 9.2, 7000000);


INSERT INTO jugador (nombre, edad, es_famoso, id_videojuego, fecha_registro) VALUES
('Juan Pérez', 25, false, 1, '2023-05-10'),
('María González', 28, true, 1, '2023-06-15'),
('Luis Ramirez', 30, false, 2, '2023-07-20'),
('Ana Martínez', 22, true, 2, '2023-08-25'),
('Pedro López', 26, true, 3, '2023-09-30'),
('Carla Rodríguez', 29, false, 3, '2023-10-05'),
('David García', 24, true, 4, '2023-11-10'),
('Sofía Fernández', 27, false, 4, '2023-12-15'),
('Miguel Sánchez', 31, false, 5, '2024-01-20'),
('Lucía Pérez', 23, true, 5, '2024-02-25'),
('Daniel Martínez', 26, false, 6, '2024-03-30'),
('Elena Gómez', 29, true, 6, '2024-04-05'),
('Diego Rodríguez', 28, false, 7, '2024-05-10'),
('Laura Fernández', 25, true, 7, '2024-06-15'),
('José García', 30, false, 8, '2024-07-20'),
('Marta Sánchez', 24, true, 8, '2024-08-25'),
('Alejandro López', 27, false, 9, '2024-09-30'),
('Andrea Ramírez', 22, true, 9, '2024-10-05'),
('Pablo Ruiz', 31, false, 10, '2024-11-10'),
('Rocío Martínez', 26, true, 10, '2024-12-15');

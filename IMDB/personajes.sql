DROP TABLE PERSONAJES;
CREATE TABLE personajes (
    id serial PRIMARY KEY,
    nombre VARCHAR(100) NOT NULL,
    autor VARCHAR(100) NOT NULL,
    año INT,
    capitulos INT,
    años_al_aire int ,
    capitulos_por_año NUMERIC(10, 2)  
);

INSERT INTO personajes (nombre, autor, año, capitulos) VALUES
('Mickey Mouse', 'Walt Disney', 1928, 130),
('Bugs Bunny', 'Warner Bros.', 1940, 175),
('SpongeBob SquarePants', 'Stephen Hillenburg', 1999, 250),
('Dora the Explorer', 'Chris Gifford', 2000, 178),
('Peppa Pig', 'Neville Astley', 2004, 314),
('Bob the Builder', 'Keith Chapman', 1998, 250),
('Tom and Jerry', 'William Hanna', 1940, 163),
('Los Picapiedra', 'William Hanna', 1960, 166),
('Los Supersónicos', 'William Hanna', 1962, 75),
('El Oso Yogi', 'William Hanna', 1961, 33),
('Pikachu', 'Satoshi Tajiri', 1996, 24),
('Scooby-Doo', 'Joe Ruby', 1969, 371),
('Dinamita, el perro maravilla', 'Joe Ruby', 1976, 20),
('Hello Kitty', 'Yuko Shimizu', 1974, 52),
('Winnie the Pooh', 'A. A. Milne', 1926, 52),
('Masha and the Bear', 'Oleg Kuzovkov', 2009, 79),
('Sonic the Hedgehog', 'Naoto Ohshima', 1991, 290),
('The Smurfs', 'Peyo', 1958, 272),
('Alvin y las Ardillas', 'Neville Astley', 1983, 102), 
('Las Aventuras de Mister T', 'Neville Astley', 1983, 30),
('Arthur Read', 'Marc Brown', 1996, 246);

UPDATE personajes SET años_al_aire = EXTRACT(YEAR FROM CURRENT_DATE) - año;

UPDATE personajes SET capitulos_por_año = capitulos / (EXTRACT(YEAR FROM CURRENT_DATE) - año);
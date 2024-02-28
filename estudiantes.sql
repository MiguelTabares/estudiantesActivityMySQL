-- Cliente:
-- Como cliente tengo la necesidad de crear una base de datos que me permita almacenar la información de los estudiantes, materias y notas obtenidas por los estudiantes sobre las materias.

CREATE TABLE estudiantes(
  id INT PRIMARY KEY AUTO_INCREMENT ,
  nombres VARCHAR(45) NOT NULL,
  apellidos VARCHAR(45) NOT NULL,
  fecha_nacimiento DATE NOT NULL
);


-- 1. Se deben insertar en la base de datos 10 estudiantes:

INSERT INTO estudiantes(nombres, apellidos, fecha_nacimiento)
VALUES 
('Miguel', 'Tabares', '1996-02-18'),
('Manuela', 'Torres', '1995-01-19'),
('Manuel', 'Pérez', '1997-03-21'),
('Keity', 'Ortega', '1991-05-31'),
('Marta', 'Tuberquia', '1993-06-23'),
('Olga', 'Suárez', '1980-06-11'),
('Carlos', 'Muñoz', '1990-07-25'),
('Pedro', 'Osorio', '1986-11-23'),
('Juan', 'Fernández', '1994-08-10'),
('José', 'Benítez', '1998-12-26');

CREATE TABLE IF NOT EXISTS materias(
  id INT  PRIMARY KEY AUTO_INCREMENT, 
  nombre_materia VARCHAR(45) NOT NULL
);


-- 2. Se deben registrar 10 materias:

INSERT INTO  materias(nombre_materia)
VALUES 
('Matemáticas'),
('Estadística'),
('Inglés'),
('Ética'),
('Física'),
('Química'),
('Ed. Física'),
('Habilidades blandas'),
('Filosofía'),
('Cálculo');


CREATE TABLE IF NOT EXISTS notas(
  id INT PRIMARY KEY AUTO_INCREMENT,
  id_estudiante INT NOT NULL,
  id_materia INT NOT NULL,
  nota FLOAT NOT NULL,
  FOREIGN KEY (id_estudiante) REFERENCES estudiantes(id),
  FOREIGN KEY (id_materia) REFERENCES materias(id)
);


--3. Cada estudiante deberá tener como mínimo 3 materias asociadas:

INSERT INTO notas(id_estudiante, id_materia, nota) 
VALUES
(1, 1, 3.9),
(1, 2, 4.2),
(1, 3, 5.0),
(2, 4, 4.1),
(2, 5, 4.3),
(2, 6, 3.8),
(3, 7, 2.6),
(3, 8, 3.4),
(3, 9, 4.7),
(4, 1, 4.2),
(4, 2, 3.5),
(4, 3, 3.9),
(5, 4, 4.3),
(5, 5, 4.8),
(5, 6, 2.7),
(6, 7, 1.5),
(6, 8, 4.6),
(6, 9, 3.2),
(7, 1, 4.9),
(7, 2, 3.4),
(7, 3, 4.7),
(8, 4, 4.3),
(8, 5, 3.6),
(8, 6, 4.8),
(9, 7, 5.0),
(9, 8, 3.7),
(9, 9, 4.9),
(10, 1, 4.2),
(10, 2, 4.0),
(10, 3, 4.5);


SELECT * FROM notas WHERE nota > 3.0;

SELECT * FROM estudiantes WHERE nombres LIKE 'M%';

SELECT * FROM estudiantes WHERE apellidos LIKE '%z';

SELECT * FROM materias WHERE nombre_materia LIKE '%a';
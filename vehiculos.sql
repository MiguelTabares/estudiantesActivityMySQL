-- Active: 1708955100855@@buzzrvts6wyahgq6irr8-mysql.services.clever-cloud.com@3306@buzzrvts6wyahgq6irr8
CREATE TABLE colores(
	id INT primary key AUTO_INCREMENT,
    color VARCHAR(45)
);

DROP TABLE colores;


CREATE TABLE marcas(
	id INT primary key AUTO_INCREMENT,
    marca VARCHAR(45)
);

DROP TABLE marcas;

CREATE TABLE tipo_vehiculos(
	id INT primary key AUTO_INCREMENT,
    tipo_vehiculo VARCHAR(45),
    marca_id INT
);
DROP TABLE tipo_vehiculos;

CREATE TABLE vehiculos(
	id INT primary key AUTO_INCREMENT,
    modelo VARCHAR(45),
    placa VARCHAR(10) UNIQUE,
    color_id INT,
    tipo_vehiculo_id INT
);

DROP TABLE vehiculos;


INSERT INTO marcas(marca)
VALUES 
('Lamborgini'),
('Chevrolet');

INSERT INTO tipo_vehiculos(tipo_vehiculo, marca_id)
VALUES
('Automóvil', 2),
('Autobus', 1);

INSERT INTO colores(color)
VALUES 
('Azul'),
('Amarillo');

INSERT INTO vehiculos(modelo, placa, color_id, tipo_vehiculo_id)
VALUES
('2024', 'TNG525', 2, 1 ),
('2020', 'XHT414', 1, 2 ),
('2023', 'SDR368', 1, 1 ),
('2021', 'QWE356', 1, 2 ),
('2019', 'XVY221', 2, 2 ),
('2024', 'SDF243', 2, 1 ),
('2024', 'FDG345', 1, 1 ),
('2024', 'FHJ651', 1, 2 ),
('2024', 'JHF542', 2, 1 ),
('2024', 'DFH023', 1, 2 );

--Agregar llave foránea color_id en la tabla vehículos
ALTER TABLE vehiculos ADD FOREIGN KEY (color_id) REFERENCES colores(id);

--Agregar llave foránea tipo_vehiculo_id en la tabla vehículos

ALTER TABLE vehiculos ADD FOREIGN KEY (tipo_vehiculo_id) REFERENCES tipo_vehiculos(id);

--Agregar llave foránea marca_id en la tabla tipo_vehiculo

ALTER TABLE tipo_vehiculos ADD FOREIGN KEY (marca_id) REFERENCES marcas(id);


--INNER JOIN ENTRE LA TABLA VEHÍCULOS Y LA TABLA COLORES
SELECT vehiculos.placa, vehiculos.modelo, colores.color FROM vehiculos INNER JOIN colores WHERE vehiculos.color_id = colores.id;

--INNER JOIN ENTRE LA TABLA VEHÍCULOS Y LA TABLA TIPO DE VEHÍCULO

SELECT vehiculos.placa, vehiculos.modelo, tipo_vehiculos.tipo_vehiculo FROM vehiculos INNER JOIN tipo_vehiculos WHERE vehiculos.tipo_vehiculo_id = tipo_vehiculos.id;

--INNER JOIN ENTRE LA TABLA VEHÍCULOS, LA TABLA MARCAS, LA TABLA TIPO VEHÍCULOS Y LA TABLA COLORES

SELECT vehiculos.placa, vehiculos.modelo, tipo_vehiculos.tipo_vehiculo, colores.color, marcas.marca FROM vehiculos INNER JOIN tipo_vehiculos INNER JOIN colores INNER JOIN marcas
WHERE 
    vehiculos.tipo_vehiculo_id = tipo_vehiculos.id AND vehiculos.color_id = colores.id AND tipo_vehiculos.marca_id = marcas.id;

SELECT * from marcas

SELECT * from tipo_vehiculos


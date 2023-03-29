-- Active: 1679485957399@@127.0.0.1@3306@tpi
CREATE DATABASE TPI;
USE TPI;
CREATE TABLE Visita (
  id INT PRIMARY KEY,
  dni INT,
  nombre VARCHAR(255),
  apellido VARCHAR(255),
  fechaNacimiento DATE
);
CREATE TABLE Guia (
  id INT PRIMARY KEY,
  dni INT,
  nombre VARCHAR(255),
  apellido VARCHAR(255),
  fechaNacimiento DATE
);
CREATE TABLE VisitaGuiada (
  id INT PRIMARY KEY,
  nombre VARCHAR(255),
  descripcion VARCHAR(255),
  fecha DATETIME,
  guia INT,
  FOREIGN KEY (guia) REFERENCES Guia(id)
);
CREATE TABLE Area (
  id INT PRIMARY KEY,
  nombre VARCHAR(255),
  descripcion VARCHAR(255)
);

CREATE TABLE Especie (
  id INT PRIMARY KEY,
  nombre VARCHAR(255),
  descripcion VARCHAR(255)
);

CREATE TABLE Habitat (
  id INT PRIMARY KEY,
  nombre VARCHAR(255),
  descripcion VARCHAR(255)
);

CREATE TABLE Adoptante (
  id INT PRIMARY KEY,
  dni INT,
  nombre VARCHAR(255),
  apellido VARCHAR(255),
  fechaNacimiento DATE
);
CREATE TABLE EstadoAdopcion(
    id INT PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion VARCHAR(100)
);
CREATE TABLE Alimentacion(
  id INT PRIMARY KEY,
  nombre VARCHAR(50),
  descripcion VARCHAR(100)
);

CREATE TABLE Animales (
  id INT PRIMARY KEY,
  nombre VARCHAR(255),
  descripcion VARCHAR(255),
  precio INT,
  fechaAdopcion DATE,
  fechaNacimiento DATE,
  fechaDefuncion DATE,
  especie INT,
  adoptante INT,
  estadoAdopcion INT,
  alimentacion INT,
  Foreign Key (alimentacion) REFERENCES Alimentacion(id),
  FOREIGN KEY (estadoAdopcion) REFERENCES EstadoAdopcion(id),
  FOREIGN KEY (especie) REFERENCES Especie(id),
  FOREIGN KEY (adoptante) REFERENCES Adoptante(id)
);

CREATE TABLE Qr (
  id INT PRIMARY KEY,
  link VARCHAR(255),
  habitat INT,
  FOREIGN KEY (habitat) REFERENCES Habitat(id)
);

CREATE TABLE Campaign (
  id INT PRIMARY KEY,
  nombre VARCHAR(255),
  descripcion VARCHAR(255)
);


CREATE TABLE Especie_Campaign(
    id INT PRIMARY KEY,
    especie INT,
    campaign INT,
    FOREIGN KEY (especie) REFERENCES Especie(id),
    FOREIGN KEY (campaign) REFERENCES Campaign(id)
);


CREATE TABLE visita_visitaguiada(
    id INT PRIMARY KEY,
    visitaguiada INT,
    visita INT,
    FOREIGN KEY (visita) REFERENCES Visita(id),
    FOREIGN KEY(visitaguiada) REFERENCES VisitaGuiada(id)
);
CREATE TABLE Area_VisitaGuiada(
    id INT PRIMARY KEY,
    visitaguiada INT,
    area INT,
    FOREIGN KEY(visitaguiada) REFERENCES VisitaGuiada(id),
    FOREIGN KEY(area) REFERENCES Area(id)
);

--Inserts for all tables




--INSERTS para la tabla "Visita"

INSERT INTO Visita (id, dni, nombre, apellido, fechaNacimiento) VALUES
(1, 12345678, 'Juan', 'Perez', '1990-05-15'),
(2, 23456789, 'Maria', 'Gomez', '1995-10-20'),
(3, 34567890, 'Pedro', 'Rodriguez', '1988-02-01'),
(4, 12345678, 'Juan', 'Pérez', '1990-01-01'),
(5, 45678901, 'Carla', 'Fernandez', '2000-12-25');

--INSERTS para la tabla "Guia"

INSERT INTO Guia (id, dni, nombre, apellido, fechaNacimiento) VALUES
(1, 34567890, 'Lucia', 'Garcia', '1992-07-07'),
(2, 45678901, 'Carlos', 'Lopez', '1987-11-18'),
(3, 56789012, 'Mariana', 'Diaz', '1998-04-30'),
(4, 67890123, 'Jorge', 'Martinez', '1995-09-22'),
(5, 23456789, 'María', 'García', '1995-05-05');

--INSERTS para la tabla "VisitaGuiada"

INSERT INTO VisitaGuiada (id, nombre, descripcion, fecha, guia) VALUES
(1, 'Visita guiada 1', 'Descripción de la visita guiada 1', '2023-04-01 10:00:00', 1),
(1, 'Recorrido por la selva', 'Visita guiada por la selva amazónica', '2022-05-10 10:00:00', 1),
(2, 'Descubriendo la fauna', 'Visita guiada para conocer la fauna local', '2022-06-15 14:00:00', 2),
(3, 'Explorando la flora', 'Visita guiada para conocer la flora del lugar', '2022-07-20 11:00:00', 3),
(4, 'Aprendiendo sobre la historia', 'Visita guiada para conocer la historia de la zona', '2022-08-25 15:00:00', 4);

--INSERTS para la tabla "Area"

INSERT INTO Area (id, nombre, descripcion) VALUES
(1, 'Bosque', 'Área de bosque natural'),
(2, 'Acuario', 'Área de acuario con variedad de peces'),
(3, 'Jardín botánico', 'Área con una gran variedad de plantas'),
(4, 'Humedal', 'Área de humedal con una gran diversidad de fauna y flora'),
(5, 'Área 1', 'Descripción del área 1');

--INSERTS para la tabla "Especie"

INSERT INTO Especie (id, nombre, descripcion) VALUES
(1, 'Especie 1', 'Descripción de la especie 1'),
(2, 'Puma', 'Animal carnívoro de tamaño mediano'),
(3, 'Tucán', 'Ave tropical con pico muy llamativo'),
(4, 'Pez payaso', 'Pequeño pez tropical con colores llamativos'),
(5, 'León', 'Animal salvaje de gran tamaño y fuerza')
;

--INSERTS para la tabla "Habitat"

INSERT INTO Habitat (id, nombre, descripcion) VALUES
(1, 'Hábitat 1', 'Descripción del hábitat 1'),
(2, 'Desierto', 'Área seca y árida con poca vegetación'),
(3, 'Bosque templado', 'Área de bosque con clima templado'),
(4, 'Océano', 'Área marina con gran variedad de vida'),
(5, 'Selva', 'Área con gran diversidad de fauna y flora');

--INSERTS para la tabla "Adoptante"

INSERT INTO Adoptante (id, dni, nombre, apellido, fechaNacimiento) VALUES
(1, 12345678, 'Luisa', 'Pérez', '1985-05-12'),
(2, 23456789, 'Juan', 'Gómez', '1990-11-15'),
(3, 34567890, 'María', 'González', '1982-02-20'),
(4, 45678901, 'Pedro', 'Martínez', '1995-08-02'),
(5, 34567890, 'Ana', 'López', '2000-10-10');

--INSERTS para la tabla "EstadoAdopcion"

INSERT INTO EstadoAdopcion (id, nombre, descripcion) VALUES
(1, 'Disponible', 'El animal está disponible para ser adoptado'),
(2, 'En proceso', 'El animal está en proceso de adopción'),
(3, 'Adoptado', 'El animal ha sido adoptado');

--INSERTS para la tabla "Alimentacion"

INSERT INTO Alimentacion (id, nombre, descripcion) VALUES
(1, 'Vegetariana', 'Alimento basado en vegetales y granos'),
(2, 'Carnívora', 'Alimento basado en carne y proteínas animales'),
(3, 'Omnívora', 'Alimento basado en ambos vegetales y proteínas animales');

--INSERTS para la tabla "Animales"

INSERT INTO Animales (id, nombre, descripcion, precio, fechaAdopcion, fechaNacimiento, fechaDefuncion, especie, adoptante, estadoAdopcion, alimentacion) VALUES
(1, 'Animal 1', 'Descripción del animal 1', 100, '2023-03-01', '2022-01-01', NULL, 1, NULL, 1, 1),
(2, 'Simón', 'Perro de raza labrador', 800, '2022-03-10', '2021-09-20', NULL, 2, NULL, 1, 2),
(3, 'Milo', 'Periquito australiano', 50, '2021-12-01', '2021-06-15', '2022-02-20', 3, 1, 3, 1),
(4, 'Nina', 'Gata de pelo anaranjado', 400, NULL, '2021-05-10', NULL, 1, NULL, 1, 3),
(5, 'Luna', 'Gata de pelo negro', 500, '2022-01-15', '2021-07-05', NULL, 1, 2, 3, 1);

--INSERTS para la tabla "Qr"

INSERT INTO Qr (id, link, habitat) VALUES
(1, 'https://qr.com/1', 1),
(2, 'https://qr.com/2', 1),
(3, 'https://qr.com/3', 3),
(4, 'https://qr.com/4', 2)
(5, 'https://qr.com/5', 2);

--INSERTS para la tabla "Campaign"

INSERT INTO Campaign (id, nombre, descripcion) VALUES
(1, 'Campaña 1', 'Descripción de la campaña 1')
(2, 'Adopta un animal', 'Campaña para incentivar la adopción de animales'),
(3, 'Salva una especie', 'Campaña para recaudar fondos y proteger una especie en peligro de extinción')
;

--INSERTS para la tabla "visita_visitaguiada"

INSERT INTO visita_visitaguiada (id, visitaguiada, visita) VALUES 
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5);

--INSERTS para la tabla "Area_VisitaGuiada"

INSERT INTO Area_VisitaGuiada (id, visitaguiada, area) VALUES
(1, 1, 1),
(2, 2, 2),
(3, 3, 3),
(4, 4, 4),
(5, 5, 5);;

--INSERTS para la tabla "Especie_Campaign"

INSERT INTO Especie_Campaign (id, especie, campaign) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1),
(5, 5, 1);



--Query 1
SELECT VisitaGuiada.id, VisitaGuiada.nombre, VisitaGuiada.descripcion, VisitaGuiada.fecha
FROM VisitaGuiada
INNER JOIN visita_visitaguiada ON VisitaGuiada.id = visita_visitaguiada.visitaguiada
INNER JOIN Visita ON visita_visitaguiada.visita = Visita.id
WHERE VisitaGuiada.fecha >= CURDATE() AND VisitaGuiada.fecha < CURDATE() + INTERVAL 1 DAY AND TIMESTAMPDIFF(YEAR, Visita.fechaNacimiento, CURDATE()) > 30;

--Query 2
SELECT E.nombre AS clase_animal, COUNT(A.id) AS cantidad_total, 
       SUM(CASE WHEN A.fechaDefuncion IS NULL THEN 1 ELSE 0 END) AS cantidad_actual,
       SUM(CASE WHEN A.fechaDefuncion IS NOT NULL THEN 1 ELSE 0 END) AS cantidad_defunciones
FROM Animales A
INNER JOIN Especie E ON A.especie = E.id
GROUP BY E.nombre;

--Query 3
SELECT E.nombre AS especie, COUNT(A.id) AS cantidad_total, 
       SUM(CASE WHEN YEAR(A.fechaNacimiento) = YEAR(CURRENT_DATE()) THEN 1 ELSE 0 END) AS cantidad_nacimientos,
       SUM(CASE WHEN YEAR(A.fechaDefuncion) = YEAR(CURRENT_DATE()) THEN 1 ELSE 0 END) AS cantidad_defunciones
FROM Animales A
INNER JOIN Especie E ON A.especie = E.id
GROUP BY E.nombre;

--Query 4
SELECT *
FROM Animales a
JOIN Especie e ON a.especie = e.id
WHERE e.nombre = 'Mamifero' AND a.alimentacion = 2 AND a.estadoAdopcion IS NOT NULL;

--Query 5
SELECT Guia.nombre, Guia.apellido, COUNT(*) AS visitas_realizadas
FROM Guia
INNER JOIN VisitaGuiada ON Guia.id = VisitaGuiada.guia
INNER JOIN visita_visitaguiada ON VisitaGuiada.id = visita_visitaguiada.visitaguiada
INNER JOIN Visita ON visita_visitaguiada.visita = Visita.id
WHERE MONTH(VisitaGuiada.fecha) = MONTH(CURDATE()) AND 
      YEAR(CURDATE()) - YEAR(Guia.fechaNacimiento) > 23 AND
      Guia.nombre LIKE '%[aeiou]'
GROUP BY Guia.nombre, Guia.apellido;
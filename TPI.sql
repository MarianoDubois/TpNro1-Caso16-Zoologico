CREATE DATABASE TPI;
USE TPI;
CREATE TABLE Visita (
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
  fecha DATETIME
  
);
CREATE TABLE Guia (
  id INT PRIMARY KEY,
  dni INT,
  nombre VARCHAR(255),
  apellido VARCHAR(255),
  fechaNacimiento DATE
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
    guia INT,
    visita INT,
    FOREIGN KEY (visita) REFERENCES Visita(id),
    FOREIGN KEY (guia) REFERENCES Guia(id)
);
CREATE TABLE Area_VisitaGuiada(
    id INT PRIMARY KEY,
    visitaguiada INT,
    area INT,
    FOREIGN KEY(visitaguiada) REFERENCES VisitaGuiada(id),
    FOREIGN KEY(area) REFERENCES Area(id)
);

#Inserts for all tables
INSERT INTO Visita (id, dni, nombre, apellido, fechaNacimiento) VALUES (1, 12345678, 'Juan', 'Pérez', '1990-01-01');
INSERT INTO VisitaGuiada (id, nombre, descripcion, fecha) VALUES (1, 'Visita guiada 1', 'Descripción de la visita guiada 1', '2023-04-01 10:00:00');
INSERT INTO Guia (id, dni, nombre, apellido, fechaNacimiento) VALUES (1, 23456789, 'María', 'García', '1995-05-05');
INSERT INTO Area (id, nombre, descripcion) VALUES (1, 'Área 1', 'Descripción del área 1');
INSERT INTO Especie (id, nombre, descripcion) VALUES (1, 'Especie 1', 'Descripción de la especie 1');
INSERT INTO Habitat (id, nombre, descripcion) VALUES (1, 'Hábitat 1', 'Descripción del hábitat 1');
INSERT INTO Adoptante (id, dni, nombre, apellido, fechaNacimiento) VALUES (1, 34567890, 'Ana', 'López', '2000-10-10');
INSERT INTO EstadoAdopcion (id, nombre, descripcion) VALUES (1, 'Disponible', 'El animal está disponible para ser adoptado');
INSERT INTO Alimentacion (id, nombre, descripcion) VALUES (1, 'Carnívoro', 'Alimentación basada en carne');
INSERT INTO Animales (id, nombre, descripcion, precio, fechaAdopcion, fechaNacimiento, fechaDefuncion, especie, adoptante, estadoAdopcion, alimentacion) VALUES (1, 'Animal 1', 'Descripción del animal 1', 100, '2023-03-01', '2022-01-01', NULL, 1, NULL, 1, 1);
INSERT INTO Qr (id, link, habitat) VALUES (1, 'https://www.example.com/qr1', 1);
INSERT INTO Campaign (id, nombre, descripcion) VALUES (1, 'Campaña 1', 'Descripción de la campaña 1');
INSERT INTO Especie_Campaign (id, especie, campaign) VALUES (1, 1, 1);
INSERT INTO visita_visitaguiada (id, guia, visita) VALUES (1, 1, 1);
INSERT INTO Area_VisitaGuiada (id, visitaguiada, area) VALUES (1, 1, 1);

#Query 1
SELECT VisitaGuiada.id, VisitaGuiada.nombre, VisitaGuiada.descripcion, VisitaGuiada.fecha
FROM VisitaGuiada
INNER JOIN visita_visitaguiada ON VisitaGuiada.id = visita_visitaguiada.visitaguiada
INNER JOIN Visita ON visita_visitaguiada.visita = Visita.id
WHERE VisitaGuiada.fecha >= CURDATE() AND VisitaGuiada.fecha < CURDATE() + INTERVAL 1 DAY AND TIMESTAMPDIFF(YEAR, Visita.fechaNacimiento, CURDATE()) > 30;

#Query 2
SELECT E.nombre AS clase_animal, COUNT(A.id) AS cantidad_total, 
       SUM(CASE WHEN A.fechaDefuncion IS NULL THEN 1 ELSE 0 END) AS cantidad_actual,
       SUM(CASE WHEN A.fechaDefuncion IS NOT NULL THEN 1 ELSE 0 END) AS cantidad_defunciones
FROM Animales A
INNER JOIN Especie E ON A.especie = E.id
GROUP BY E.nombre;

#Query 3
SELECT E.nombre AS especie, COUNT(A.id) AS cantidad_total, 
       SUM(CASE WHEN YEAR(A.fechaNacimiento) = YEAR(CURRENT_DATE()) THEN 1 ELSE 0 END) AS cantidad_nacimientos,
       SUM(CASE WHEN YEAR(A.fechaDefuncion) = YEAR(CURRENT_DATE()) THEN 1 ELSE 0 END) AS cantidad_defunciones
FROM Animales A
INNER JOIN Especie E ON A.especie = E.id
GROUP BY E.nombre;

#Query 4
SELECT *
FROM Animales a
JOIN Especie e ON a.especie = e.id
WHERE e.nombre = 'Mamifero' AND a.alimentacion = 2 AND a.estadoAdopcion IS NOT NULL;

#Query 5
SELECT g.nombre, g.apellido, COUNT(*) AS total_visitas_guiadas
FROM Guia g
JOIN visita_visitaguiada vvg ON g.id = vvg.guia
WHERE MONTH(vvg.fecha) = MONTH(CURRENT_DATE()) AND YEAR(vvg.fecha) = YEAR(CURRENT_DATE()) 
AND (DATEDIFF(CURRENT_DATE(), g.fechaNacimiento) / 365.25) > 23 AND g.nombre REGEXP '[aeiouAEIOU]$'
GROUP BY g.id

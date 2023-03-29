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
  descripcion VARCHAR(255)
  
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
  estadoAdopcion VARCHAR(255),
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

CREATE TABLE estadoAdopcion(
    id INT PRIMARY KEY,
    nombre VARCHAR(100),
    descripcion VARCHAR(100)
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

INSERT INTO Visita (id, dni, nombre, apellido, fechaNacimiento) VALUES
(1, 12345678, 'Juan', 'Pérez', '1990-01-01'),
(2, 23456789, 'María', 'García', '1985-05-15'),
(3, 34567890, 'Pedro', 'López', '2000-12-31');

INSERT INTO VisitaGuiada (id, nombre, descripcion) VALUES
(1, 'Visita guiada por la selva', 'Recorrido por la selva amazónica'),
(2, 'Visita guiada por la sabana', 'Recorrido por la sabana africana');

INSERT INTO Guia (id, dni, nombre, apellido, fechaNacimiento) VALUES
(1, 11111111, 'Pablo', 'Gómez', '1980-03-20'),
(2, 22222222, 'Lucía', 'Fernández', '1995-08-10');

INSERT INTO Area (id, nombre, descripcion) VALUES
(1, 'Selva', 'Bosque tropical'),
(2, 'Savana', 'Pradera africana');

INSERT INTO Especie (id, nombre, descripcion)
VALUES (1, 'Perro', 'Mamífero doméstico de la familia de los cánidos');

INSERT INTO Habitat (id, nombre, descripcion)
VALUES (1, 'Bosque templado', 'Ecosistema caracterizado por árboles de hoja caduca');

INSERT INTO Adoptante (id, dni, nombre, apellido, fechaNacimiento)
VALUES (1, 12345678, 'Juan', 'Pérez', '1990-05-01');

INSERT INTO Animales (id, nombre, descripcion, precio, fechaAdopcion, fechaNacimiento, fechaDefuncion, especie, adoptante, estadoAdopcion)
VALUES (1, 'Firulais', 'Perro de raza Labrador', 5000, '2022-01-01', '2021-06-01', NULL, 1, 1, 'En adopción');

INSERT INTO Qr (id, link, habitat)
VALUES (1, 'https://example.com/qr1', 1);

INSERT INTO Campaign (id, nombre, descripcion)
VALUES (1, 'Campaña de adopción 2022', 'Promoción de adopción de animales para el año 2022');

INSERT INTO Especie_Campaign (id, especie, campaign)
VALUES (1, 1, 1);

INSERT INTO estadoAdopcion (id, nombre, descripcion)
VALUES (1, 'En adopción', 'Animal disponible para ser adoptado');

INSERT INTO visita_visitaguiada (id, guia, visita)
VALUES (1, 1, 1);

INSERT INTO Area_VisitaGuiada (id, visitaguiada, area)
VALUES (1, 1, 1);

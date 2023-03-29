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

INSERT INTO Especie
INSERT INTO Habitat
INSERT INTO Adoptante
INSERT INTO Animales
INSERT INTO Qr
INSERT INTO Campaign
INSERT INTO Especie_Campaign
INSERT INTO estadoAdopcion
INSERT INTO visita_visitaguiada
INSERT INTO Area_VisitaGuiada
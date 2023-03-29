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

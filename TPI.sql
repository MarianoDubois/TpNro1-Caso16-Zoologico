CREATE DATABASE TPI;
USE TPI;
CREATE TABLE Visita (
  id BIGINT PRIMARY KEY,
  dni INT,
  nombre VARCHAR(255),
  apellido VARCHAR(255),
  fechaNacimiento DATE
);
CREATE TABLE VisitaGuiada (
  id BIGINT PRIMARY KEY,
  nombre VARCHAR(255),
  descripcion VARCHAR(255),
  
);
CREATE TABLE visita-visitaguiada(
    id INT PRIMARY KEY,
    guia BIGINT,
    visita INT,
    FOREIGN KEY (visita) REFERENCES Visita(id)
    FOREIGN KEY (guia) REFERENCES Guia(id)

);
CREATE TABLE Guia (
  id BIGINT PRIMARY KEY,
  dni INT,
  nombre VARCHAR(255),
  apellido VARCHAR(255),
  fechaNacimiento DATE
);

CREATE TABLE Area (
  id BIGINT PRIMARY KEY,
  nombre VARCHAR(255),
  descripcion VARCHAR(255)
);

CREATE TABLE Area-VisitaGuiada(
    id INT PRIMARY KEY,
    visitaguiada INT,
    area INT,
    FOREIGN KEY(visitaguiada) REFERENCES VisitaGuiada(id),
    FOREIGN KEY(area) REFERENCES Area(id)
);

CREATE TABLE Especie (
  id BIGINT PRIMARY KEY,
  nombre VARCHAR(255),
  descripcion VARCHAR(255),
);

CREATE TABLE Habitat (
  id BIGINT PRIMARY KEY,
  nombre VARCHAR(255),
  descripcion VARCHAR(255),
);

CREATE TABLE Adoptante (
  id BIGINT PRIMARY KEY,
  dni INT,
  nombre VARCHAR(255),
  apellido VARCHAR(255),
  fechaNacimiento DATE
);

CREATE TABLE Animales (
  id BIGINT PRIMARY KEY,
  nombre VARCHAR(255),
  descripcion VARCHAR(255),
  precio INT,
  fechaAdopcion DATE,
  fechaNacimiento DATE,
  fechaDefuncion DATE,
  especie BIGINT,
  adoptante BIGINT,
  estadoAdopcion VARCHAR(255),
  FOREIGN KEY (especie) REFERENCES Especie(id),
  FOREIGN KEY (adoptante) REFERENCES Adoptante(id)
);
CREATE TABLE Qr (
  id BIGINT PRIMARY KEY,
  link VARCHAR(255),
  habitat BIGINT,
  FOREIGN KEY (habitat) REFERENCES Habitat(id)
);

CREATE TABLE Campaign (
  id BIGINT PRIMARY KEY,
  nombre VARCHAR(255),
  descripcion VARCHAR(255)
);

CREATE TABLE Especie-Campaign(
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
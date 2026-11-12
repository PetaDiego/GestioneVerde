-- DATABASE: gestione_verde
-- CREATE DATABASE IF NOT EXIST gestione_verde 

CREATE TABLE Utente (
    id_utente INT AUTO_INCREMENT PRIMARY KEY,
    nome_utente VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    ruolo VARCHAR(50) NOT NULL
);

CREATE TABLE Cliente (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome_cliente VARCHAR(255) NOT NULL,
    indirizzo VARCHAR(255),
    id_utente INT NOT NULL,
    FOREIGN KEY (id_utente) REFERENCES Utente(id_utente) ON DELETE CASCADE
);

CREATE TABLE Zona (
    id_zona INT AUTO_INCREMENT PRIMARY KEY,
    nome_zona VARCHAR(255) NOT NULL,
    descrizione TEXT,
    id_utente INT NOT NULL,
    id_cliente INT NULL,
    FOREIGN KEY (id_utente) REFERENCES Utente(id_utente) ON DELETE CASCADE,
    FOREIGN KEY (id_cliente) REFERENCES Cliente(id_cliente) ON DELETE CASCADE
);

CREATE TABLE Attrezzo (
    id_attrezzo INT AUTO_INCREMENT PRIMARY KEY,
    nome_attrezzo VARCHAR(255) NOT NULL,
    stato VARCHAR(50) NOT NULL DEFAULT 'Disponibile',
    note TEXT,
    id_utente INT NOT NULL,
    FOREIGN KEY (id_utente) REFERENCES Utente(id_utente) ON DELETE CASCADE
);

CREATE TABLE Task (
    id_task INT AUTO_INCREMENT PRIMARY KEY,
    titolo VARCHAR(255) NOT NULL,
    descrizione TEXT,
    categoria VARCHAR(100),
    data_programmata DATE,
    periodicita INT NULL,
    stato VARCHAR(50) NOT NULL DEFAULT 'Da fare',
    id_zona INT NOT NULL,
    id_attrezzo INT NULL,
    FOREIGN KEY (id_zona) REFERENCES Zona(id_zona) ON DELETE CASCADE,
    FOREIGN KEY (id_attrezzo) REFERENCES Attrezzo(id_attrezzo) ON DELETE SET NULL
);

PRAGMA foreign_keys=on;

.mode columns
.headers on
.nullvalue NULL

DROP TABLE IF EXISTS Competição;
DROP TABLE IF EXISTS Jogo;
DROP TABLE IF EXISTS Estádio;
DROP TABLE IF EXISTS Clube;
DROP TABLE IF EXISTS Equipa;
DROP TABLE IF EXISTS Jogador;
DROP TABLE IF EXISTS PréEliminatórias;
DROP TABLE IF EXISTS Eliminatórias;
DROP TABLE IF EXISTS FasedeGrupos;

CREATE TABLE Competição (
	nomeCompetição TEXT PRIMARY KEY,
	nome TEXT NOT NULL,
	dataInicio DATE,
	dataFim DATE,
	nomeEquipa TEXT REFERENCES Equipa,
	nrJogo INTEGER REFERENCES Jogo
);

CREATE TABLE Jogo (
	nrJogo INTEGER PRIMARY KEY,
	golosFora INTEGER,
	golosCasa INTEGER,
	data DATE,
	jornada INTEGER,
	duração TIME,
	nomeCompetição TEXT REFERENCES Competição,
	nomeEstádio TEXT REFERENCES Estádio,
	nomeEquipa TEXT REFERENCES Equipa,
    CONSTRAINT CHECK_Jogo_golosFora CHECK (Jogo_golosFora >= 0),
    CONSTRAINT CHECK_Jogo_golosCasa CHECK (Jogo_golosCasa >= 0),
    CONSTRAINT CHECK_Jogo_jornada CHECK (jornada > 0)
);

CREATE TABLE Estádio (
	nomeEstádio TEXT PRIMARY KEY,
	nome TEXT NOT NULL,
	local TEXT NOT NULL,
	nrJogo INTEGER REFERENCES Jogo
);

CREATE TABLE Clube (
	nomeClube TEXT PRIMARY KEY,
	nome TEXT NOT NULL,
	país TEXT NOT NULL
);

CREATE TABLE Equipa (
	nomeEquipa TEXT PRIMARY Key,
	nome TEXT NOT NULL,
	nomeClube TEXT REFERENCES Clube
);

CREATE TABLE Jogador (
	nomeJogador TEXT PRIMARY KEY,
	nome TEXT NOT NULL,
	nacionalidade TEXT NOT NULL,
	idade INTEGER,
	nomeEquipa TEXT REFERENCES Equipa,
    CONSTRAINT CHECK_Jogador_idade CHECK (Jogador_idade > 0)
);

CREATE TABLE PréEliminatórias (
	dataInicio DATE,
	dataFim DATE,
	nomeEquipa TEXT REFERENCES Equipa
);

CREATE TABLE Eliminatórias (
	dataInicio DATE,
	dataFim DATE,
	nomeEquipa TEXT REFERENCES Equipa
);

CREATE TABLE FasedeGrupos (
	dataInicio DATE,
	dataFim DATE,
	nomeEquipa TEXT REFERENCES Equipa
);
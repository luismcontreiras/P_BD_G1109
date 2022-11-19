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
	nomeCompetição TEXT,
	dataInicio DATE,
  	PRIMARY KEY(TEXT,DATE),
	dataFim DATE,
);

CREATE TABLE Jogo (
	idJogo INTEGER PRIMARY KEY,
	golosFora INTEGER,
	golosCasa INTEGER,
	data DATE,
	jornada INTEGER,
	duração TIME,
	nomeCompetição TEXT REFERENCES Competição,
	nomeEstádio TEXT REFERENCES Estádio,
	nomeEquipaFora TEXT REFERENCES Equipa,
  	nomeEquipaCasa TEXT REFERENCES Equipa,
    CONSTRAINT CHECK_Jogo_golosFora CHECK (Jogo_golosFora >= 0),
    CONSTRAINT CHECK_Jogo_golosCasa CHECK (Jogo_golosCasa >= 0),
    CONSTRAINT CHECK_Jogo_jornada CHECK (jornada > 0)
);

CREATE TABLE Estádio (
	nomeEstádio TEXT PRIMARY KEY,
	local TEXT NOT NULL,
	idJogo INTEGER REFERENCES Jogo
);

CREATE TABLE Clube (
	nomeClube TEXT PRIMARY KEY,
	país TEXT NOT NULL
);

CREATE TABLE Equipa (
	nomeEquipa TEXT PRIMARY Key,
	nomeClube TEXT REFERENCES Clube
);

CREATE TABLE Jogador (
	idJogador INTEGER PRIMARY KEY,
	nome TEXT NOT NULL,
	nacionalidade TEXT NOT NULL,
	idade INTEGER,
	nomeEquipa TEXT REFERENCES Equipa,
    CONSTRAINT CHECK_Jogador_idade CHECK (Jogador_idade > 0)
);

CREATE TABLE PréEliminatórias (
  	idPreEli INTEGER PRIMARY KEY,
	dataInicio DATE,
	dataFim DATE,
);

CREATE TABLE Eliminatórias (
  	idEli INTEGER PRIMARY KEY,
	dataInicio DATE,
	dataFim DATE,
);

CREATE TABLE FasedeGrupos (
  	idFG INTEGER PRIMARY KEY,
	dataInicio DATE,
	dataFim DATE,
);

CREATE TABLE InfoEquipa (
  	grupo TEXT,
  	pontos INTEGER,
  	idFG INTEGER REFERENCES FasedeGrupos,
 	nomeEquipa TEXT REFERENCES Equipa
);
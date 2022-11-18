PRAGMA foreign_keys = ON;
BEGIN TRANSACTION;

INSERT INTO Competição VALUES ("taça dos libertadores","13/02/2011","02/09/2012")

INSERT INTO Jogo VALUES(0000,2,0,"05/09/2011",1,"01:30","taça dos libertadores","estádio do mar","jleixões","jradnik")

INSERT INTO Estádio VALUES("estádio do mar","sra. da hora",0000)

INSERT INTO Clube VALUES("leixões","portugal")
INSERT INTO Clube VALUES("radnik","servia")

INSERT into Equipa VALUES("jleixões","leixões")
INSERT into Equipa VALUES("jradnik","radnik")

INSERT INTO Jogador VALUES(07,"antónio costa","espanhol","27","jleixões")

INSERT INTO FasedeGrupos VALUES(01111,"13/02/2011","21/05/2011")

INSERT INTO PréEliminatórias VALUES(02222,"21/05/2011","28/05/2011")

INSERT INTO Eliminatórias VALUES(03333,"28/05/2011","20/08/2011")
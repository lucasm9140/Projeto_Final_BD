/* ModeloLógico_1: */
CREATE DATABASE school;
USE school;
CREATE TABLE aluno (
    id int PRIMARY KEY auto_increment,
    ra char(8) NOT NULL
);
INSERT aluno(ra)VALUES('00034459');
INSERT aluno(ra)VALUES('00034460');

SELECT * FROM aluno;

CREATE TABLE diariobordo (
    id int PRIMARY KEY auto_increment,
    texto text NOT NULL,
    datahora datetime NOT NULL,
    fk_aluno_id int NOT NULL
);

DROP TABLE diariobordo;
DROP TABLE avaliacao;
CREATE TABLE avaliacao (
    id int PRIMARY KEY auto_increment,
    nota4 float,
    nota3 float,
    nota2 float,
    nota1 float,
    fk_aluno_id int NOT NULL
);

ALTER TABLE diariobordo ADD CONSTRAINT FK_diariobordo_2
    FOREIGN KEY (fk_aluno_id)
    REFERENCES aluno (id)
    ON DELETE CASCADE;
    
ALTER TABLE diariobordo DROP FOREIGN KEY fk_aluno_id;
ALTER TABLE diariobordo DROP FOREIGN KEY FK_diariobordo_2;

ALTER TABLE diariobordo ADD CONSTRAINT FK_diariobordo_2
    FOREIGN KEY (fk_aluno_id)
    REFERENCES aluno (id);
    
    ALTER TABLE avaliacao ADD CONSTRAINT FK_avaliacao_2
    FOREIGN KEY (fk_aluno_id)
    REFERENCES aluno (id);

CREATE TABLE Relacionamento_1 (
    fk_aluno_id int,
    fk_diariobordo_id int
);

CREATE TABLE Relacionamento_2 (
    fk_avaliacao_id int,
    fk_aluno_id int
);
 
 
ALTER TABLE Relacionamento_1 ADD CONSTRAINT FK_Relacionamento_1_1
    FOREIGN KEY (fk_aluno_id)
    REFERENCES aluno (id)
    ON DELETE RESTRICT;
 
ALTER TABLE Relacionamento_1 ADD CONSTRAINT FK_Relacionamento_1_2
    FOREIGN KEY (fk_diariobordo_id)
    REFERENCES diariobordo (id)
    ON DELETE SET NULL;
 
ALTER TABLE Relacionamento_2 ADD CONSTRAINT FK_Relacionamento_2_1
    FOREIGN KEY (fk_avaliacao_id)
    REFERENCES avaliacao (id)
    ON DELETE SET NULL;
 
ALTER TABLE Relacionamento_2 ADD CONSTRAINT FK_Relacionamento_2_2
    FOREIGN KEY (fk_aluno_id)
    REFERENCES aluno (id)
    ON DELETE SET NULL;
    
SHOW CREATE TABLE diariobordo;

SELECT * FROM aluno;
SELECT * FROM diariobordo;
SELECT * FROM avaliacao;

ALTER TABLE avaliacao
ADD CONSTRAINT CHECK (nota1 <= 25),
ADD CONSTRAINT CHECK (nota2 <= 25),
ADD CONSTRAINT CHECK (nota3 <= 25),
ADD CONSTRAINT CHECK (nota4 <= 25);

INSERT INTO aluno(ra) VALUES('12345670');
INSERT INTO aluno(ra) VALUES('12345671');
INSERT INTO aluno(ra) VALUES('12345672');
INSERT INTO aluno(ra) VALUES('12345673');
INSERT INTO aluno(ra) VALUES('12345674');

SELECT * FROM aluno;

INSERT diariobordo(texto,
                   datahora,
                   fk_aluno_id)VALUES('estou revisando com os colegas e o professor o conteúdo de ontem',
                                      '2024-08-01 16:27:00',
                                       6);
INSERT diariobordo(texto,
                   datahora,
                   fk_aluno_id)VALUES('sou vascaino estou triste',
                                      '2024-08-01 16:30:00',
                                       7);
                                       
INSERT diariobordo(texto,
                   datahora,
                   fk_aluno_id)VALUES('a aula foi legal',
                                      '2024-08-01 09:16:00',
                                       1);
INSERT diariobordo(texto,
                   datahora,
                   fk_aluno_id)VALUES('estou aprendendo insert',
                                      '2024-08-01 09:33:00',
                                       2);
INSERT diariobordo(texto,
                   datahora,
                   fk_aluno_id)VALUES('estou aprendendo insert de novo',
                                      '2024-08-01 09:33:00',
                                       3);

INSERT diariobordo(texto,
                   datahora,
                   fk_aluno_id)VALUES('sou flamengoooooo, tropa do mengao sem freio',
                                      '2024-08-01 09:33:00',
                                       4);
                                       
INSERT diariobordo(texto,
                   datahora,
                   fk_aluno_id)VALUES('a pratica leva a perfeicao',
                                      '2024-08-01 09:33:00',
                                       5);
                                       
                                       
SELECT * FROM 
     diariobordo 
     JOIN 
	 aluno 
     ON diariobordo.fk_aluno_id = aluno.id;

SELECT
     d.texto,
     d.datahora,
     a.ra
     FROM 
     diariobordo d 
     JOIN 
	 aluno a 
     ON d.fk_aluno_id = a.id;
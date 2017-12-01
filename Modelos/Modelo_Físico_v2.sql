
CREATE TABLE Aluno (
                Matricula CHAR(9) NOT NULL,
                Nome VARCHAR(80) NOT NULL,
                Nivel CHAR(1) NOT NULL,
                PRIMARY KEY (Matricula)
);


CREATE TABLE Professor (
                CodProf INT NOT NULL,
                NomeProf VARCHAR(80) NOT NULL,
                PRIMARY KEY (CodProf)
);


CREATE TABLE CadastroEstagio (
                Semestre CHAR(5) NOT NULL,
                Matricula CHAR(9) NOT NULL,
                Email VARCHAR(60) NOT NULL,
                ProfOrient INT NOT NULL,
                ProfCoOrientador INT,
                DataHora DATE NOT NULL,
                MatrculaAtiva BOOLEAN DEFAULT TRUE NOT NULL,
                PRIMARY KEY (Semestre, Matricula)
);


CREATE TABLE Area (
                CodArea INT NOT NULL,
                Nome VARCHAR(50) NOT NULL,
                PRIMARY KEY (CodArea)
);


CREATE TABLE AreaInteresse (
                Matricula CHAR(9) NOT NULL,
                Semestre CHAR(5) NOT NULL,
                Escolha INT NOT NULL,
                CodArea INT NOT NULL,
                PRIMARY KEY (Matricula, Semestre, Escolha)
);


CREATE TABLE Disciplina (
                CodDisc CHAR(6) NOT NULL,
                CodArea INT NOT NULL,
                NomeDisc VARCHAR(80) NOT NULL,
                PRIMARY KEY (CodDisc)
);


CREATE TABLE Turma (
                CodDisc CHAR(6) NOT NULL,
                CodTurma CHAR(6) NOT NULL,
                Semestre CHAR(5) NOT NULL,
                CodProf INT NOT NULL,
                Horario VARCHAR(80) NOT NULL,
                TravaAlocacao BOOLEAN DEFAULT FALSE NOT NULL,
                TurmaAtiva BOOLEAN DEFAULT TRUE NOT NULL,
                PRIMARY KEY (CodDisc, CodTurma, Semestre)
);


CREATE TABLE TurmaAlocada (
                Semestre CHAR(5) NOT NULL,
                Rodada INT NOT NULL,
                Matricula CHAR(9) NOT NULL,
                CodDisc CHAR(6) NOT NULL,
                CodTurma CHAR(6) NOT NULL,
                PRIMARY KEY (Semestre, Rodada, Matricula, CodDisc, CodTurma)
);


CREATE TABLE TurmaSolicitada (
                Matricula CHAR(9) NOT NULL,
                Escolha INT NOT NULL,
                CodDisc CHAR(6) NOT NULL,
                Semestre CHAR(5) NOT NULL,
                CodTurma CHAR(6) NOT NULL,
                PRIMARY KEY (Matricula, Escolha)
);


ALTER TABLE CadastroEstagio ADD CONSTRAINT aluno_estagio_fk
FOREIGN KEY (Matricula)
REFERENCES Aluno (Matricula)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Turma ADD CONSTRAINT professor_turma_fk
FOREIGN KEY (CodProf)
REFERENCES Professor (CodProf)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE CadastroEstagio ADD CONSTRAINT professor_estagio_fk
FOREIGN KEY (ProfOrient)
REFERENCES Professor (CodProf)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE TurmaSolicitada ADD CONSTRAINT turmaestagio_10turmas_fk
FOREIGN KEY (Semestre, Matricula)
REFERENCES CadastroEstagio (Semestre, Matricula)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE AreaInteresse ADD CONSTRAINT turmaestagio_areainteresse_fk
FOREIGN KEY (Semestre, Matricula)
REFERENCES CadastroEstagio (Semestre, Matricula)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE TurmaAlocada ADD CONSTRAINT turmaestagio_escalonamento_fk
FOREIGN KEY (Semestre, Matricula)
REFERENCES CadastroEstagio (Semestre, Matricula)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Disciplina ADD CONSTRAINT area_disciplina_fk
FOREIGN KEY (CodArea)
REFERENCES Area (CodArea)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE AreaInteresse ADD CONSTRAINT area_areainteresse_fk
FOREIGN KEY (CodArea)
REFERENCES Area (CodArea)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE Turma ADD CONSTRAINT disciplina_turma_fk
FOREIGN KEY (CodDisc)
REFERENCES Disciplina (CodDisc)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE TurmaSolicitada ADD CONSTRAINT turma_10turmas_fk
FOREIGN KEY (CodDisc, CodTurma, Semestre)
REFERENCES Turma (CodDisc, CodTurma, Semestre)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

ALTER TABLE TurmaAlocada ADD CONSTRAINT turma_escalonamento_fk
FOREIGN KEY (CodDisc, CodTurma, Semestre)
REFERENCES Turma (CodDisc, CodTurma, Semestre)
ON DELETE NO ACTION
ON UPDATE NO ACTION;

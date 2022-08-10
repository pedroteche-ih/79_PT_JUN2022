-- TIPOS
-- https://dev.mysql.com/doc/refman/8.0/en/data-types.html
-- ALTER TABLE
-- https://dev.mysql.com/doc/refman/8.0/en/alter-table-examples.html
-- INSERT TABLE
-- https://dev.mysql.com/doc/refman/8.0/en/insert.html

DROP DATABASE IF EXISTS escola;
CREATE DATABASE escola;

CREATE TABLE escola.alunos (
	id_aluno INT ,
	primeiro_nome VARCHAR(255),
	sobre_nome VARCHAR(255),
	cpf_aluno BIGINT
);

CREATE TABLE escola.aulas (
	id_aula INT,
	nome_aula VARCHAR(255)
);

CREATE TABLE escola.matriculas (
	id_aluno INT,
	id_aula INT,
	num_curso INT,
	dt_matricula DATE
);

ALTER TABLE escola.alunos ADD PRIMARY KEY (id_aluno);
ALTER TABLE escola.aulas ADD PRIMARY KEY (id_aula);
ALTER TABLE escola.matriculas ADD PRIMARY KEY (id_aluno, id_aula, num_curso);

INSERT INTO escola.alunos 
VALUES (1, 'Pedro', 'Teche', 321321321);

INSERT INTO escola.alunos 
VALUES (2, 'Adriano', 'Yoshizawa', 321321321);

ALTER TABLE	escola.matriculas 
ADD FOREIGN KEY (id_aluno) 
REFERENCES escola.alunos(id_aluno);

ALTER TABLE	escola.matriculas 
ADD FOREIGN KEY (id_aula) 
REFERENCES escola.aulas(id_aula);

INSERT INTO escola.aulas 
VALUES (1, 'Calculo IV'),(2, 'Calculo III'),(3, 'Calculo II');

INSERT INTO escola.matriculas 
VALUES (1, 1, 2, '2022-03-01');

DROP TABLE escola.matriculas;
DROP TABLE escola.alunos;
DROP TABLE escola.aulas;

-- VOLTAMOS 21H05
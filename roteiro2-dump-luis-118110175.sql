--QUESTÃO 1

CREATE TABLE tarefas(
	id_tarefa INTEGER,
	descricao_tarefa TEXT,
	cpf CHAR(11),
	numero INTEGER,
	pessoas CHAR(1)
);
INSERT INTO tarefas VALUES(2147483646,'limpar chão do corredor central','98765432111',0,'F');
INSERT INTO tarefas VALUES(2147483647,'limpar janelas da sala 203','98765432122',1,'F');
INSERT INTO tarefas VALUES(null,null,null,null,null);
INSERT INTO tarefas VALUES(2147483644,'limpar chão do corredor superior','987654323211',0,'F');
INSERT INTO tarefas VALUES(2147483643,'limpar chão do corredor superior','98765432321',0,'FF');

--QUESTÃO 2

INSERT INTO tarefas VALUES(2147483648,'limpar portas do térreo','32323232955',4,'A');
ALTER TABLE tarefas ALTER COLUMN id_tarefa type BIGINT;
INSERT INTO tarefas VALUES(2147483648,'limpar portas do térreo','32323232955',4,'A');

--QUESTÃO 3

ALTER TABLE tarefas ALTER COLUMN numero type SMALLINT;
--não irá inserir:
INSERT INTO tarefas VALUES(2147483649,'limpar portas da entrada principal','32322525199',32768,'A');
INSERT INTO tarefas VALUES(2147483650,'limpar janelas da entrada principal','32333233288',32769,'A');
--irá inserir:
INSERT INTO tarefas VALUES(2147483651,'limpar portas do 1o andar','32323232911',32767,'A');
INSERT INTO tarefas VALUES(2147483652,'limpar portas do 2o andar','32323232911',32766,'A');

--QUESTÃO 4

DELETE FROM tarefas WHERE descricao_tarefa IS NULL;
ALTER TABLE tarefas ALTER COLUMN id_tarefa SET NOT NULL;
ALTER TABLE tarefas ALTER COLUMN descricao_tarefa SET NOT NULL;
ALTER TABLE tarefas ALTER COLUMN cpf SET NOT NULL;
ALTER TABLE tarefas ALTER COLUMN numero SET NOT NULL;
ALTER TABLE tarefas ALTER COLUMN pessoas SET NOT NULL;

ALTER TABLE tarefas RENAME COLUMN id_tarefa TO id;
ALTER TABLE tarefas RENAME COLUMN descricao_tarefa TO descricao;
ALTER TABLE tarefas RENAME COLUMN cpf TO func_resp_cpf;
ALTER TABLE tarefas RENAME COLUMN numero TO prioridade;
ALTER TABLE tarefas RENAME COLUMN pessoas TO status;

--QUESTÃO 5

ALTER TABLE tarefas ADD PRIMARY KEY(id);
INSERT INTO tarefas VALUES(2147483653,'limpar portas do 1o andar','32323232911',2,'A');
--não irá inserir:
INSERT INTO tarefas VALUES(2147483653,'aparar a grama da área frontal','32323232911',3,'A');

--QUESTÃO 6

--não ira funcionar:
ALTER TABLE tarefas ADD CONSTRAINT checa_status CHECK(status='P' OR status='E' OR status='C');

UPDATE tarefas SET status='P' WHERE status='A';
UPDATE tarefas SET status='C' WHERE status='F';

--ira funcionar:
ALTER TABLE tarefas ADD CONSTRAINT checa_status CHECK(status='P' OR status='E' OR status='C');

--QUESTÃO 7

UPDATE tarefas SET prioridade='5' WHERE prioridade > 5;
ALTER TABLE tarefas ADD CONSTRAINT checa_prioridade CHECK(prioridade='0' OR prioridade='1' OR prioridade='2' OR prioridade='3' OR prioridade='4' OR prioridade='5');





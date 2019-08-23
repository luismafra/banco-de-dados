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

--QUESTÃO 8

CREATE TYPE FUNCAO AS ENUM('LIMPEZA','SUP_LIMPEZA');
CREATE TYPE NIVEL AS ENUM('J','P','S');

CREATE TABLE funcionario(
	cpf CHAR(11) PRIMARY KEY,
	data_nasc DATE NOT NULL,
	nome TEXT NOT NULL,
	funcao FUNCAO NOT NULL,
	nivel NIVEL NOT NULL,
	superior_cpf CHAR(11) REFERENCES funcionario(cpf),
	CHECK(NOT funcao='LIMPEZA' OR superior_cpf IS NOT NULL)
);

INSERT INTO funcionario(cpf,data_nasc,nome,funcao,nivel,superior_cpf) VALUES ('12345678911','1980-05-07','Pedro da Silva','SUP_LIMPEZA','S',null);
INSERT INTO funcionario(cpf,data_nasc,nome,funcao,nivel,superior_cpf) VALUES ('12345678912','1980-03-08','Jose da Silva','LIMPEZA','J','12345678911');
--não deve funcionar:
INSERT INTO funcionario(cpf,data_nasc,nome,funcao,nivel,superior_cpf) VALUES ('12345678913','1980-04-09','joao da Silva','LIMPEZA','J',null);

--QUESTÃO 9

--deve inserir:
INSERT INTO funcionario(cpf,data_nasc,nome,funcao,nivel,superior_cpf) VALUES ('12345678913','2000-05-08','Luis da Silva','LIMPEZA','J','12345678911');
INSERT INTO funcionario(cpf,data_nasc,nome,funcao,nivel,superior_cpf) VALUES ('12345678914','1990-09-18','Carlos da Silva','SUP_LIMPEZA','S',null);
INSERT INTO funcionario(cpf,data_nasc,nome,funcao,nivel,superior_cpf) VALUES ('12345678915','1984-01-17','Jason da Silva','SUP_LIMPEZA','P','12345678911');
INSERT INTO funcionario(cpf,data_nasc,nome,funcao,nivel,superior_cpf) VALUES ('12345678916','2002-03-12','Bruno da Silva','LIMPEZA','J','12345678914');
INSERT INTO funcionario(cpf,data_nasc,nome,funcao,nivel,superior_cpf) VALUES ('12345678917','1999-07-25','Maria Eduarda','LIMPEZA','P','12345678915');
INSERT INTO funcionario(cpf,data_nasc,nome,funcao,nivel,superior_cpf) VALUES ('12345678918','2000-11-15','Luana Silva','SUP_LIMPEZA','S',null);
INSERT INTO funcionario(cpf,data_nasc,nome,funcao,nivel,superior_cpf) VALUES ('12345678919','1997-02-10','Jessica Soares','LIMPEZA','J','12345678918');
INSERT INTO funcionario(cpf,data_nasc,nome,funcao,nivel,superior_cpf) VALUES ('12345678920','2001-12-20','Jonathan Gomes','SUP_LIMPEZA','P','12345678918');
INSERT INTO funcionario(cpf,data_nasc,nome,funcao,nivel,superior_cpf) VALUES ('12345678921','1990-10-02','Felipe Sousa','LIMPEZA','J','12345678920');
INSERT INTO funcionario(cpf,data_nasc,nome,funcao,nivel,superior_cpf) VALUES ('12345678922','1998-08-05','João Pedro','LIMPEZA','S','12345678920');

--não deve inserir:

INSERT INTO funcionario(cpf,data_nasc,nome,funcao,nivel,superior_cpf) VALUES ('12345678923','2000-05-08','Luis da Silva','LIMPEZA','J',null);
INSERT INTO funcionario(cpf,data_nasc,nome,funcao,nivel,superior_cpf) VALUES ('12345678921','1990-09-18','Carlos da Silva','SUP_LIMPEZA','S',null);
INSERT INTO funcionario(cpf,data_nasc,nome,funcao,nivel,superior_cpf) VALUES ('12345678920','1984-01-17','Jason da Silva','SUP_LIMPEZA','P','12345678911');
INSERT INTO funcionario(cpf,data_nasc,nome,funcao,nivel,superior_cpf) VALUES ('12345678926','2002-03-12','Bruno da Silva','LIMPEZA','J',null);
INSERT INTO funcionario(cpf,data_nasc,nome,funcao,nivel,superior_cpf) VALUES ('12345678927','1999-07-25','Maria Eduarda','LIMPEZA','P',null);
INSERT INTO funcionario(cpf,data_nasc,nome,funcao,nivel,superior_cpf) VALUES ('12345678919','2000-11-15','Luana Silva','SUP_LIMPEZA','S',null);
INSERT INTO funcionario(cpf,data_nasc,nome,funcao,nivel,superior_cpf) VALUES ('12345678929','1997-02-10','Jessica Soares','LIMPEZA','J',null);
INSERT INTO funcionario(cpf,data_nasc,nome,funcao,nivel,superior_cpf) VALUES ('12345678915','2001-12-20','Jonathan Gomes','SUP_LIMPEZA','P','12345678918');
INSERT INTO funcionario(cpf,data_nasc,nome,funcao,nivel,superior_cpf) VALUES ('12345678912','1990-10-02','Felipe Sousa','LIMPEZA','J','12345678920');
INSERT INTO funcionario(cpf,data_nasc,nome,funcao,nivel,superior_cpf) VALUES ('12345678932','1998-08-05','João Pedro','LIMPEZA','S',null);

--QUESTÃO 10

INSERT INTO funcionario(cpf,data_nasc,nome,funcao,nivel,superior_cpf) VALUES ('32323232955','1999-07-25','Eduardo Rodrigues','LIMPEZA','P','12345678915');
INSERT INTO funcionario(cpf,data_nasc,nome,funcao,nivel,superior_cpf) VALUES ('32323232911','2000-11-15','Maria da Silva','SUP_LIMPEZA','S',null);
INSERT INTO funcionario(cpf,data_nasc,nome,funcao,nivel,superior_cpf) VALUES ('98765432111','1997-02-10','Pablo Soares','LIMPEZA','J','32323232911');
INSERT INTO funcionario(cpf,data_nasc,nome,funcao,nivel,superior_cpf) VALUES ('98765432122','2001-12-20','Gustavo Almeida','SUP_LIMPEZA','P','12345678918');
INSERT INTO funcionario(cpf,data_nasc,nome,funcao,nivel,superior_cpf) VALUES ('12345678932','1998-08-05','Rafael Cunha','LIMPEZA','S','12345678915');

ALTER TABLE tarefas ADD CONSTRAINT funcionario_check FOREIGN KEY(func_resp_cpf) REFERENCES funcionario(cpf) ON DELETE CASCADE;

DELETE FROM funcionario WHERE cpf='32323232955';

--QUESTÃO 11

ALTER TABLE tarefas ALTER COLUMN func_resp_cpf DROP NOT NULL;
ALTER TABLE tarefas ADD CONSTRAINT func_resp_id CHECK(status != 'E' OR func_resp_cpf IS NOT NULL);
ALTER TABLE tarefas DROP CONSTRAINT funcionario_check;
ALTER TABLE tarefas ADD CONSTRAINT funcionario_check FOREIGN KEY(func_resp_cpf) REFERENCES funcionario(cpf) ON DELETE SET NULL;

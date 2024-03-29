CREATE TABLE automovel(
	marca_automovel TEXT,
	placa_automovel CHAR(7),
	cpf_segurado CHAR(11)
);

CREATE TABLE segurado(
	nome_segurado TEXT,
	cpf_segurado CHAR(11),
	endereco_segurado TEXT,
	idade_segurado INTEGER,
	telefone_segurado VARCHAR(15)
);

CREATE TABLE perito(
	nome_perito TEXT,
	cpf_perito CHAR(11),
	idade_perito INTEGER,
	endereco_perito TEXT,
	telefone_perito VARCHAR(15)
);

CREATE TABLE oficina(
	nome_oficina TEXT,
	endereco_oficina TEXT,
	telefone_oficina VARCHAR(15)
	
);

CREATE TABLE seguro(
	id_seguro INTEGER,
	cpf_segurado TEXT,
	id_sinistro INTEGER,
	inicio_seguro date,
	fim_seguro date
);

CREATE TABLE sinistro(
	id_sinistro INTEGER,
	tipo_sinistro TEXT
);

CREATE TABLE pericia(
	status_pericia boolean,
	id_pericia INTEGER,
	cpf_perito VARCHAR(11),
	placa_automovel CHAR(7)
);

CREATE TABLE reparo(
	id_reparo INTEGER,
	status_reparo boolean,
	placa_automovel CHAR(7),
	nome_oficina TEXT,
	id_pericia INTEGER,
	id_seguro INTEGER
);

ALTER TABLE automovel ADD PRIMARY KEY(placa_automovel);
ALTER TABLE segurado ADD PRIMARY KEY(cpf_segurado);
ALTER TABLE perito ADD PRIMARY KEY(cpf_perito);
ALTER TABLE oficina ADD PRIMARY KEY(nome_oficina);
ALTER TABLE seguro ADD PRIMARY KEY(id_seguro);
ALTER TABLE sinistro ADD PRIMARY KEY(id_sinistro);
ALTER TABLE pericia ADD PRIMARY KEY(id_pericia);
ALTER TABLE reparo ADD PRIMARY KEY(id_reparo);

ALTER TABLE automovel ADD CONSTRAINT chave_estrangeira FOREIGN KEY(cpf_segurado) REFERENCES segurado(cpf_segurado) ON DELETE SET NULL ON UPDATE CASCADE;
ALTER TABLE pericia ADD CONSTRAINT chave_estrangeira FOREIGN KEY(cpf_perito) REFERENCES perito(cpf_perito) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE pericia ADD CONSTRAINT chave_estrangeira_2 FOREIGN KEY(placa_automovel) REFERENCES automovel(placa_automovel) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE reparo ADD CONSTRAINT chave_estrangeira FOREIGN KEY(placa_automovel) REFERENCES automovel(placa_automovel) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE reparo ADD CONSTRAINT chave_estrangeira_2 FOREIGN KEY(nome_oficina) REFERENCES oficina(nome_oficina) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE reparo ADD CONSTRAINT chave_estrangeira_3 FOREIGN KEY(id_pericia) REFERENCES pericia(id_pericia) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE reparo ADD CONSTRAINT chave_estrangeira_4 FOREIGN KEY(id_seguro) REFERENCES seguro(id_seguro) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE seguro ADD CONSTRAINT chave_estrangeira FOREIGN KEY(cpf_segurado) REFERENCES segurado(cpf_segurado) ON UPDATE CASCADE ON DELETE SET NULL;
ALTER TABLE seguro ADD CONSTRAINT chave_estrangeira_2 FOREIGN KEY(id_sinistro) REFERENCES sinistro(id_sinistro) ON UPDATE CASCADE ON DELETE SET NULL;

DROP TABLE reparo;
DROP TABLE seguro;
DROP TABLE sinistro;
DROP TABLE oficina;
DROP TABLE pericia;
DROP TABLE perito;
DROP TABLE automovel;
DROP TABLE segurado;

CREATE TABLE segurado(
	nome_segurado TEXT NOT NULL,
	cpf_segurado CHAR(11) NOT NULL,
	endereco_segurado TEXT NOT NULL,
	idade_segurado INTEGER NOT NULL,
	telefone_segurado VARCHAR(15),
	PRIMARY KEY(cpf_segurado)
);

CREATE TABLE automovel(
	marca_automovel TEXT NOT NULL,
	placa_automovel CHAR(7) NOT NULL,
	cpf_segurado CHAR(11) NOT NULL REFERENCES segurado(cpf_segurado) ON DELETE SET NULL ON UPDATE CASCADE,
	PRIMARY KEY(placa_automovel)
);

CREATE TABLE oficina(
	nome_oficina TEXT NOT NULL,
	endereco_oficina TEXT NOT NULL,
	telefone_oficina VARCHAR(15),
	PRIMARY KEY(nome_oficina)
	
);

CREATE TABLE perito(
	nome_perito TEXT NOT NULL,
	cpf_perito CHAR(11) NOT NULL,
	idade_perito INTEGER NOT NULL,
	endereco_perito TEXT NOT NULL,
	telefone_perito VARCHAR(15),
	PRIMARY KEY(cpf_perito)
);

CREATE TABLE sinistro(
	id_sinistro INTEGER NOT NULL,
	tipo_sinistro TEXT NOT NULL,
	PRIMARY KEY(id_sinistro)
);

CREATE TABLE seguro(
	id_seguro INTEGER NOT NULL,
	cpf_segurado TEXT NOT NULL REFERENCES segurado(cpf_segurado) ON UPDATE CASCADE ON DELETE SET NULL,
	id_sinistro INTEGER NOT NULL REFERENCES sinistro(id_sinistro) ON UPDATE CASCADE ON DELETE SET NULL,
	inicio_seguro date NOT NULL,
	fim_seguro date,
	PRIMARY KEY(id_seguro)
);

CREATE TABLE pericia(
	status_pericia boolean,
	id_pericia INTEGER NOT NULL,
	cpf_perito VARCHAR(11) NOT NULL REFERENCES perito(cpf_perito) ON UPDATE CASCADE ON DELETE SET NULL,
	placa_automovel CHAR(7) NOT NULL REFERENCES automovel(placa_automovel) ON UPDATE CASCADE ON DELETE SET NULL,
	PRIMARY KEY(id_pericia)
);

CREATE TABLE reparo(
	id_reparo INTEGER,
	status_reparo boolean,
	placa_automovel CHAR(7) REFERENCES automovel(placa_automovel) ON UPDATE CASCADE ON DELETE SET NULL,
	nome_oficina TEXT REFERENCES oficina(nome_oficina) ON UPDATE CASCADE ON DELETE SET NULL,
	id_pericia INTEGER REFERENCES pericia(id_pericia) ON UPDATE CASCADE ON DELETE SET NULL,
	id_seguro INTEGER REFERENCES seguro(id_seguro) ON UPDATE CASCADE ON DELETE SET NULL,
	PRIMARY KEY(id_reparo)
);

DROP TABLE reparo;
DROP TABLE seguro;
DROP TABLE sinistro;
DROP TABLE oficina;
DROP TABLE pericia;
DROP TABLE perito;
DROP TABLE automovel;
DROP TABLE segurado;

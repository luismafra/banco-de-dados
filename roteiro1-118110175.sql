ALTER TABLE automovel ADD CONSTRAINT chave_estrangeira FOREIGN KEY(cpf_segurado) REFERENCES segurado(cpf_segurado) ON DELETE SET NULL ON UPDATE CASCADE;

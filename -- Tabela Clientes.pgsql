-- Tabela Clientes
CREATE TABLE clientes (
    id_cliente SERIAL PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    telefone VARCHAR(15) NOT NULL,
    email VARCHAR(150),
    data_cad TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela Animais
CREATE TABLE animais (
    id_animal SERIAL PRIMARY KEY,
    id_cliente INT NOT NULL,
    nome VARCHAR(50) NOT NULL,
    especie VARCHAR(20) NOT NULL,
    raca VARCHAR(30),
    data_nasc INT,
    data_cad TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_animais_clientes FOREIGN KEY (id_cliente) REFERENCES clientes(id_cliente)
);

-- Tabela Consultas
CREATE TABLE consultas (
    id_consulta SERIAL PRIMARY KEY,
    id_animal INT NOT NULL,
    data_consulta DATE NOT NULL,
    descricao VARCHAR(250) NOT NULL,
    data_cad TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_consultas_animais FOREIGN KEY (id_animal) REFERENCES animais(id_animal)
);

INSERT INTO clientes (nome, telefone, email) VALUES ('Tiago Gomes', '(19) 99111-2233', 'tiguigo@email.com');
INSERT INTO clientes (nome, telefone, email) VALUES ('Kaio_karrique', '(19) 99222-3344', 'gordinho@email.com');

INSERT INTO animais (id_cliente, nome, especie, raca, data_nasc) VALUES (1, 'Thor', 'Cão', 'shiu-tsu', 2020);
INSERT INTO animais (id_cliente, nome, especie, raca, data_nasc) VALUES (2, 'Gato', 'Gato', 'Persa', 2022);

INSERT INTO consultas (id_animal, data_consulta, descricao) VALUES (1, '2026-08-01', 'Vacinação anual e exame de rotina.');
INSERT INTO consultas (id_animal, data_consulta, descricao) VALUES (2, '2026-08-05', 'check-up geral.');

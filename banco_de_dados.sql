-- 1. Criação das Tabelas
CREATE TABLE idosos (
    id_idoso INTEGER PRIMARY KEY AUTOINCREMENT,
    nome VARCHAR(100),
    data_nascimento DATE,
    telefone VARCHAR(20),
    bairro VARCHAR(50)
);

CREATE TABLE oficinas (
    id_oficina INTEGER PRIMARY KEY AUTOINCREMENT,
    titulo VARCHAR(100),
    data_oficina DATE,
    horario TIME,
    vagas INT
);

CREATE TABLE inscricoes (
    id_inscricao INTEGER PRIMARY KEY AUTOINCREMENT,
    id_idoso INT,
    id_oficina INT,
    status_presenca VARCHAR(20),
    FOREIGN KEY (id_idoso) REFERENCES idosos(id_idoso),
    FOREIGN KEY (id_oficina) REFERENCES oficinas(id_oficina)
);

-- 2. Inserção de Dados
INSERT INTO idosos (nome, data_nascimento, telefone, bairro) 
VALUES ('Maria Oliveira', '1955-04-12', '(67) 99999-1111', 'Centro');

INSERT INTO oficinas (titulo, data_oficina, horario, vagas) 
VALUES ('Oficina de Uso Seguro do WhatsApp', '2026-10-15', '14:00:00', 15);

INSERT INTO inscricoes (id_idoso, id_oficina, status_presenca) 
VALUES (1, 1, 'Confirmado');

-- 3. Consulta
SELECT i.nome AS Nome_Idoso, o.titulo AS Oficina, o.data_oficina AS Data, ins.status_presenca AS Presenca
FROM inscricoes ins
JOIN idosos i ON ins.id_idoso = i.id_idoso
JOIN oficinas o ON ins.id_oficina = o.id_oficina;

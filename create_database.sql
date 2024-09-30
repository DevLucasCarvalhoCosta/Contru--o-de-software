-- Criação do banco de dados
CREATE DATABASE EsteticaDB;

-- Seleciona o banco de dados para uso
USE EsteticaDB;

-- Tabela para armazenar os clientes
CREATE TABLE Clientes (
    id_cliente INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    telefone VARCHAR(15),
    data_cadastro TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela para armazenar os serviços oferecidos
CREATE TABLE Servicos (
    id_servico INT AUTO_INCREMENT PRIMARY KEY,
    nome_servico VARCHAR(100) NOT NULL,
    descricao TEXT,
    preco DECIMAL(10, 2) NOT NULL,
    duracao_minutos INT NOT NULL
);

-- Tabela para armazenar os agendamentos
CREATE TABLE Agendamentos (
    id_agendamento INT AUTO_INCREMENT PRIMARY KEY,
    id_cliente INT,
    id_servico INT,
    data_agendamento DATETIME NOT NULL,
    status VARCHAR(20) DEFAULT 'Pendente',
    FOREIGN KEY (id_cliente) REFERENCES Clientes(id_cliente),
    FOREIGN KEY (id_servico) REFERENCES Servicos(id_servico)
);

-- Tabela para armazenar os usuários (clientes e administradores)
CREATE TABLE Usuarios (
    id_usuario INT AUTO_INCREMENT PRIMARY KEY,
    nome_usuario VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL UNIQUE,
    senha_hash VARCHAR(255) NOT NULL,
    tipo_usuario ENUM('ADMIN', 'CLIENTE') NOT NULL,
    data_criacao TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Tabela para registrar logs de agendamentos (exemplo opcional)
CREATE TABLE LogsAgendamentos (
    id_log INT AUTO_INCREMENT PRIMARY KEY,
    id_agendamento INT,
    alteracao VARCHAR(255),
    data_alteracao TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (id_agendamento) REFERENCES Agendamentos(id_agendamento)
);

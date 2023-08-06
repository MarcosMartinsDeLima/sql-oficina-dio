create database oficina;
use oficina;

CREATE TABLE  Serviço (
	  id_Serviço INT NOT NULL AUTO_INCREMENT,
	  Tipo_servico ENUM('Manutenção', 'Revisão') NOT NULL DEFAULT 'Revisão',
	  Nome_Serviço VARCHAR(45) NOT NULL,
	  Duração INT NOT NULL,
	  Descrição VARCHAR(255) NOT NULL,
	  Mão_de_Obra FLOAT NOT NULL,
	  PRIMARY KEY (id_Serviço) );
  
  desc serviço;
  
CREATE TABLE  Peça(
	  id_peça INT NOT NULL AUTO_INCREMENT,
	  nome_peça VARCHAR(45) NOT NULL,
	  descrição VARCHAR(45) NOT NULL,
	  quantidade_disponível INT NOT NULL,
	  valor_unitário FLOAT NOT NULL,
	  PRIMARY KEY (id_peça) );
      
desc peça;

CREATE TABLE equipe (
	  id_equipe INT NOT NULL AUTO_INCREMENT,
	  num_func INT NOT NULL,
	  equipe VARCHAR(45) NOT NULL,
	  PRIMARY KEY (id_equipe) );
  
CREATE TABLE cliente(
	  id_cliente INT NOT NULL AUTO_INCREMENT,
	  nome VARCHAR(45) NOT NULL,
	  cpf CHAR(11) NOT NULL,
	  data_nasc DATE NOT NULL,
	  data_cadastro DATE NOT NULL,
	  telefone VARCHAR(11) NOT NULL,
	  email VARCHAR(45) NULL,
	  endereço VARCHAR(255) NOT NULL,
	  cidade VARCHAR(45) NOT NULL,
	  estado CHAR(2) NOT NULL,
	  PRIMARY KEY (id_cliente) );
      

      
CREATE TABLE veiculo (
	  id_veiculo INT NOT NULL AUTO_INCREMENT,
	  tipo_veiculo VARCHAR(45) NOT NULL,
	  placa VARCHAR(45) NOT NULL,
	  marca VARCHAR(45) NOT NULL,
	  modelo VARCHAR(45) NOT NULL,
	  ano INT NOT NULL,
	  km VARCHAR(7) NOT NULL,
	  fk_id_cliente INT NULL,
	  PRIMARY KEY (id_veiculo),
	  CONSTRAINT fk_Veiculo_Cliente FOREIGN KEY (fk_id_cliente) REFERENCES cliente(id_cliente) );
      
      
CREATE TABLE IF NOT EXISTS orcamento (
	  id_orçamento INT NOT NULL AUTO_INCREMENT,
	  numero_orçamento VARCHAR(45) NOT NULL,
	  aprovado ENUM('SIM', 'NÃO') NOT NULL DEFAULT 'NÃO',
	  valor FLOAT NOT NULL,
	  data_orcamento DATE NOT NULL,
	  validade VARCHAR(45) NOT NULL,
	  fk_id_veiculo INT NOT NULL,
	  cod_funcionario INT NOT NULL COMMENT 'Código do funcionário que emitiu o orçamento',
	  PRIMARY KEY (id_orçamento, fk_id_veiculo),
	  CONSTRAINT fk_orcamento_veiculo FOREIGN KEY (fk_id_veiculo) REFERENCES veiculo (id_veiculo) );

-- os = ordem de serviço
CREATE TABLE IF NOT EXISTS os (
	  idOrdem INT NOT NULL AUTO_INCREMENT,
	  numero INT NOT NULL,
	  data_emissão DATE NOT NULL,
	  desconto FLOAT NOT NULL DEFAULT 5.0 COMMENT 'Desconto padrão 5%, à vista 10%.',
	  data_conclusão DATE,
	  obs VARCHAR(255) NULL,
	  fk_id_orcamento INT NOT NULL,
	  forma_pagamento ENUM('Crédito', 'Débito', 'Dinheiro') NOT NULL DEFAULT 'Débito',
	  PRIMARY KEY (idOrdem, fk_id_orcamento),
	  CONSTRAINT fk_ordem_de_servico_orcamento FOREIGN KEY (fk_id_orcamento) REFERENCES orcamento (id_orçamento) );
  
CREATE TABLE funcionario(
	  id_func INT NOT NULL AUTO_INCREMENT,
	  fk_id_equipe INT NOT NULL,
	  codigo INT NOT NULL,
	  nome VARCHAR(45) NOT NULL,
	  cpf CHAR(11) NOT NULL,
	  data_nasc DATE NOT NULL,
	  endereco VARCHAR(45) NOT NULL,
	  cargo VARCHAR(45) NOT NULL,
	  especialidade VARCHAR(45) NOT NULL,
	  contratação DATE NOT NULL COMMENT 'data da contratação',
	  telefone INT NOT NULL,
	  email VARCHAR(45) NOT NULL,
	  PRIMARY KEY (id_func, fk_id_equipe),
	  CONSTRAINT fk_funcionarios_equipes FOREIGN KEY (fk_id_equipe) REFERENCES equipe (id_equipe) );
desc funcionario;

CREATE TABLE IF NOT EXISTS equipe_orçamento(
	  fk_id_equipe INT NOT NULL,
	  fk_id_orcamento INT NOT NULL,
	  PRIMARY KEY (fk_id_equipe, fk_id_orcamento),
	  CONSTRAINT fk_equipe_has_orcamento_equipe FOREIGN KEY (fk_id_equipe) REFERENCES equipe(id_equipe),
	  CONSTRAINT fk_equipe_has_orcamento_orcamento FOREIGN KEY (fk_id_orcamento) REFERENCES Orcamento (id_orçamento) );
      
CREATE TABLE  servico_peca(
  fk_id_orcamento INT NOT NULL,
  fk_id_servico INT NOT NULL,
  fk_id_peca INT NOT NULL,
  qtd_peca INT NOT NULL,
  qtd_servico INT NOT NULL,
  PRIMARY KEY (fk_id_orcamento,fk_id_servico,fk_id_peca),
  CONSTRAINT fk_servico_has_peca_servico FOREIGN KEY (fk_id_servico) REFERENCES Serviço(id_Serviço),
  CONSTRAINT fk_servico_has_peca_peca FOREIGN KEY (fk_id_peca) REFERENCES Peça(id_peça),
  CONSTRAINT fk_servico_peca_orcamento FOREIGN KEY (fk_id_orcamento) REFERENCES orcamento(id_orçamento ));
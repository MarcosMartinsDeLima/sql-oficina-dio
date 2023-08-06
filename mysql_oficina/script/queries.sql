use oficina;

-- inserção de dados(ficticios).

INSERT INTO cliente (Nome, CPF, Data_Nasc, Data_Cadastro, telefone,email,endereço,cidade,estado) VALUES 
									   ('Clayton', '12345678945', '79-11-06', '22-10-20', '119857412', 'clayton.008@gmail.com', 'r. gal edson figueira, 222', 'São Paulo', 'SP'),
                                       ('Diana', '96325874589', '76-04-21', '22-10-20', '679562345', 'diana@gmail.com', 'r. Batista de azevedo, 1114', 'Ponta Porã', 'MS'),
                                       ('josé','84756832410','83-02-05','22-10-21','119334876','josesis@gmail.com','r armando vinhos,555','osasco','sp'),
                                       ('rosa','39986759323','77-05-07','20-9-21','119367689','rosez@gmail.com','avenida sueli souza,444','sp','sp');
INSERT INTO veiculo(tipo_veiculo,placa,marca,modelo,ano,km,fk_id_cliente) VALUES 
										('hatch', 'bra1313', 'Fiat', 'Argo', '2010', '50.000',2),
										('Perua', 'ecp1026', 'Toyota', 'Fielder', '2018', '90.000',1),
										('Sedã', 'ocr4542', 'Chevrolet', 'Cobalt', '2015', '45.000',3),
										('SUV', 'cra4545', 'Hyundai', 'Creta', '2022', '5.000',4);

select * from veiculo;
									
                                        
select * from serviço;

INSERT INTO orcamento(numero_orçamento,aprovado,data_orcamento,valor,validade,fk_id_veiculo,cod_funcionario) VALUES 
                                      ('195654', 'SIM', '22-10-20', '1520', '90 dias', '8','100'),
                                      ('25535', 'SIM', '22-10-10', '1750', '90 dias', '9','100'),
                                      ('7494', 'NÃO', '22-10-20', '1456', '90 dias', '10','101'),
                                      ('3333', 'SIM', '22-10-18', '810', '90 dias', '11','101');

INSERT INTO equipe (num_func, equipe) VALUES 
                                   ('5', 'A'),
                                   ('5', 'B'),
                                   ('5', 'ADM');
                                   
INSERT INTO funcionario (fk_id_equipe,codigo,nome,cpf,data_nasc,endereco,cargo,especialidade,contratação,telefone,email) VALUES 
                                        ('1', '3', 'Clayton P.', '12395175385', '81-10-20', 'av. Interlagos, 1500', 'Mecânico', 'Mecânica', '20-01-01', '119632587', 'clayton@mecanica.com'),
                                        ('1', '2', 'Rodolfo A', '96325874125', '85-02-13', 'r. Alvarenga, 234', 'Auxiliar', 'Mecânica', '21-10-12', '119874598', 'rodolfo@mecanica.com'),
                                        ('1', '1', 'Pedro A.', '95175385296', '79-12-25', 'av.Yervant, 345', 'Lider', 'Mecânica', '19-01-10', '119652354', 'pedro@mecanica.com'),
                                        ('1', '4', 'Josué M.', '74187498765', '81-06-12', 'av. Cupecê', 'Mecânico', 'Elétrica', '20-02-02', '119875874', 'josue@mecanica.com'),
                                        ('1', '5', 'Sueli A.', '96385274185', '86-04-01', 'r. sem nome', 'Mecânico', 'Hidráulica', '21-01-10', '119698596', 'sueli@mecanica.com'),
                                        ('2', '6', 'Amauri J.', '95175385777', '81-01-12', 'av. Interlagos, 1500', 'Mecânico', 'Mecânica', '20-01-01', '119632511', 'amauri@mecanica.com'),
                                        ('2', '7', 'Dorival P.', '95175385666', '85-02-13', 'av. Cupecê, 12', 'Auxiliar', 'Mecânica', '21-10-12', '119632533', 'dorival@mecanica.com'),
                                        ('2', '8', 'Gabriel O.', '95175385667', '79-03-25', 'av.Yervant, 444', 'Lider', 'Mecânica', '20-02-02', '119632599', 'gabriel@mecanica.com'),
                                        ('2', '9', 'Pedro H.', '95175385456', '86-04-15', 'r. Alvarenga, 150', 'Mecânico', 'Elétrica', '21-01-10', '119632588', 'pedroh@mecanica.com'),
                                        ('2', '10', 'William A.', '95175385123', '86-05-10', 'av. Cupecê, 100', 'Mecânico', 'Hidráulica', '21-10-12', '119632577', 'william@mecanica.com'),
                                        ('3', '100', 'Gustavo D', '95175385998', '00-06-15', 'r. Alvarenga, 222', 'Atendimento', 'Atendente', '21-01-10', '119632777', 'gustavo@mecanica.com'),
                                        ('3', '101', 'Cintia S.', '95175385326', '00-07-19', 'av. Cupecê, 333', 'Atendimento', 'Atendente', '21-10-12', '119632258', 'cintia@mecanica.com');
 
 INSERT INTO peça (nome_peça,descrição,quantidade_disponível,valor_unitário) VALUES 
('Disco de Freio', 'Disco ventilado', '20', '306'),
('Pastilhas', 'Pastilhas Jogo', '100', '110'),
('Reparo Amortecedor', 'Conjunto', '150', '700'),
('Bandeja', 'Conjunto dir/esq', '100', '400'),
('Amortecedor dianteiro', 'Conjunto', '100', '800'),
('Cabo de vela', 'Jogo', '100', '200'),
('Vela', 'Jogo', '100', '300'),
('Óleo Motor', '1Litro', '150', '30'),
('Óleo Cambio', '1Litro', '100', '200'),
('Pneu ', '185/65r15', '100', '300'),
('Revisão', 'somente revisão', '0', '0');
 
 select * from equipe;
 select * from orcamento;
INSERT INTO equipe_orçamento (fk_id_equipe, fk_id_orcamento) VALUES 
('1', '5'),
('1', '6'),
('1', '7'),
('1','8');

INSERT INTO peça(nome_peça,descrição,quantidade_disponível,valor_unitário) VALUES 
('Disco de Freio', 'Disco ventilado', '20', '306'),
('Pastilhas', 'Pastilhas Jogo', '100', '110'),
('Reparo Amortecedor', 'Conjunto', '150', '700'),
('Bandeja', 'Conjunto dir/esq', '100', '400'),
('Amortecedor dianteiro', 'Conjunto', '100', '800'),
('Cabo de vela', 'Jogo', '100', '200'),
('Vela', 'Jogo', '100', '300'),
('Óleo Motor', '1Litro', '150', '30'),
('Óleo Cambio', '1Litro', '100', '200'),
('Pneu ', '185/65r15', '100', '300'),
('Revisão', 'somente revisão', '0', '0');

INSERT INTO serviço (Tipo_servico,Nome_Serviço,Duração,Descrição,Mão_de_Obra) VALUES 
('Revisão', 'Revisão Basica', '1', 'Revisão de 15 itens', '80'),
('Revisão', 'Revisão Completa', '2', 'Revisão de 25 itens', '120'),
('Manutenção', 'Troca de Disco', '1', 'Troca do par de discos', '150'),
('Manutenção', 'Freios', '1', 'Troca conjuto de pastilhas', '100'),
('Manutenção', 'rep_Suspensão', '2', 'Reparo do conjunto de amortecedores dianteiros', '150'),
('Manutenção', 'Bandeja', '1', 'Reparo do conjunto de bandeja dianteira', '200'),
('Manutenção', 'Amortecedores', '3', 'Troca dos amortecedores dianteiros', '200'),
('Manutenção', 'cabos', '1', 'troca do conjunto de cabos', '50'),
('Manutenção', 'Óleo Motor', '1', 'Troca de óleo motor', '80'),
('Manutenção', 'Óleo Cambio', '1', 'Troca do óleo Cambio', '150'),
('Manutenção', 'Pneu', '1', 'Troca pneu por unidade', '50'),
('Manutenção', 'Vela_elétrica', '1', 'Troca do conjunto de velas', '50.00');

INSERT INTO servico_peca (fk_id_orcamento,fk_id_servico,fk_id_peca,qtd_Peca,qtd_servico) VALUES 
('5', '2','4','1','1'),
('5','11','10','4','4'),
('6', '8', '6','1','1'),
('6','12', '7','1','1'),
('6', '9', '8','4','1'),
('6','10', '9','4','1'),
('7', '3', '1','1','1'),
('7', '7', '5','1','1'),
('8', '4', '2','1','1'),
('8', '6', '4','1','1'),
('8', '5', '3','1','1');

INSERT INTO OS (numero,data_emissão,desconto,data_Conclusão,fk_id_orcamento,forma_Pagamento) VALUES 
('12345', '2022-10-20', '10', '2022-10-21', '5', 'Dinheiro'),
('12356', '2022-10-21', '5', '2022-10-21', '6', 'Crédito'),
('12378', '2022-10-19', '10', '2022-10-19', '7', 'Débito'),
('12389', '2022-10-21', '5', '2022-10-22', '8', 'Crédito');

-- algumas consultas:

-- listando  as informações dos funcionarios
select * from funcionario;

-- retornando os cargos e especialidade dos funcionarios
select nome,cargo,especialidade from  funcionario
	order by cargo;

-- retornando todos os orcamentos aprovados
SELECT * FROM orcamento WHERE Aprovado = 'SIM';

-- retornar o valor total de todos  os orçamentos
select sum(valor)total_orcamento from orcamento;

-- retornando os cleintes e seus veiculos respectivamente
SELECT 
    c.nome,c.cpf,v.Modelo, v.Marca,v.Placa
FROM
    cliente c
        JOIN
    veiculo v ON c.id_cliente = v.fk_id_cliente;
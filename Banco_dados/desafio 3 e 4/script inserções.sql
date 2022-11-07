-- inserções 

-- Insercao tabela cliente
INSERT INTO `oficina`.`cliente` (`id_cliente`, `nome`, `telefone`) VALUES ('1', 'Vitor', '123456');
INSERT INTO `oficina`.`cliente` (`id_cliente`, `nome`, `telefone`) VALUES ('2', 'Hugo', '654123');
INSERT INTO `oficina`.`cliente` (`id_cliente`, `nome`, `telefone`) VALUES ('3', 'Carlos', '32145');
INSERT INTO `oficina`.`cliente` (`id_cliente`, `nome`, `telefone`) VALUES ('4', 'José', '65874');
INSERT INTO `oficina`.`cliente` (`id_cliente`, `nome`, `telefone`) VALUES ('5', 'Ana', '214563');
INSERT INTO `oficina`.`cliente` (`id_cliente`, `nome`, `telefone`) VALUES ('6', 'Jociane', '24587');
INSERT INTO `oficina`.`cliente` (`id_cliente`, `nome`, `telefone`) VALUES ('7', 'Bruna', '21456');

-- Insercao tabela mecanico
INSERT INTO `oficina`.`mecanico` (`id_mecanico`, `nome`, `endereco`, `especialidade`, `cliente_id_cliente`) VALUES ('1', 'Kill', 'Rua A', 'Freios', '1');
INSERT INTO `oficina`.`mecanico` (`id_mecanico`, `nome`, `endereco`, `especialidade`, `cliente_id_cliente`) VALUES ('2', 'Nicolas', 'Rua B', 'Suspensão', '1');
INSERT INTO `oficina`.`mecanico` (`id_mecanico`, `nome`, `endereco`, `especialidade`, `cliente_id_cliente`) VALUES ('3', 'Nivaldo', 'Rua E', 'Geral', '2');
INSERT INTO `oficina`.`mecanico` (`id_mecanico`, `nome`, `endereco`, `especialidade`, `cliente_id_cliente`) VALUES ('4', 'Luiz', 'Rua 9', 'Eletrica', '3');

-- Insercao tabela ordem serviço 
INSERT INTO `oficina`.`ordem_servico` (`id_ordem_servico`, `data_emissao`, `valor`, `status`, `data_conclusao`) VALUES ('1', '2022-05-05', '152', 'Finalizado', '2022-05-06');
INSERT INTO `oficina`.`ordem_servico` (`id_ordem_servico`, `data_emissao`, `valor`, `status`, `data_conclusao`) VALUES ('2', '2022-05-06', '145', 'Aguardando', '2022-05-06');
INSERT INTO `oficina`.`ordem_servico` (`id_ordem_servico`, `data_emissao`, `valor`, `status`, `data_conclusao`) VALUES ('3', '2022-05-05', '1000', 'Arrumando', '2022-05-07');
INSERT INTO `oficina`.`ordem_servico` (`id_ordem_servico`, `data_emissao`, `valor`, `status`, `data_conclusao`) VALUES ('4', '2022-06-07', '254', 'Finalizado', '2022-06-10');
INSERT INTO `oficina`.`ordem_servico` (`id_ordem_servico`, `data_emissao`, `valor`, `status`, `data_conclusao`) VALUES ('5', '2022-07-25', '300', 'Finalizado', '2022-07-27');
INSERT INTO `oficina`.`ordem_servico` (`id_ordem_servico`, `data_emissao`, `valor`, `status`, `data_conclusao`) VALUES ('6', '2022-08-23', '700', 'Arrumando', '2022-08-23');


-- Insercao veiculo
INSERT INTO `oficina`.`veiculo` (`id_veiculo`, `marca`, `modelo`, `placa`, `ano`, `id_cliente`) VALUES ('1', 'Fiat', 'Uno', '14567', '2010', '1');
INSERT INTO `oficina`.`veiculo` (`id_veiculo`, `marca`, `modelo`, `placa`, `ano`, `id_cliente`) VALUES ('2', 'VW', 'Gol', '25463', '2015', '2');
INSERT INTO `oficina`.`veiculo` (`id_veiculo`, `marca`, `modelo`, `placa`, `ano`, `id_cliente`) VALUES ('3', 'Fiat', 'Toro', '21456', '2016', '3');
INSERT INTO `oficina`.`veiculo` (`id_veiculo`, `marca`, `modelo`, `placa`, `ano`, `id_cliente`) VALUES ('4', 'Chevrolet', 'Montana', '21236', '2020', '1');
INSERT INTO `oficina`.`veiculo` (`id_veiculo`, `marca`, `modelo`, `placa`, `ano`, `id_cliente`) VALUES ('5', 'Ford', 'Ranger', '26545', '2022', '4');
INSERT INTO `oficina`.`veiculo` (`id_veiculo`, `marca`, `modelo`, `placa`, `ano`, `id_cliente`) VALUES ('6', 'Ford', 'Ranger', '21456', '2021', '5');

-- insercao mão de obra
INSERT INTO `oficina`.`mao_obra` (`id_mao_obra`, `descricao`, `valor`, `ordem_servico_id_ordem_servico`) VALUES ('1', 'Troca de peça', '150', '1');
INSERT INTO `oficina`.`mao_obra` (`id_mao_obra`, `descricao`, `valor`, `ordem_servico_id_ordem_servico`) VALUES ('2', 'Motor', '2000', '2');
INSERT INTO `oficina`.`mao_obra` (`id_mao_obra`, `descricao`, `valor`, `ordem_servico_id_ordem_servico`) VALUES ('3', 'Suspensão', '1200', '3');
INSERT INTO `oficina`.`mao_obra` (`id_mao_obra`, `descricao`, `valor`, `ordem_servico_id_ordem_servico`) VALUES ('4', 'Freio', '750', '1');
INSERT INTO `oficina`.`mao_obra` (`id_mao_obra`, `descricao`, `valor`, `ordem_servico_id_ordem_servico`) VALUES ('5', 'Motor', '1500', '4');
INSERT INTO `oficina`.`mao_obra` (`id_mao_obra`, `descricao`, `valor`, `ordem_servico_id_ordem_servico`) VALUES ('6', 'Troca de óleo', '200', '1');

-- insercao Peças
INSERT INTO `oficina`.`pecas` (`id_pecas`, `nome`, `valor`, `ordem_servico_id_ordem_servico`) VALUES ('1', 'Óleo', '150', '1');
INSERT INTO `oficina`.`pecas` (`id_pecas`, `nome`, `valor`, `ordem_servico_id_ordem_servico`) VALUES ('2', 'Freio', '120', '3');
INSERT INTO `oficina`.`pecas` (`id_pecas`, `nome`, `valor`, `ordem_servico_id_ordem_servico`) VALUES ('3', 'Amortecedor', '350', '4');
INSERT INTO `oficina`.`pecas` (`id_pecas`, `nome`, `valor`, `ordem_servico_id_ordem_servico`) VALUES ('4', 'Lampada', '40', '5');

-- insercao mecanico e ordem serviço
INSERT INTO `oficina`.`mecanico_e_ordem_servico` (`mecanico_id_mecanico`, `ordem_servico_id_ordem_servico`) VALUES ('1', '1');
INSERT INTO `oficina`.`mecanico_e_ordem_servico` (`mecanico_id_mecanico`, `ordem_servico_id_ordem_servico`) VALUES ('2', '2');
INSERT INTO `oficina`.`mecanico_e_ordem_servico` (`mecanico_id_mecanico`, `ordem_servico_id_ordem_servico`) VALUES ('3', '1');
INSERT INTO `oficina`.`mecanico_e_ordem_servico` (`mecanico_id_mecanico`, `ordem_servico_id_ordem_servico`) VALUES ('4', '3');
INSERT INTO `oficina`.`mecanico_e_ordem_servico` (`mecanico_id_mecanico`, `ordem_servico_id_ordem_servico`) VALUES ('1', '2');
INSERT INTO `oficina`.`mecanico_e_ordem_servico` (`mecanico_id_mecanico`, `ordem_servico_id_ordem_servico`) VALUES ('3', '4');
INSERT INTO `oficina`.`mecanico_e_ordem_servico` (`mecanico_id_mecanico`, `ordem_servico_id_ordem_servico`) VALUES ('3', '5');
INSERT INTO `oficina`.`mecanico_e_ordem_servico` (`mecanico_id_mecanico`, `ordem_servico_id_ordem_servico`) VALUES ('2', '1');




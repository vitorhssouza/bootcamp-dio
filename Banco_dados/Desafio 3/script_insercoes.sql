-- inserções

-- Entidade fornecedor
INSERT INTO `e-commerce`.`fornecedo` (`id_fornecedo`, `razao_social`, `nome_fornecedor`, `cnpj`, `telefone`, `endereco`) VALUES ('1', 'Eletronicos Sa', 'João', '65412', '3298745698', 'Rua v');
INSERT INTO `e-commerce`.`fornecedo` (`id_fornecedo`, `razao_social`, `nome_fornecedor`, `cnpj`, `telefone`, `endereco`) VALUES ('2', 'Carros Sa', 'Hugo', '7894', '3198745636', 'Rua 9');
INSERT INTO `e-commerce`.`fornecedo` (`id_fornecedo`, `razao_social`, `nome_fornecedor`, `cnpj`, `telefone`, `endereco`) VALUES ('3', 'Revista Sa', 'Vitor', '9878', '3265478789', 'Rua e');
INSERT INTO `e-commerce`.`fornecedo` (`id_fornecedo`, `razao_social`, `nome_fornecedor`, `cnpj`, `telefone`, `endereco`) VALUES ('4', 'Eletroteck', 'Vitor hugo', '5446', '3265478965', 'Rua a');
INSERT INTO `e-commerce`.`fornecedo` (`id_fornecedo`, `razao_social`, `nome_fornecedor`, `cnpj`, `telefone`, `endereco`) VALUES ('5', 'Casa Frutas', 'Maria', '1234', '3125477896', 'Rua b');
-- Atualização de dados
UPDATE `e-commerce`.`fornecedo` SET `cnpj` = '236589' WHERE (`id_fornecedo` = '1');


-- Entidade vendedor
INSERT INTO `e-commerce`.`vendedor` (`id_vendedor`, `razao_social`, `cpf/cnpj`, `nome_vendedor`, `telefone`, `email`) VALUES ('1', 'Claro', '125417', 'Vivian', '3125874569', 'vivian@hotmail.com');
INSERT INTO `e-commerce`.`vendedor` (`id_vendedor`, `razao_social`, `cpf/cnpj`, `nome_vendedor`, `telefone`, `email`) VALUES ('2', 'Oi', '213254', 'José', '323654789', 'josé@hotmail.com');
INSERT INTO `e-commerce`.`vendedor` (`id_vendedor`, `razao_social`, `cpf/cnpj`, `nome_vendedor`, `telefone`, `email`) VALUES ('3', 'Vivo', '258741', 'Maria', '3212457896', 'maria@gmail.com');
INSERT INTO `e-commerce`.`vendedor` (`id_vendedor`, `razao_social`, `cpf/cnpj`, `nome_vendedor`, `telefone`, `email`) VALUES ('4', 'Jos', '236589', 'João', '3236633663', 'joao@gmail.com');
INSERT INTO `e-commerce`.`vendedor` (`id_vendedor`, `razao_social`, `cpf/cnpj`, `nome_vendedor`, `telefone`, `email`) VALUES ('5', 'Cart', '987456', 'Carlos', '3225874123', 'carlos@gmail.com');

-- Entidade estoque
INSERT INTO `e-commerce`.`estoque` (`id_estoque`, `local`, `responsavel`) VALUES ('1', 'São Paulo', 'José');
INSERT INTO `e-commerce`.`estoque` (`id_estoque`, `local`, `responsavel`) VALUES ('2', 'Belo horizonte', 'João');
INSERT INTO `e-commerce`.`estoque` (`id_estoque`, `local`, `responsavel`) VALUES ('3', 'Vitoria', 'Maria');
INSERT INTO `e-commerce`.`estoque` (`id_estoque`, `local`, `responsavel`) VALUES ('4', 'Rio de Janeiro', 'Carlos');
INSERT INTO `e-commerce`.`estoque` (`id_estoque`, `local`, `responsavel`) VALUES ('5', 'Cataguases', 'Hugo');
INSERT INTO `e-commerce`.`estoque` (`id_estoque`, `local`, `responsavel`) VALUES ('6', 'Piuma', 'Vitor');

-- Entidade empresa_fretes
INSERT INTO `e-commerce`.`empresa_frete` (`id_empresa_frete`, `razao_social`, `cnpj`, `nome`, `email`, `telefone`) VALUES ('1', 'Correio', '456321', 'Correio', 'Correio@correio.com', '3132547896');
INSERT INTO `e-commerce`.`empresa_frete` (`id_empresa_frete`, `razao_social`, `cnpj`, `nome`, `email`, `telefone`) VALUES ('2', 'Shope', '123654', 'Shope', 'shope@shope.com', '3236544789');

-- Entidade Entrega
INSERT INTO `e-commerce`.`entrega` (`id_entrega`, `codigo_rastreio`, `status`, `prazo_entrega`, `valor_frete`, `id_empresa_frete`) VALUES ('1', '123', 'Entregue', '0', '35', '1');
INSERT INTO `e-commerce`.`entrega` (`id_entrega`, `codigo_rastreio`, `status`, `prazo_entrega`, `valor_frete`, `id_empresa_frete`) VALUES ('2', '321', 'Transporte', '5', '42', '1');
INSERT INTO `e-commerce`.`entrega` (`id_entrega`, `codigo_rastreio`, `status`, `prazo_entrega`, `valor_frete`, `id_empresa_frete`) VALUES ('3', '456', 'Transporte', '3', '10', '1');
INSERT INTO `e-commerce`.`entrega` (`id_entrega`, `codigo_rastreio`, `status`, `prazo_entrega`, `valor_frete`, `id_empresa_frete`) VALUES ('4', '987', 'Transporte', '1', '15', '2');

-- Entidade forma_pagamento
INSERT INTO `e-commerce`.`forma_pagamento` (`id_forma_pagamento`, `descricao`) VALUES ('1', 'pix');
INSERT INTO `e-commerce`.`forma_pagamento` (`id_forma_pagamento`, `descricao`) VALUES ('2', 'cartao');
INSERT INTO `e-commerce`.`forma_pagamento` (`id_forma_pagamento`, `descricao`) VALUES ('3', 'cartao');
INSERT INTO `e-commerce`.`forma_pagamento` (`id_forma_pagamento`, `descricao`) VALUES ('4', 'pix');
INSERT INTO `e-commerce`.`forma_pagamento` (`id_forma_pagamento`, `descricao`) VALUES ('5', 'pix');

-- Entidade pagamento_pix
INSERT INTO `e-commerce`.`pagamento_pix` (`id_pagamento_pix`, `descricao`, `chave`, `valor`, `id_forma_pagamento`) VALUES ('1', 'pix', '123', '50', '1');
INSERT INTO `e-commerce`.`pagamento_pix` (`id_pagamento_pix`, `descricao`, `chave`, `valor`, `id_forma_pagamento`) VALUES ('2', 'pix', '123', '150', '4');
INSERT INTO `e-commerce`.`pagamento_pix` (`id_pagamento_pix`, `descricao`, `chave`, `valor`, `id_forma_pagamento`) VALUES ('3', 'pix', '123', '360', '5');


-- Entidade pagamento_cartão
INSERT INTO `e-commerce`.`pagamento_cartao` (`id_pagamento_cartao`, `nome_titular`, `numero`, `data_validade`, `cod_seguranca`, `cpf/cnpj`, `id_forma_pagamento`) VALUES ('1', 'Hugo', '789456', '2027/05/25', '567', '15478965421', '2');
INSERT INTO `e-commerce`.`pagamento_cartao` (`id_pagamento_cartao`, `nome_titular`, `numero`, `data_validade`, `cod_seguranca`, `cpf/cnpj`, `id_forma_pagamento`) VALUES ('2', 'Vitor', '456987', '2028/01/15', '123', '12345678998', '3');

-- Entidade categoria
INSERT INTO `e-commerce`.`categoria` (`id_categoria`, `categoria`) VALUES ('1', 'Moveis');
INSERT INTO `e-commerce`.`categoria` (`id_categoria`, `categoria`) VALUES ('2', 'Informatica');
INSERT INTO `e-commerce`.`categoria` (`id_categoria`, `categoria`) VALUES ('3', 'Eletronico');
INSERT INTO `e-commerce`.`categoria` (`id_categoria`, `categoria`) VALUES ('4', 'Eletronico');
-- modificando categoria
UPDATE `e-commerce`.`categoria` SET `categoria` = 'eletroportatil' WHERE (`id_categoria` = '4');


-- Entidade Produto
INSERT INTO `e-commerce`.`produto` (`id_produto`, `nome`, `descricao`, `valor_unitario`, `id_categoria`) VALUES ('1', 'notebook', 'Dell', '2500', '2');
INSERT INTO `e-commerce`.`produto` (`id_produto`, `nome`, `descricao`, `valor_unitario`, `id_categoria`) VALUES ('2', 'carregado iphone', 'Sansumg', '25', '3');
INSERT INTO `e-commerce`.`produto` (`id_produto`, `nome`, `descricao`, `valor_unitario`, `id_categoria`) VALUES ('3', 'fone de ouvido', 'Airpods', '1450', '3');
INSERT INTO `e-commerce`.`produto` (`id_produto`, `nome`, `descricao`, `valor_unitario`, `id_categoria`) VALUES ('4', 'celular', 'Iphone X', '1990', '3');
INSERT INTO `e-commerce`.`produto` (`id_produto`, `nome`, `descricao`, `valor_unitario`, `id_categoria`) VALUES ('5', 'Guarda-Roupa', 'Lopas', '980', '1');

-- Entidade vendedor_e_produto
INSERT INTO `e-commerce`.`vendedor_e_produto` (`vendedor_id_vendedor`, `produto_id_produto`) VALUES ('1', '2');
INSERT INTO `e-commerce`.`vendedor_e_produto` (`vendedor_id_vendedor`, `produto_id_produto`) VALUES ('2', '1');
INSERT INTO `e-commerce`.`vendedor_e_produto` (`vendedor_id_vendedor`, `produto_id_produto`) VALUES ('3', '4');
INSERT INTO `e-commerce`.`vendedor_e_produto` (`vendedor_id_vendedor`, `produto_id_produto`) VALUES ('4', '5');
INSERT INTO `e-commerce`.`vendedor_e_produto` (`vendedor_id_vendedor`, `produto_id_produto`) VALUES ('1', '3');

-- Entidade Cliente
INSERT INTO `e-commerce`.`cliente` (`id_cliente`, `nome`, `data_nascimento`, `endereco`, `email`, `telefone`, `id_forma_pagamento`) VALUES ('1', 'Carlos', '1990-09-14', 'Rua a', 'carlos@hotmail.com', '3298745632', '1');
INSERT INTO `e-commerce`.`cliente` (`id_cliente`, `nome`, `data_nascimento`, `endereco`, `email`, `telefone`, `id_forma_pagamento`) VALUES ('2', 'João', '1994-04-08', 'Rua b', 'joao@gmail.com', '3299874456', '2');
INSERT INTO `e-commerce`.`cliente` (`id_cliente`, `nome`, `data_nascimento`, `endereco`, `email`, `telefone`, `id_forma_pagamento`) VALUES ('3', 'Luiz', '2020-05-07', 'Rua 9', 'luiz@gamil.com', '3299987789', '3');
INSERT INTO `e-commerce`.`cliente` (`id_cliente`, `nome`, `data_nascimento`, `endereco`, `email`, `telefone`, `id_forma_pagamento`) VALUES ('4', 'Vitoria', '2020-05-10', 'Rua b', 'vitoria@gmail.com', '213654789*', '4');

-- Entidade Conta_fisica
INSERT INTO `e-commerce`.`conta_fisica` (`id_conta`, `cpf`, `id_cliente`) VALUES ('1', '12345698778', '1');
INSERT INTO `e-commerce`.`conta_fisica` (`id_conta`, `cpf`, `id_cliente`) VALUES ('2', '12365485236', '2');


-- entidade conta_jurifica
INSERT INTO `e-commerce`.`conta_juridica` (`id_conta_juridica`, `cnpj`, `id_cliente`) VALUES ('1', '65412', '3');
INSERT INTO `e-commerce`.`conta_juridica` (`id_conta_juridica`, `cnpj`, `id_cliente`) VALUES ('2', '25456', '4');

-- Entidade disponibilizando_produto
INSERT INTO `e-commerce`.`disponibilizando_produto` (`produto_id_produto`, `fornecedo_id_fornecedo`) VALUES ('1', '1');
INSERT INTO `e-commerce`.`disponibilizando_produto` (`produto_id_produto`, `fornecedo_id_fornecedo`) VALUES ('2', '1');
INSERT INTO `e-commerce`.`disponibilizando_produto` (`produto_id_produto`, `fornecedo_id_fornecedo`) VALUES ('3', '1');
INSERT INTO `e-commerce`.`disponibilizando_produto` (`produto_id_produto`, `fornecedo_id_fornecedo`) VALUES ('4', '1');
INSERT INTO `e-commerce`.`disponibilizando_produto` (`produto_id_produto`, `fornecedo_id_fornecedo`) VALUES ('5', '4');

-- Entidade produto_disponivel_estoque
INSERT INTO `e-commerce`.`produto_disponivel_estoque` (`produto_id_produto`, `estoque_id_estoque`, `quantidade`) VALUES ('1', '2', '5');
INSERT INTO `e-commerce`.`produto_disponivel_estoque` (`produto_id_produto`, `estoque_id_estoque`, `quantidade`) VALUES ('2', '2', '10');
INSERT INTO `e-commerce`.`produto_disponivel_estoque` (`produto_id_produto`, `estoque_id_estoque`, `quantidade`) VALUES ('3', '1', '2');
INSERT INTO `e-commerce`.`produto_disponivel_estoque` (`produto_id_produto`, `estoque_id_estoque`, `quantidade`) VALUES ('4', '3', '14');
INSERT INTO `e-commerce`.`produto_disponivel_estoque` (`produto_id_produto`, `estoque_id_estoque`, `quantidade`) VALUES ('5', '6', '6');

-- Entidade pedido
INSERT INTO `e-commerce`.`pedido` (`id_pedido`, `status`, `descricao`, `data_pedido`, `valor_total`, `id_cliente`, `entrega_id_entrega`) VALUES ('1', 'aberto', 'cartão', '2022-05-18', '1000', '1', '1');
INSERT INTO `e-commerce`.`pedido` (`id_pedido`, `status`, `descricao`, `data_pedido`, `valor_total`, `id_cliente`, `entrega_id_entrega`) VALUES ('2', 'finalizado', 'pix', '2022-09-18', '960', '2', '1');
INSERT INTO `e-commerce`.`pedido` (`id_pedido`, `status`, `descricao`, `data_pedido`, `valor_total`, `id_cliente`, `entrega_id_entrega`) VALUES ('3', 'aberto', 'pix', '2022-11-15', '478', '3', '2');
INSERT INTO `e-commerce`.`pedido` (`id_pedido`, `status`, `descricao`, `data_pedido`, `valor_total`, `id_cliente`, `entrega_id_entrega`) VALUES ('4', 'finalizado', 'cartão', '2022-10-26', '250', '1', '3');
INSERT INTO `e-commerce`.`pedido` (`id_pedido`, `status`, `descricao`, `data_pedido`, `valor_total`, `id_cliente`, `entrega_id_entrega`) VALUES ('5', 'finalizado', 'pix', '2022-10-14', '150', '2', '4');

-- Entidade pedido_e_produto
INSERT INTO `e-commerce`.`pedido_e_produto` (`pedido_id_pedido`, `produto_id_produto`, `quantidade`) VALUES ('1', '1', '1');
INSERT INTO `e-commerce`.`pedido_e_produto` (`pedido_id_pedido`, `produto_id_produto`, `quantidade`) VALUES ('2', '2', '1');
INSERT INTO `e-commerce`.`pedido_e_produto` (`pedido_id_pedido`, `produto_id_produto`, `quantidade`) VALUES ('3', '1', '1');
INSERT INTO `e-commerce`.`pedido_e_produto` (`pedido_id_pedido`, `produto_id_produto`, `quantidade`) VALUES ('4', '3', '1');


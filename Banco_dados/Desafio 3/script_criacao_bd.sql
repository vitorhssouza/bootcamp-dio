-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema e-commerce
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema e-commerce
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `e-commerce` DEFAULT CHARACTER SET utf8 ;
USE `e-commerce` ;

-- -----------------------------------------------------
-- Table `e-commerce`.`vendedor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e-commerce`.`vendedor` (
  `id_vendedor` INT NOT NULL AUTO_INCREMENT,
  `razao_social` VARCHAR(45) NOT NULL,
  `cpf/cnpj` VARCHAR(45) NOT NULL,
  `nome_vendedor` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_vendedor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `e-commerce`.`fornecedo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e-commerce`.`fornecedo` (
  `id_fornecedo` INT NOT NULL AUTO_INCREMENT,
  `razao_social` VARCHAR(45) NOT NULL,
  `nome_fornecedor` VARCHAR(45) NOT NULL,
  `cnpj` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(45) NOT NULL,
  `endereco` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_fornecedo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `e-commerce`.`estoque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e-commerce`.`estoque` (
  `id_estoque` INT NOT NULL AUTO_INCREMENT,
  `local` VARCHAR(45) NOT NULL,
  `responsavel` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_estoque`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `e-commerce`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e-commerce`.`categoria` (
  `id_categoria` INT NOT NULL AUTO_INCREMENT,
  `categoria` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_categoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `e-commerce`.`produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e-commerce`.`produto` (
  `id_produto` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `descricao` VARCHAR(45) NOT NULL,
  `valor_unitario` DECIMAL(8,2) NOT NULL,
  `id_categoria` INT NOT NULL,
  PRIMARY KEY (`id_produto`),
  INDEX `fk_produto_categoria_idx` (`id_categoria` ASC) VISIBLE,
  CONSTRAINT `fk_produto_categoria`
    FOREIGN KEY (`id_categoria`)
    REFERENCES `e-commerce`.`categoria` (`id_categoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `e-commerce`.`disponibilizando_produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e-commerce`.`disponibilizando_produto` (
  `produto_id_produto` INT NOT NULL,
  `fornecedo_id_fornecedo` INT NOT NULL,
  PRIMARY KEY (`produto_id_produto`, `fornecedo_id_fornecedo`),
  INDEX `fk_produto_has_fornecedo_fornecedo1_idx` (`fornecedo_id_fornecedo` ASC) VISIBLE,
  INDEX `fk_produto_has_fornecedo_produto1_idx` (`produto_id_produto` ASC) VISIBLE,
  CONSTRAINT `fk_produto_has_fornecedo_produto1`
    FOREIGN KEY (`produto_id_produto`)
    REFERENCES `e-commerce`.`produto` (`id_produto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_produto_has_fornecedo_fornecedo1`
    FOREIGN KEY (`fornecedo_id_fornecedo`)
    REFERENCES `e-commerce`.`fornecedo` (`id_fornecedo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `e-commerce`.`produto_disponivel_estoque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e-commerce`.`produto_disponivel_estoque` (
  `produto_id_produto` INT NOT NULL,
  `estoque_id_estoque` INT NOT NULL,
  `quantidade` INT NOT NULL,
  PRIMARY KEY (`produto_id_produto`, `estoque_id_estoque`),
  INDEX `fk_produto_has_estoque_estoque1_idx` (`estoque_id_estoque` ASC) VISIBLE,
  INDEX `fk_produto_has_estoque_produto1_idx` (`produto_id_produto` ASC) VISIBLE,
  CONSTRAINT `fk_produto_has_estoque_produto1`
    FOREIGN KEY (`produto_id_produto`)
    REFERENCES `e-commerce`.`produto` (`id_produto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_produto_has_estoque_estoque1`
    FOREIGN KEY (`estoque_id_estoque`)
    REFERENCES `e-commerce`.`estoque` (`id_estoque`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `e-commerce`.`vendedor_e_produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e-commerce`.`vendedor_e_produto` (
  `vendedor_id_vendedor` INT NOT NULL,
  `produto_id_produto` INT NOT NULL,
  PRIMARY KEY (`vendedor_id_vendedor`, `produto_id_produto`),
  INDEX `fk_vendedor_has_produto_produto1_idx` (`produto_id_produto` ASC) VISIBLE,
  INDEX `fk_vendedor_has_produto_vendedor1_idx` (`vendedor_id_vendedor` ASC) VISIBLE,
  CONSTRAINT `fk_vendedor_has_produto_vendedor1`
    FOREIGN KEY (`vendedor_id_vendedor`)
    REFERENCES `e-commerce`.`vendedor` (`id_vendedor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_vendedor_has_produto_produto1`
    FOREIGN KEY (`produto_id_produto`)
    REFERENCES `e-commerce`.`produto` (`id_produto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `e-commerce`.`forma_pagamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e-commerce`.`forma_pagamento` (
  `id_forma_pagamento` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_forma_pagamento`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `e-commerce`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e-commerce`.`cliente` (
  `id_cliente` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `data_nascimento` DATE NOT NULL,
  `endereco` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(45) NOT NULL,
  `id_forma_pagamento` INT NOT NULL,
  PRIMARY KEY (`id_cliente`),
  INDEX `fk_forma_pagamento_idx` (`id_forma_pagamento` ASC) VISIBLE,
  CONSTRAINT `fk_forma_pagamento`
    FOREIGN KEY (`id_forma_pagamento`)
    REFERENCES `e-commerce`.`forma_pagamento` (`id_forma_pagamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `e-commerce`.`empresa_frete`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e-commerce`.`empresa_frete` (
  `id_empresa_frete` INT NOT NULL AUTO_INCREMENT,
  `razao_social` VARCHAR(45) NOT NULL,
  `cnpj` VARCHAR(45) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_empresa_frete`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `e-commerce`.`entrega`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e-commerce`.`entrega` (
  `id_entrega` INT NOT NULL AUTO_INCREMENT,
  `codigo_rastreio` VARCHAR(45) NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  `prazo_entrega` INT NOT NULL,
  `valor_frete` DECIMAL(8,2) NOT NULL,
  `id_empresa_frete` INT NOT NULL,
  PRIMARY KEY (`id_entrega`, `id_empresa_frete`),
  INDEX `fk_entrega_empresa_frete1_idx` (`id_empresa_frete` ASC) VISIBLE,
  CONSTRAINT `fk_entrega_empresa_frete1`
    FOREIGN KEY (`id_empresa_frete`)
    REFERENCES `e-commerce`.`empresa_frete` (`id_empresa_frete`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `e-commerce`.`pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e-commerce`.`pedido` (
  `id_pedido` INT NOT NULL AUTO_INCREMENT,
  `status` VARCHAR(45) NOT NULL,
  `descricao` VARCHAR(45) NOT NULL,
  `data_pedido` DATE NOT NULL,
  `valor_total` DECIMAL(8,2) NOT NULL,
  `id_cliente` INT NOT NULL,
  `entrega_id_entrega` INT NOT NULL,
  PRIMARY KEY (`id_pedido`, `entrega_id_entrega`),
  INDEX `fk_pedido_cliente1_idx` (`id_cliente` ASC) VISIBLE,
  INDEX `fk_pedido_entrega1_idx` (`entrega_id_entrega` ASC) VISIBLE,
  CONSTRAINT `fk_pedido_cliente1`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `e-commerce`.`cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedido_entrega1`
    FOREIGN KEY (`entrega_id_entrega`)
    REFERENCES `e-commerce`.`entrega` (`id_entrega`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `e-commerce`.`pedido_e_produto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e-commerce`.`pedido_e_produto` (
  `pedido_id_pedido` INT NOT NULL,
  `produto_id_produto` INT NOT NULL,
  `quantidade` INT NOT NULL,
  PRIMARY KEY (`pedido_id_pedido`, `produto_id_produto`),
  INDEX `fk_pedido_has_produto_produto1_idx` (`produto_id_produto` ASC) VISIBLE,
  INDEX `fk_pedido_has_produto_pedido1_idx` (`pedido_id_pedido` ASC) VISIBLE,
  CONSTRAINT `fk_pedido_has_produto_pedido1`
    FOREIGN KEY (`pedido_id_pedido`)
    REFERENCES `e-commerce`.`pedido` (`id_pedido`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pedido_has_produto_produto1`
    FOREIGN KEY (`produto_id_produto`)
    REFERENCES `e-commerce`.`produto` (`id_produto`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `e-commerce`.`conta_fisica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e-commerce`.`conta_fisica` (
  `id_conta` INT ZEROFILL NOT NULL,
  `cpf` VARCHAR(45) NOT NULL,
  `id_cliente` INT NOT NULL,
  PRIMARY KEY (`id_conta`),
  INDEX `fk_conta_cliente1_idx` (`id_cliente` ASC) VISIBLE,
  CONSTRAINT `fk_conta_cliente1`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `e-commerce`.`cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `e-commerce`.`pagamento_pix`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e-commerce`.`pagamento_pix` (
  `id_pagamento_pix` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NOT NULL,
  `chave` VARCHAR(45) NOT NULL,
  `valor` DECIMAL(8,2) NOT NULL,
  `id_forma_pagamento` INT NOT NULL,
  PRIMARY KEY (`id_pagamento_pix`),
  INDEX `fk_pagamento_pix_idx` (`id_forma_pagamento` ASC) VISIBLE,
  CONSTRAINT `fk_pagamento_pix`
    FOREIGN KEY (`id_forma_pagamento`)
    REFERENCES `e-commerce`.`forma_pagamento` (`id_forma_pagamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `e-commerce`.`pagamento_cartao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e-commerce`.`pagamento_cartao` (
  `id_pagamento_cartao` INT NOT NULL AUTO_INCREMENT,
  `nome_titular` VARCHAR(45) NOT NULL,
  `numero` INT NOT NULL,
  `data_validade` DATE NOT NULL,
  `cod_seguranca` INT NOT NULL,
  `cpf/cnpj` VARCHAR(45) NOT NULL,
  `id_forma_pagamento` INT NOT NULL,
  PRIMARY KEY (`id_pagamento_cartao`),
  INDEX `fk_pagamento_cartao_1` (`id_forma_pagamento` ASC) VISIBLE,
  CONSTRAINT `fk_pagamento_cartao_1`
    FOREIGN KEY (`id_forma_pagamento`)
    REFERENCES `e-commerce`.`forma_pagamento` (`id_forma_pagamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `e-commerce`.`conta_juridica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `e-commerce`.`conta_juridica` (
  `id_conta_juridica` INT NOT NULL AUTO_INCREMENT,
  `cnpj` VARCHAR(45) NULL,
  `id_cliente` INT NOT NULL,
  PRIMARY KEY (`id_conta_juridica`),
  INDEX `fk_conta_jurifica_1_idx` (`id_cliente` ASC) VISIBLE,
  CONSTRAINT `fk_conta_jurifica_1`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `e-commerce`.`cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

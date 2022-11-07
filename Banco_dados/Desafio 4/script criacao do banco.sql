-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema oficina
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema oficina
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `oficina` DEFAULT CHARACTER SET utf8 ;
USE `oficina` ;

-- -----------------------------------------------------
-- Table `oficina`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina`.`cliente` (
  `id_cliente` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_cliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oficina`.`mecanico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina`.`mecanico` (
  `id_mecanico` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `endereco` VARCHAR(45) NOT NULL,
  `especialidade` VARCHAR(45) NOT NULL,
  `cliente_id_cliente` INT NOT NULL,
  PRIMARY KEY (`id_mecanico`),
  INDEX `fk_mecanico_cliente1_idx` (`cliente_id_cliente` ASC) VISIBLE,
  CONSTRAINT `fk_mecanico_cliente1`
    FOREIGN KEY (`cliente_id_cliente`)
    REFERENCES `oficina`.`cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oficina`.`ordem_servico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina`.`ordem_servico` (
  `id_ordem_servico` INT NOT NULL AUTO_INCREMENT,
  `data_emissao` DATE NOT NULL,
  `valor` DECIMAL(8,2) NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  `data_conclusao` DATE NOT NULL,
  PRIMARY KEY (`id_ordem_servico`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oficina`.`veiculo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina`.`veiculo` (
  `id_veiculo` INT NOT NULL AUTO_INCREMENT,
  `marca` VARCHAR(45) NOT NULL,
  `modelo` VARCHAR(45) NOT NULL,
  `placa` VARCHAR(45) NOT NULL,
  `ano` VARCHAR(45) NOT NULL,
  `id_cliente` INT NOT NULL,
  PRIMARY KEY (`id_veiculo`),
  INDEX `fk_veiculo_cliente_idx` (`id_cliente` ASC) VISIBLE,
  CONSTRAINT `fk_veiculo_cliente`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `oficina`.`cliente` (`id_cliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oficina`.`mecanico_e_ordem_servico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina`.`mecanico_e_ordem_servico` (
  `mecanico_id_mecanico` INT NOT NULL,
  `ordem_servico_id_ordem_servico` INT NOT NULL,
  PRIMARY KEY (`mecanico_id_mecanico`, `ordem_servico_id_ordem_servico`),
  INDEX `fk_mecanico_has_ordem_servico_ordem_servico1_idx` (`ordem_servico_id_ordem_servico` ASC) VISIBLE,
  INDEX `fk_mecanico_has_ordem_servico_mecanico1_idx` (`mecanico_id_mecanico` ASC) VISIBLE,
  CONSTRAINT `fk_mecanico_has_ordem_servico_mecanico1`
    FOREIGN KEY (`mecanico_id_mecanico`)
    REFERENCES `oficina`.`mecanico` (`id_mecanico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_mecanico_has_ordem_servico_ordem_servico1`
    FOREIGN KEY (`ordem_servico_id_ordem_servico`)
    REFERENCES `oficina`.`ordem_servico` (`id_ordem_servico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oficina`.`mao_obra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina`.`mao_obra` (
  `id_mao_obra` INT NOT NULL AUTO_INCREMENT,
  `descricao` VARCHAR(45) NOT NULL,
  `valor` DECIMAL(8,2) NOT NULL,
  `ordem_servico_id_ordem_servico` INT NOT NULL,
  PRIMARY KEY (`id_mao_obra`),
  INDEX `fk_mao_obra_ordem_servico1_idx` (`ordem_servico_id_ordem_servico` ASC) VISIBLE,
  CONSTRAINT `fk_mao_obra_ordem_servico1`
    FOREIGN KEY (`ordem_servico_id_ordem_servico`)
    REFERENCES `oficina`.`ordem_servico` (`id_ordem_servico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `oficina`.`pecas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `oficina`.`pecas` (
  `id_pecas` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `valor` DECIMAL(8,2) NOT NULL,
  `ordem_servico_id_ordem_servico` INT NOT NULL,
  PRIMARY KEY (`id_pecas`),
  INDEX `fk_pecas_ordem_servico1_idx` (`ordem_servico_id_ordem_servico` ASC) VISIBLE,
  CONSTRAINT `fk_pecas_ordem_servico1`
    FOREIGN KEY (`ordem_servico_id_ordem_servico`)
    REFERENCES `oficina`.`ordem_servico` (`id_ordem_servico`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
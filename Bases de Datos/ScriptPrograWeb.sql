-- MySQL Script generated by MySQL Workbench
-- Thu Dec  9 19:15:43 2021
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`usuario` (
  `id_usuario` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Ape_pat` VARCHAR(45) NOT NULL,
  `Ape_mat` VARCHAR(45) NOT NULL,
  `coreo_e` VARCHAR(45) NOT NULL,
  `contrasenia` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_usuario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`contacto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`contacto` (
  `id_contacto` INT NOT NULL,
  `nombre_completo` VARCHAR(45) NOT NULL,
  `correo_e` VARCHAR(45) NOT NULL,
  `telefono` INT NOT NULL,
  `Mensaje` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id_contacto`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`direcciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`direcciones` (
  `id_direcciones` INT NOT NULL,
  `Colonia` VARCHAR(45) NULL,
  `Cod_Postal` INT NULL,
  `Num_Int` VARCHAR(45) NULL,
  `Cuidad` VARCHAR(45) NULL,
  `Estado` VARCHAR(45) NULL,
  PRIMARY KEY (`id_direcciones`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`user_direcciones`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`user_direcciones` (
  `iduser_direcciones` INT NOT NULL,
  `usuario_id_usuario` INT NOT NULL,
  `direcciones_id_direcciones` INT NOT NULL,
  PRIMARY KEY (`iduser_direcciones`),
  INDEX `fk_user_direcciones_usuario_idx` (`usuario_id_usuario` ASC) VISIBLE,
  INDEX `fk_user_direcciones_direcciones1_idx` (`direcciones_id_direcciones` ASC) VISIBLE,
  CONSTRAINT `fk_user_direcciones_usuario`
    FOREIGN KEY (`usuario_id_usuario`)
    REFERENCES `mydb`.`usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_direcciones_direcciones1`
    FOREIGN KEY (`direcciones_id_direcciones`)
    REFERENCES `mydb`.`direcciones` (`id_direcciones`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`motivo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`motivo` (
  `id_motivo` INT NOT NULL,
  `Motivo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id_motivo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`estatus`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`estatus` (
  `id_estatus` INT NOT NULL,
  `Estatus` VARCHAR(15) NULL,
  PRIMARY KEY (`id_estatus`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`quejas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`quejas` (
  `id_quejas` INT NOT NULL,
  `motivo_id_motivo` INT NOT NULL,
  `Descripcion` VARCHAR(145) NULL,
  `Fecha` DATE NULL,
  `Hora` TIMESTAMP NULL,
  `usuario_id_usuario` INT NOT NULL,
  `estatus_id_estatus` INT NOT NULL,
  PRIMARY KEY (`id_quejas`),
  INDEX `fk_quejas_motivo1_idx` (`motivo_id_motivo` ASC) VISIBLE,
  INDEX `fk_quejas_usuario1_idx` (`usuario_id_usuario` ASC) VISIBLE,
  INDEX `fk_quejas_estatus1_idx` (`estatus_id_estatus` ASC) VISIBLE,
  CONSTRAINT `fk_quejas_motivo1`
    FOREIGN KEY (`motivo_id_motivo`)
    REFERENCES `mydb`.`motivo` (`id_motivo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_quejas_usuario1`
    FOREIGN KEY (`usuario_id_usuario`)
    REFERENCES `mydb`.`usuario` (`id_usuario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_quejas_estatus1`
    FOREIGN KEY (`estatus_id_estatus`)
    REFERENCES `mydb`.`estatus` (`id_estatus`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

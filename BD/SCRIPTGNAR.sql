SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';


-- -----------------------------------------------------
-- Table `Hanoit_Gnar`.`tblCliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hanoit_Gnar`.`tblCliente` (
  `idCliente` INT NOT NULL AUTO_INCREMENT,
  `Cedula` VARCHAR(45) NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellido` VARCHAR(45) NOT NULL,
  `Celular` VARCHAR(45) NULL,
  `Telefono` VARCHAR(45) NOT NULL,
  `Estado` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCliente`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hanoit_Gnar`.`tblReferencia`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hanoit_Gnar`.`tblReferencia` (
  `idReferencia` INT NOT NULL AUTO_INCREMENT,
  `Cedula` VARCHAR(45) NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `Apellido` VARCHAR(45) NOT NULL,
  `Celular` VARCHAR(45) NOT NULL,
  `Estado` VARCHAR(45) NOT NULL,
  `tblCliente_idCliente` INT NOT NULL,
  PRIMARY KEY (`idReferencia`),
  INDEX `fk_tblReferencia_tblCliente_idx` (`tblCliente_idCliente` ASC),
  CONSTRAINT `fk_tblReferencia_tblCliente`
    FOREIGN KEY (`tblCliente_idCliente`)
    REFERENCES `Hanoit_Gnar`.`tblCliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hanoit_Gnar`.`tblMueble`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hanoit_Gnar`.`tblMueble` (
  `idtMueble` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Referencia` VARCHAR(45) NULL,
  `Valor` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idtMueble`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hanoit_Gnar`.`tblCliente_Mueble`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hanoit_Gnar`.`tblCliente_Mueble` (
  `tblCliente_idCliente` INT NOT NULL,
  `tblMueble_idtMueble` INT NOT NULL,
  `idCliente_Mueble` INT NOT NULL AUTO_INCREMENT,
  `TipoPago` BIT NULL,
  `Valor` INT NULL,
  INDEX `fk_table1_tblCliente1_idx` (`tblCliente_idCliente` ASC),
  INDEX `fk_table1_tblMueble1_idx` (`tblMueble_idtMueble` ASC),
  PRIMARY KEY (`idCliente_Mueble`),
  CONSTRAINT `fk_table1_tblCliente1`
    FOREIGN KEY (`tblCliente_idCliente`)
    REFERENCES `Hanoit_Gnar`.`tblCliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_table1_tblMueble1`
    FOREIGN KEY (`tblMueble_idtMueble`)
    REFERENCES `Hanoit_Gnar`.`tblMueble` (`idtMueble`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hanoit_Gnar`.`tblAbono`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hanoit_Gnar`.`tblAbono` (
  `idAbono` INT NOT NULL AUTO_INCREMENT,
  `Fecha` DATETIME NOT NULL,
  `ValorAbono` VARCHAR(45) NOT NULL,
  `Estado` VARCHAR(45) NOT NULL,
  `tblCliente_Mueble_idCliente_Mueble` INT NOT NULL,
  PRIMARY KEY (`idAbono`),
  INDEX `fk_tblAbono_tblCliente_Mueble1_idx` (`tblCliente_Mueble_idCliente_Mueble` ASC),
  CONSTRAINT `fk_tblAbono_tblCliente_Mueble1`
    FOREIGN KEY (`tblCliente_Mueble_idCliente_Mueble`)
    REFERENCES `Hanoit_Gnar`.`tblCliente_Mueble` (`idCliente_Mueble`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Hanoit_Gnar`.`tblUsuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Hanoit_Gnar`.`tblUsuarios` (
  `idUsuarios` INT NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(45) NOT NULL,
  `Rol` VARCHAR(45) NOT NULL,
  `Usuario` VARCHAR(45) NOT NULL,
  `Password` VARCHAR(45) NOT NULL,
  `Estado` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idUsuarios`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

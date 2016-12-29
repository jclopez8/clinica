SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`currency`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`currency` (
  `idcurrency` INT NOT NULL AUTO_INCREMENT ,
  `source` VARCHAR(45) NULL ,
  `destiny` VARCHAR(45) NULL ,
  `rate` FLOAT NULL ,
  PRIMARY KEY (`idcurrency`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`history`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`history` (
  `idhistory` INT NOT NULL AUTO_INCREMENT ,
  `idcurrency` INT NOT NULL ,
  `source` VARCHAR(45) NULL ,
  `destiny` VARCHAR(45) NULL ,
  `rate` FLOAT NULL ,
  `date` DATE NULL ,
  PRIMARY KEY (`idhistory`) ,
  INDEX `fk_history_currency_idx` (`idcurrency` ASC) ,
  CONSTRAINT `fk_history_currency`
    FOREIGN KEY (`idcurrency` )
    REFERENCES `mydb`.`currency` (`idcurrency` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `mydb` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

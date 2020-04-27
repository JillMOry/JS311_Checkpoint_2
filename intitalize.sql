-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema checkpoint2
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema checkpoint2
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `checkpoint2` DEFAULT CHARACTER SET utf8 ;
USE `checkpoint2` ;

-- -----------------------------------------------------
-- Table `checkpoint2`.`users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `checkpoint2`.`users` (
  `id` INT NOT NULL,
  `first_name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `checkpoint2`.`userCredentials`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `checkpoint2`.`userCredentials` (
  `id` INT NOT NULL,
  `users_id` INT NOT NULL,
  `login` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_userCredentials_users1_idx` (`users_id` ASC) VISIBLE,
  CONSTRAINT `fk_userCredentials_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `checkpoint2`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `checkpoint2`.`toDo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `checkpoint2`.`toDo` (
  `taskID` VARCHAR(45) NOT NULL,
  `task` VARCHAR(45) NOT NULL,
  `due date` DATE NULL,
  `completed` DATETIME NULL,
  `userCredentials_id` INT NOT NULL,
  PRIMARY KEY (`taskID`),
  INDEX `fk_toDo_userCredentials1_idx` (`userCredentials_id` ASC) VISIBLE,
  CONSTRAINT `fk_toDo_userCredentials1`
    FOREIGN KEY (`userCredentials_id`)
    REFERENCES `checkpoint2`.`userCredentials` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `checkpoint2`.`Grocery`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `checkpoint2`.`Grocery` (
  `idGrocery` INT NOT NULL,
  `itemDescription` VARCHAR(45) NULL,
  `quantity` INT NULL,
  `purchased` VARCHAR(45) NULL,
  `html link?` VARCHAR(45) NULL,
  `userCredentials_id` INT NOT NULL,
  PRIMARY KEY (`idGrocery`),
  INDEX `fk_Grocery_userCredentials1_idx` (`userCredentials_id` ASC) VISIBLE,
  CONSTRAINT `fk_Grocery_userCredentials1`
    FOREIGN KEY (`userCredentials_id`)
    REFERENCES `checkpoint2`.`userCredentials` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `checkpoint2`.`Chores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `checkpoint2`.`Chores` (
  `idChores` INT NOT NULL,
  `description` VARCHAR(45) NULL,
  `due date` DATE NULL,
  `completed` DATETIME NULL,
  `payment` DECIMAL(5,2) NULL,
  `userCredentials_id` INT NOT NULL,
  PRIMARY KEY (`idChores`),
  INDEX `fk_Chores_userCredentials1_idx` (`userCredentials_id` ASC) VISIBLE,
  CONSTRAINT `fk_Chores_userCredentials1`
    FOREIGN KEY (`userCredentials_id`)
    REFERENCES `checkpoint2`.`userCredentials` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `checkpoint2`.`Grocery_has_users`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `checkpoint2`.`Grocery_has_users` (
  `Grocery_idGrocery` INT NOT NULL,
  `users_id` INT NOT NULL,
  PRIMARY KEY (`Grocery_idGrocery`, `users_id`),
  INDEX `fk_Grocery_has_users_users1_idx` (`users_id` ASC) VISIBLE,
  INDEX `fk_Grocery_has_users_Grocery1_idx` (`Grocery_idGrocery` ASC) VISIBLE,
  CONSTRAINT `fk_Grocery_has_users_Grocery1`
    FOREIGN KEY (`Grocery_idGrocery`)
    REFERENCES `checkpoint2`.`Grocery` (`idGrocery`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Grocery_has_users_users1`
    FOREIGN KEY (`users_id`)
    REFERENCES `checkpoint2`.`users` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
-- MySQL Script generated by MySQL Workbench
-- Wed Oct 26 14:45:41 2022
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
-- Table `mydb`.`questions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`questions` ;

CREATE TABLE IF NOT EXISTS `mydb`.`questions` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`answers`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`answers` ;

CREATE TABLE IF NOT EXISTS `mydb`.`answers` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `description` VARCHAR(45) NULL,
  `questions_id` INT NOT NULL,
  `is_right` TINYINT NOT NULL,
  PRIMARY KEY (`id`, `questions_id`),
  CONSTRAINT `fk_answers_questions1`
    FOREIGN KEY (`questions_id`)
    REFERENCES `mydb`.`questions` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`students`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`students` ;

CREATE TABLE IF NOT EXISTS `mydb`.`students` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `last_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tests`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`tests` ;

CREATE TABLE IF NOT EXISTS `mydb`.`tests` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `date` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tests_has_questions`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`tests_has_questions` ;

CREATE TABLE IF NOT EXISTS `mydb`.`tests_has_questions` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tests_id` INT NOT NULL,
  `questions_id` INT NOT NULL,
  PRIMARY KEY (`id`, `tests_id`, `questions_id`),
  CONSTRAINT `fk_tests_has_questions_tests1`
    FOREIGN KEY (`tests_id`)
    REFERENCES `mydb`.`tests` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tests_has_questions_questions1`
    FOREIGN KEY (`questions_id`)
    REFERENCES `mydb`.`questions` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`students_has_tests`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`students_has_tests` ;

CREATE TABLE IF NOT EXISTS `mydb`.`students_has_tests` (
  `students_id` INT NOT NULL,
  `tests_id` INT NOT NULL,
  PRIMARY KEY (`students_id`, `tests_id`),
  CONSTRAINT `fk_students_has_tests_students1`
    FOREIGN KEY (`students_id`)
    REFERENCES `mydb`.`students` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_students_has_tests_tests1`
    FOREIGN KEY (`tests_id`)
    REFERENCES `mydb`.`tests` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`students_checks`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`students_checks` ;

CREATE TABLE IF NOT EXISTS `mydb`.`students_checks` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tests_id` INT NOT NULL,
  `students_id` INT NOT NULL,
  `questions_id` INT NOT NULL,
  `answers_id` INT NOT NULL,
  PRIMARY KEY (`id`, `tests_id`, `students_id`, `questions_id`, `answers_id`),
  CONSTRAINT `fk_table1_tests1`
    FOREIGN KEY (`tests_id`)
    REFERENCES `mydb`.`tests` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_table1_students1`
    FOREIGN KEY (`students_id`)
    REFERENCES `mydb`.`students` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_table1_questions1`
    FOREIGN KEY (`questions_id`)
    REFERENCES `mydb`.`questions` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_table1_answers1`
    FOREIGN KEY (`answers_id`)
    REFERENCES `mydb`.`answers` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

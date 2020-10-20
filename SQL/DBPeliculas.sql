-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema DBPeliculas
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema DBPeliculas
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `DBPeliculas` DEFAULT CHARACTER SET utf8 ;
USE `DBPeliculas` ;

-- -----------------------------------------------------
-- Table `DBPeliculas`.`peliculas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBPeliculas`.`peliculas` (
  `idpelicula` INT NOT NULL AUTO_INCREMENT COMMENT 'Id de películas',
  `titulo` VARCHAR(80) NOT NULL COMMENT 'Título de la película',
  `descrip` TEXT(1000) NOT NULL COMMENT 'Descripción de la película',
  `duracion` TIME NOT NULL COMMENT 'Duración de la película',
  `trailer` VARCHAR(80) NOT NULL COMMENT 'Trailer de la película en youtube',
  `estreno` DATETIME NOT NULL COMMENT 'Fecha de estreno de la película',
  `img` VARCHAR(80) NOT NULL COMMENT 'Carátula de la película',
  PRIMARY KEY (`idpelicula`),
  UNIQUE INDEX `trailer_UNIQUE` (`trailer` ASC),
  UNIQUE INDEX `img_UNIQUE` (`img` ASC))
ENGINE = InnoDB
COMMENT = 'Tabla de las peliculas';


-- -----------------------------------------------------
-- Table `DBPeliculas`.`categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBPeliculas`.`categorias` (
  `idcategoria` INT NOT NULL AUTO_INCREMENT COMMENT 'Id de la categoria',
  `nombre` VARCHAR(45) NOT NULL COMMENT 'Nombre de la categoría',
  PRIMARY KEY (`idcategoria`),
  UNIQUE INDEX `nombre_UNIQUE` (`nombre` ASC))
ENGINE = InnoDB
COMMENT = 'Tabla con las categorías dsiponibles';


-- -----------------------------------------------------
-- Table `DBPeliculas`.`pelicula_categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `DBPeliculas`.`pelicula_categoria` (
  `P_idpelicula` INT NOT NULL,
  `C_idcategoria` INT NOT NULL,
  PRIMARY KEY (`P_idpelicula`, `C_idcategoria`),
  INDEX `fk_pelicula_categoria_categorias1_idx` (`C_idcategoria` ASC),
  CONSTRAINT `fk_pelicula_categoria_peliculas`
    FOREIGN KEY (`P_idpelicula`)
    REFERENCES `DBPeliculas`.`peliculas` (`idpelicula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_pelicula_categoria_categorias1`
    FOREIGN KEY (`C_idcategoria`)
    REFERENCES `DBPeliculas`.`categorias` (`idcategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Tabla de relación peliculas y categorias';


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

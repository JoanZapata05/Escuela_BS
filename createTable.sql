SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS bfjzbbcgcrrsklbcafus ;
USE bfjzbbcgcrrsklbcafus ;

-- Table roles
CREATE TABLE IF NOT EXISTS roles (
id INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR(50) NULL,
PRIMARY KEY (id))
ENGINE = InnoDB;

-- Table tipo_documentos    
CREATE TABLE IF NOT EXISTS tipo_documentos (
id INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR(45) NULL,
abreviatura VARCHAR(45) NULL,
PRIMARY KEY (id))
ENGINE = InnoDB;

-- Table empleados
CREATE TABLE IF NOT EXISTS empleados (
id INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR(45) NULL,
numero_documento VARCHAR(45) NULL,
telefono VARCHAR(45) NULL,
direccion VARCHAR(45) NULL,
email VARCHAR(45) NULL,
fecha_contratacion DATE NULL,
roles_id INT NOT NULL,
tipo_documentos_id INT NOT NULL,
PRIMARY KEY (id, roles_id, tipo_documentos_id),
INDEX fk_empleados_roles_idx (roles_id ASC) VISIBLE,
INDEX fk_empleados_tipo_documentos1_idx (tipo_documentos_id ASC) VISIBLE,
CONSTRAINT fk_empleados_roles
FOREIGN KEY (roles_id)
REFERENCES roles (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
CONSTRAINT fk_empleados_tipo_documentos1
FOREIGN KEY (tipo_documentos_id)
REFERENCES tipo_documentos (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- Table cursos
CREATE TABLE IF NOT EXISTS cursos (
id INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR(45) NULL,
empleado_encargado_id INT NOT NULL,
PRIMARY KEY (id, empleado_encargado_id),
INDEX fk_cursos_empleados1_idx (empleado_encargado_id ASC) VISIBLE,
CONSTRAINT fk_cursos_empleados1
FOREIGN KEY (empleado_encargado_id)
REFERENCES empleados (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- Table estudiantes
CREATE TABLE IF NOT EXISTS estudiantes (
id INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR(45) NULL,
numero_documento VARCHAR(45) NULL,
telefono_acudiente VARCHAR(45) NULL,
direccion VARCHAR(45) NULL,
fecha_nacimiento VARCHAR(45) NULL,
tipo_documentos_id INT NOT NULL,
cursos_id INT NOT NULL,
PRIMARY KEY (id, tipo_documentos_id, cursos_id),
INDEX fk_estudiantes_tipo_documentos1_idx (tipo_documentos_id ASC) VISIBLE,
INDEX fk_estudiantes_cursos1_idx (cursos_id ASC) VISIBLE,
CONSTRAINT fk_estudiantes_tipo_documentos1
FOREIGN KEY (tipo_documentos_id)
REFERENCES tipo_documentos (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
CONSTRAINT fk_estudiantes_cursos1
FOREIGN KEY (cursos_id)
REFERENCES cursos (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- Table asignaturas
CREATE TABLE IF NOT EXISTS asignaturas (
id INT NOT NULL AUTO_INCREMENT,
nombre VARCHAR(45) NULL,
empleados_id INT NOT NULL,
PRIMARY KEY (id, empleados_id),
INDEX fk_asignaturas_empleados1_idx (empleados_id ASC) VISIBLE,
CONSTRAINT fk_asignaturas_empleados1
FOREIGN KEY (empleados_id)
REFERENCES empleados (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- Table cursos_asignaturas
CREATE TABLE IF NOT EXISTS cursos_asignaturas (
id INT NOT NULL AUTO_INCREMENT,
asignaturas_id INT NOT NULL,
cursos_id INT NOT NULL,
PRIMARY KEY (id, asignaturas_id, cursos_id),
INDEX fk_cursos_asignaturas_asignaturas1_idx (asignaturas_id ASC) VISIBLE,
INDEX fk_cursos_asignaturas_cursos1_idx (cursos_id ASC) VISIBLE,
CONSTRAINT fk_cursos_asignaturas_asignaturas1
FOREIGN KEY (asignaturas_id)
REFERENCES asignaturas (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION,
CONSTRAINT fk_cursos_asignaturas_cursos1
FOREIGN KEY (cursos_id)
REFERENCES cursos (id)
ON DELETE NO ACTION
ON UPDATE NO ACTION)
ENGINE = InnoDB;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

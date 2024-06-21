-- Insertar registros en la tabla roles
INSERT INTO roles (nombre) VALUES
('administrador'),
('profesor'),
('estudiante'),
('coordinador'),
('auxiliar');

-- Insertar registros en la tabla tipo_documentos
INSERT INTO tipo_documentos (nombre, abreviatura) VALUES
('cédula de ciudadanía', 'cc'),
('tarjeta de identidad', 'ti'),
('cédula de extranjería', 'ce'),
('pasaporte', 'pa'),
('registro civil', 'rc');

-- Insertar registros en la tabla empleados
INSERT INTO empleados (nombre, numero_documento, telefono, direccion, email, fecha_contratacion, roles_id, tipo_documentos_id) VALUES
('juan pérez', '123456789', '3001234567', 'calle 123', 'juan.perez@example.com', '2020-01-15', 2, 1),
('ana gómez', '987654321', '3009876543', 'carrera 45', 'ana.gomez@example.com', '2019-06-01', 2, 1),
('carlos martínez', '112233445', '3001122334', 'avenida 10', 'carlos.martinez@example.com', '2021-03-20', 4, 1),
('marta rodríguez', '556677889', '3005566778', 'diagonal 22', 'marta.rodriguez@example.com', '2018-09-10', 5, 1),
('luis fernández', '998877665', '3009988776', 'transversal 8', 'luis.fernandez@example.com', '2022-12-01', 2, 1);

-- Insertar registros en la tabla cursos
INSERT INTO cursos (nombre, empleado_encargado_id) VALUES
('matemáticas', 1),
('ciencias', 2),
('historia', 3),
('geografía', 4),
('literatura', 5);

-- Insertar registros en la tabla estudiantes
INSERT INTO estudiantes (nombre, numero_documento, telefono_acudiente, direccion, fecha_nacimiento, tipo_documentos_id, cursos_id) VALUES
('pedro ramírez', '111222333', '3101234567', 'calle 45', '2005-05-15', 1, 1),
('lucía ortiz', '444555666', '3109876543', 'carrera 12', '2006-11-20', 1, 2),
('sofía hernández', '777888999', '3101122334', 'avenida 7', '2007-03-10', 1, 3),
('mateo lópez', '123321123', '3105566778', 'diagonal 19', '2008-08-30', 1, 4),
('valeria sánchez', '456654456', '3109988776', 'transversal 21', '2009-01-25', 1, 5);

-- Insertar registros en la tabla asignaturas
INSERT INTO asignaturas (nombre, empleados_id) VALUES
('álgebra', 1),
('química', 2),
('historia antigua', 3),
('geografía física', 4),
('poesía', 5);

-- Insertar registros en la tabla cursos_asignaturas
INSERT INTO cursos_asignaturas (asignaturas_id, cursos_id) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5);

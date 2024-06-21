# Escuela_BS
School data base 
Proyecto: Sistema de Gestión Escolar
Descripción General
Este proyecto es un Sistema de Gestión Escolar diseñado para administrar información de roles, documentos, empleados, cursos, estudiantes y asignaturas en una institución educativa. El sistema permite realizar consultas complejas sobre los datos almacenados, facilitando la gestión y visualización de la información educativa.

Estructura de la Base de Datos
Roles: Define los diferentes roles en la institución (Administrador, Profesor, Estudiante, Coordinador, Auxiliar).

id (INT, AUTO_INCREMENT, PRIMARY KEY)
nombre (VARCHAR(50))
Tipo de Documentos: Lista los diferentes tipos de documentos de identidad.

id (INT, AUTO_INCREMENT, PRIMARY KEY)
nombre (VARCHAR(45))
abreviatura (VARCHAR(45))
Empleados: Almacena la información de los empleados.

id (INT, AUTO_INCREMENT, PRIMARY KEY)
nombre (VARCHAR(45))
numero_documento (VARCHAR(45))
telefono (VARCHAR(45))
direccion (VARCHAR(45))
email (VARCHAR(45))
fecha_contratacion (DATE)
roles_id (INT, FOREIGN KEY)
tipo_documentos_id (INT, FOREIGN KEY)
Cursos: Almacena información sobre los cursos ofrecidos.

id (INT, AUTO_INCREMENT, PRIMARY KEY)
nombre (VARCHAR(45))
empleado_encargado_id (INT, FOREIGN KEY)
Estudiantes: Almacena la información de los estudiantes.

id (INT, AUTO_INCREMENT, PRIMARY KEY)
nombre (VARCHAR(45))
numero_documento (VARCHAR(45))
telefono_acudiente (VARCHAR(45))
direccion (VARCHAR(45))
fecha_nacimiento (VARCHAR(45))
tipo_documentos_id (INT, FOREIGN KEY)
cursos_id (INT, FOREIGN KEY)
Asignaturas: Almacena información sobre las asignaturas.

id (INT, AUTO_INCREMENT, PRIMARY KEY)
nombre (VARCHAR(45))
empleados_id (INT, FOREIGN KEY)
Cursos Asignaturas: Relaciona cursos con asignaturas.

id (INT, AUTO_INCREMENT, PRIMARY KEY)
asignaturas_id (INT, FOREIGN KEY)
cursos_id (INT, FOREIGN KEY)

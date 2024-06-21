--  Ver listado de estudiantes de un grupo x
SELECT est.nombre
FROM estudiantes AS est
JOIN cursos AS c ON est.cursos_id = c.id
WHERE c.nombre = 'nombre_del_curso';


-- Ver la lista de estudiantes que vean una asignatura específica
SELECT est.nombre
FROM estudiantes AS est
JOIN cursos AS c ON est.cursos_id = c.id
JOIN cursos_asignaturas AS ca ON c.id = ca.cursos_id
JOIN asignaturas AS a ON ca.asignaturas_id = a.id
WHERE a.nombre = 'nombre_de_la_asignatura';

--  Ver la lista de profesores que le dictan clase a un estudiante específico
SELECT DISTINCT emp.nombre AS profesor, est.nombre AS estudiante
FROM empleados AS emp
JOIN asignaturas AS a ON emp.id = a.empleados_id
JOIN cursos_asignaturas AS ca ON a.id = ca.asignaturas_id
JOIN cursos AS c ON ca.cursos_id = c.id
JOIN estudiantes AS est ON c.id = est.cursos_id
WHERE est.nombre = 'nombre_del_estudiante';

-- Ver los grupos ordenados de forma descendente por la cantidad de estudiantes inscritos
SELECT c.nombre AS curso, COUNT(est.id) AS cantidad_estudiantes
FROM cursos AS c
LEFT JOIN estudiantes AS est ON c.id = est.cursos_id
GROUP BY c.id
ORDER BY cantidad_estudiantes DESC;

<div align="justify">

# Code, Learn & Practice("Simulacro de bbdd 🧪: Consultas, Índices, Vistas, Funciones y Procedimientos")

<div align="center">
<img src="https://www.seguridadkimika.eus/wp-content/uploads/2017/10/sirenas-seguridad-kimika-simulacro.jpg" width="200px"/>
</div>

## 🧾 Contexto

Como analista de datos en una universidad, se te ha encargado la explotación de una base de datos que permita gestionar estudiantes, profesores, cursos y matrículas. Además, deberás demostrar habilidades en consultas SQL, índices, vistas, procedimientos y funciones.

## Base de datos en docker

## 🔎 Parte 1: Consultas SQL

### A. Consultas Simples

1. Mostrar todos los cursos disponibles.

```sql
SELECT * FROM cursos;
+----+----------------------+-------------+----------+
| id | nombre               | profesor_id | creditos |
+----+----------------------+-------------+----------+
|  1 | Álgebra Lineal       |           1 |        6 |
|  2 | Programación I       |           2 |        5 |
|  3 | Mecánica Clásica     |           3 |        6 |
|  4 | Estructuras de Datos |           2 |        5 |
|  5 | Cálculo I            |           1 |        6 |
+----+----------------------+-------------+----------+
5 rows in set (0.000001 sec)
```

2. Mostrar el nombre de todos los profesores.

```sql
SELECT nombre FROM profesores;
+------------------+
| nombre           |
+------------------+
| Dra. Ana Torres  |
| Dr. Luis Gómez   |
| Dra. Marta Díaz  |
+------------------+
3 rows in set (0.000003 sec)
```

3. Listar todas las matrículas.

```sql
SELECT * FROM matriculas;
+----+---------------+----------+------------+
| id | estudiante_id | curso_id | fecha      |
+----+---------------+----------+------------+
|  1 |             1 |        1 | 2021-09-01 |
|  2 |             2 |        2 | 2022-09-01 |
|  3 |             3 |        3 | 2023-09-02 |
|  4 |             4 |        4 | 2024-09-03 |
|  5 |             1 |        5 | 2020-09-04 |
|  6 |             2 |        4 | 2022-09-05 |
|  7 |             3 |        1 | 2023-09-06 |
|  8 |             4 |        2 | 2024-09-06 |
+----+---------------+----------+------------+
8 rows in set (0.000001 sec)

```

4. Ver los nombres y correos de los estudiantes.

```sql
SELECT nombre, email FROM estudiantes;
+-------------------+----------------+
| nombre            | email          |
+-------------------+----------------+
| María López       | maria@uni.edu  |
| Juan Pérez        | juan@uni.edu   |
| Lucía Fernández   | lucia@uni.edu  |
| Carlos Ruiz       | carlos@uni.edu |
+-------------------+----------------+
4 rows in set (0.000001 sec)
```

5. Ver los cursos y su número de créditos.

```sql
SELECT nombre AS curso, creditos FROM cursos;
+----------------------+----------+
| curso                | creditos |
+----------------------+----------+
| Álgebra Lineal       |        6 |
| Programación I       |        5 |
| Mecánica Clásica     |        6 |
| Estructuras de Datos |        5 |
| Cálculo I            |        6 |
+----------------------+----------+
5 rows in set (0.000001 sec)
```
---

### B. Consultas con `WHERE`. Obligatorio utilizar **WHERE** donde se **combine dos o más tablas**

1. Obtener los cursos impartidos por profesores del departamento de Informática.

```sql

SELECT c.nombre AS cursos, p.departamento AS departamento FROM cursos c,
profesores p WHERE p.id = c.profesor_id AND p.departamento REGEXP "^[Ii]nformatica$";
+----------------------+--------------+
| cursos               | departamento |
+----------------------+--------------+
| Programación I       | Informatica  |
| Estructuras de Datos | Informatica  |
+----------------------+--------------+
2 rows in set (0.00001 sec)
```

2. Obtener los estudiantes que viven en Madrid.

```sql
SELECT e.* FROM estudiantes e WHERE e.ciudad REGEXP "^[Mm]adrid$";
+----+---------------+---------------+--------+
| id | nombre        | email         | ciudad |
+----+---------------+---------------+--------+
|  1 | María López   | maria@uni.edu | Madrid |
+----+---------------+---------------+--------+
1 row in set (0.00001 sec)
```

3. Mostrar los cursos con más de 5 créditos.

```sql
SELECT c.* FROM cursos c WHERE c.creditos > 5;
+----+--------------------+-------------+----------+
| id | nombre             | profesor_id | creditos |
+----+--------------------+-------------+----------+
|  1 | Álgebra Lineal     |           1 |        6 |
|  3 | Mecánica Clásica   |           3 |        6 |
|  5 | Cálculo I          |           1 |        6 |
+----+--------------------+-------------+----------+
3 rows in set (0.00003 sec)
```

4. Ver las matrículas realizadas después del año 2022.

```sql
SELECT m.* FROM matriculas m WHERE YEAR(m.fecha) > "2022";
+----+---------------+----------+------------+
| id | estudiante_id | curso_id | fecha      |
+----+---------------+----------+------------+
|  3 |             3 |        3 | 2023-09-02 |
|  4 |             4 |        4 | 2024-09-03 |
|  7 |             3 |        1 | 2023-09-06 |
|  8 |             4 |        2 | 2024-09-06 |
+----+---------------+----------+------------+
4 rows in set (0.00001 sec)
```

5. Ver los cursos impartidos por la profesora “Dra. Ana Torres”.

```sql
SELECT p.nombre AS profesor, c.nombre AS cursos_impartidos FROM cursos c, profesores p WHERE p.nombre REGEXP 'Dra. Ana Torres';
+-----------------+----------------------+
| profesor        | cursos_impartidos    |
+-----------------+----------------------+
| Dra. Ana Torres | Álgebra Lineal       |
| Dra. Ana Torres | Programación I       |
| Dra. Ana Torres | Mecánica Clásica     |
| Dra. Ana Torres | Estructuras de Datos |
| Dra. Ana Torres | Cálculo I            |
+-----------------+----------------------+
5 rows in set (0.00001 sec)
```

---

### C. Consultas con `JOIN`.  Obligatorio utilizar **JOIN** donde se **combine dos o más tablas**

> (Devuelven el mismo resultado que las anteriores, pero usando combinaciones de tablas)

1. Mostrar cursos impartidos por profesores del departamento de Informática.

```sql
SELECT c.nombre AS cursos, p.departamento AS departamento FROM cursos c J
OIN profesores p ON c.profesor_id = c.id AND p.departamento REGEXP '^[Ii]nformat
ica$';
+--------------------+--------------+
| cursos             | departamento |
+--------------------+--------------+
| Álgebra Lineal     | Informatica  |
| Programación I     | Informatica  |
| Mecánica Clásica   | Informatica  |
+--------------------+--------------+
3 rows in set (0.00001 sec)
```

2. Obtener estudiantes que viven en Madrid.

```sql
SELECT DISTINCT e.* FROM estudiantes e JOIN matriculas m ON e.id = m.estudiante_id WHERE e.ciudad REGEXP "^[Mm]adrid$";
+----+---------------+---------------+--------+
| id | nombre        | email         | ciudad |
+----+---------------+---------------+--------+
|  1 | María López   | maria@uni.edu | Madrid |
+----+---------------+---------------+--------+
1 row in set (0.00004 sec)
```

3. Mostrar cursos con más de 5 créditos.

```sql
SELECT c.* FROM cursos c JOIN profesores p ON c.profesor_id = p.id AND c.creditos > 5;
+----+--------------------+-------------+----------+
| id | nombre             | profesor_id | creditos |
+----+--------------------+-------------+----------+
|  1 | Álgebra Lineal    |           1 |        6 |
|  3 | Mecánica Clásica |           3 |        6 |
|  5 | Cálculo I         |           1 |        6 |
+----+--------------------+-------------+----------+
3 rows in set (0.000001 sec)
```

4. Listar matrículas realizadas después del año 2022.

```sql
SELECT m.* FROM matriculas m JOIN estudiantes e ON m.estudiante_id = e.id AND YEAR(fecha) > "2022";
+----+---------------+----------+------------+
| id | estudiante_id | curso_id | fecha      |
+----+---------------+----------+------------+
|  3 |             3 |        3 | 2023-09-02 |
|  7 |             3 |        1 | 2023-09-06 |
|  4 |             4 |        4 | 2024-09-03 |
|  8 |             4 |        2 | 2024-09-06 |
+----+---------------+----------+------------+
4 rows in set (0.00001 sec)
```

5. Mostrar los cursos impartidos por la profesora “Dra. Ana Torres”.

```sql
SELECT c.nombre AS cursos, p.nombre AS profesora FROM cursos c JOIN profesores p ON c.profesor_id = p.id AND p.nombre REGEXP '^Dra. Ana Torres$';
+-----------------+-----------------+
| cursos          | profesora       |
+-----------------+-----------------+
| Álgebra Lineal  | Dra. Ana Torres |
| Cálculo I       | Dra. Ana Torres |
+-----------------+-----------------+
2 rows in set (0.00002 sec)
```
---

### D. Consultas con Subconsultas

> (Devuelven el mismo resultado que las anteriores, pero usando subconsultas)

1. Cursos impartidos por profesores del departamento de Informática.

```sql
SELECT nombre AS cursos,
(SELECT departamento FROM profesores p WHERE p.id = c.profesor_id) AS departamento
FROM cursos c WHERE c.profesor_id IN 
(SELECT id FROM profesores WHERE departamento REGEXP '^[Ii]nformatica$')
;

+----------------------+--------------+
| cursos               | departamento |
+----------------------+--------------+
| Programación I       | Informatica  |
| Estructuras de Datos | Informatica  |
+----------------------+--------------+
2 rows in set (0.0001 sec)
```

2. Estudiantes que viven en Madrid.

```sql
SELECT e.* FROM estudiantes e WHERE e.id IN (SELECT id FROM estudiantes WHERE ciudad REGEXP "^[Mm]adrid$");
+----+---------------+---------------+--------+
| id | nombre        | email         | ciudad |
+----+---------------+---------------+--------+
|  1 | María López   | maria@uni.edu | Madrid |
+----+---------------+---------------+--------+
1 row in set (0.0001 sec)

```

3. Cursos con más de 5 créditos.

```sql
SELECT * FROM cursos WHERE id IN (SELECT id FROM cursos WHERE creditos > 5);
+----+--------------------+-------------+----------+
| id | nombre             | profesor_id | creditos |
+----+--------------------+-------------+----------+
|  1 | Álgebra Lineal     |           1 |        6 |
|  3 | Mecánica Clásica   |           3 |        6 |
|  5 | Cálculo I          |           1 |        6 |
+----+--------------------+-------------+----------+
3 rows in set (0.0001 sec)
```

4. Matrículas realizadas después del año 2022.

```sql
SELECT * FROM matriculas WHERE id IN (SELECT id FROM matriculas WHERE YEAR(fecha) > "2022");
+----+---------------+----------+------------+
| id | estudiante_id | curso_id | fecha      |
+----+---------------+----------+------------+
|  3 |             3 |        3 | 2023-09-02 |
|  4 |             4 |        4 | 2024-09-03 |
|  7 |             3 |        1 | 2023-09-06 |
|  8 |             4 |        2 | 2024-09-06 |
+----+---------------+----------+------------+
4 rows in set (0.001 sec)
```

5. Cursos impartidos por la profesora “Dra. Ana Torres”.

```sql
SELECT (SELECT nombre FROM profesores WHERE id = c.profesor_id) AS profesor, c.nombre AS cursos_impartidos FROM cursos c WHERE c.profesor_id IN (SELECT id FROM profesores WHERE nombre REGEXP "^Dra. Ana Torres$");
+-----------------+-------------------+
| profesor        | cursos_impartidos |
+-----------------+-------------------+
| Dra. Ana Torres | Álgebra Lineal   |
| Dra. Ana Torres | Cálculo I        |
+-----------------+-------------------+
2 rows in set (0.0002 sec)
```

---

## 📂 Parte 2: Índices

1. Crear un índice en la columna `ciudad` de la tabla `estudiantes`.

```sql
CREATE INDEX idx_ciudad ON estudiantes(ciudad);
Query OK, 0 rows affected (0.0000029 sec)
Records: 0  Duplicates: 0  Warnings: 0
```

2. Crear un índice en la columna `departamento` de la tabla `profesores`.

```sql
CREATE INDEX idx_departamento ON profesores(departamento);
Query OK, 0 rows affected (0.0000020 sec)
Records: 0  Duplicates: 0  Warnings: 0
```

3. Consultar los índices creados.

```sql

SHOW INDEXES FROM estudiantes;
+-------------+------------+------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table       | Non_unique | Key_name   | Seq_in_index | Column_name | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+-------------+------------+------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| estudiantes |          0 | PRIMARY    |            1 | id          | A         |           4 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| estudiantes |          1 | idx_ciudad |            1 | ciudad      | A         |           4 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
+-------------+------------+------------+--------------+-------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
2 rows in set (0.002 sec)

ERROR: 
No query specified

SHOW INDEXES FROM profesores;
+------------+------------+------------------+--------------+--------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| Table      | Non_unique | Key_name         | Seq_in_index | Column_name  | Collation | Cardinality | Sub_part | Packed | Null | Index_type | Comment | Index_comment | Visible | Expression |
+------------+------------+------------------+--------------+--------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
| profesores |          0 | PRIMARY          |            1 | id           | A         |           3 |     NULL |   NULL |      | BTREE      |         |               | YES     | NULL       |
| profesores |          1 | idx_departamento |            1 | departamento | A         |           3 |     NULL |   NULL | YES  | BTREE      |         |               | YES     | NULL       |
+------------+------------+------------------+--------------+--------------+-----------+-------------+----------+--------+------+------------+---------+---------------+---------+------------+
2 rows in set (0.004 sec)

ERROR: 
No query specified
```

4. Eliminar ambos índices.

```sql

DROP INDEX idx_ciudad ON estudiantes;
Query OK, 0 rows affected (0.012 sec)
Records: 0  Duplicates: 0  Warnings: 0

DROP INDEX idx_departamento ON profesores;
Query OK, 0 rows affected (0.011 sec)
Records: 0  Duplicates: 0  Warnings: 0
```
---

## 🪞 Parte 3: Vistas

1. Crear una vista llamada `vista_matriculas_completas` que muestre:
   - nombre del estudiante,
   - nombre del curso,
   - fecha de la matrícula.

```sql
CREATE VIEW vista_matriculas_completas AS 
    SELECT e.nombre AS nombre_estudiante,
           c.nombre AS nombre_curso, 
           m.fecha AS fecha_matricula 
    FROM matriculas m 
    JOIN estudiantes e ON m.estudiante_id = e.id 
    JOIN cursos c ON m.curso_id = c.id;

Query OK, 0 rows affected (0.00005 sec)

```

2. Consultar datos desde la vista, mostrando el nombre del estudiante y la fecha de matrícula.

```sql
SELECT nombre_estudiante, fecha_matricula FROM vista_matriculas_completas;
+-------------------+-----------------+
| nombre_estudiante | fecha_matricula |
+-------------------+-----------------+
| María López       | 2021-09-01      |
| María López       | 2020-09-04      |
| Juan Pérez        | 2022-09-01      |
| Juan Pérez        | 2022-09-05      |
| Lucía Fernández   | 2023-09-02      |
| Lucía Fernández   | 2023-09-06      |
| Carlos Ruiz       | 2024-09-03      |
| Carlos Ruiz       | 2024-09-06      |
+-------------------+-----------------+
8 rows in set (0.00001 sec)
```

3. Eliminar la vista.

```sql
DROP VIEW IF EXISTS vista_matriculas_completas;
Query OK, 0 rows affected (0.00005 sec)
```

---

## ⚙ Parte 4: Procedimiento Almacenado

1. Crear un procedimiento llamado `cursos_por_profesor` que reciba el nombre del profesor como parámetro y devuelva los cursos que imparte y su número de créditos.

```sql
DROP PROCEDURE IF EXISTS cursos_por_profesor;
DELIMITER //
CREATE PROCEDURE cursos_por_profesor (
  IN nombre_profesor VARCHAR(100)
)
BEGIN
  SELECT c.nombre AS cursos_impartidos,
         c.creditos AS numero_creditos 
  FROM cursos c 
  JOIN profesores p ON c.profesor_id = p.id 
  WHERE p.nombre = nombre_profesor;
END //
DELIMITER;

Query OK, 0 rows affected (0.0004 sec)
```

2. Ejecutar el procedimiento con el nombre “Dr. Luis Gómez”.

```sql
CALL cursos_por_profesor('Dr. Luis Gomez');
+----------------------+-----------------+
| cursos_impartidos    | numero_creditos |
+----------------------+-----------------+
| Programacion I       |               5 |
| Estructuras de Datos |               5 |
+----------------------+-----------------+
2 rows in set (0.0002 sec)

Query OK, 0 rows affected (0.0002 sec)
```

3. Eliminar el procedimiento.

```sql
DROP PROCEDURE IF EXISTS cursos_por_profesor;
Query OK, 0 rows affected (0.0004 sec)
```

---

## 🔢 Parte 5: Función Definida por el Usuario

1. Crear una función llamada `total_creditos_estudiante` que reciba el ID de un estudiante y devuelva el total de créditos que ha matriculado.

```sql
DROP FUNCTION IF EXISTS total_creditos_estudiante;
DELIMITER $$

CREATE FUNCTION total_creditos_estudiante(
  id_est INT
)
RETURNS INT
DETERMINISTIC
READS SQL DATA
BEGIN
  DECLARE total INT;

  SELECT SUM(c.creditos)
  INTO total
  FROM matriculas m
  JOIN cursos c ON m.curso_id = c.id
  WHERE m.estudiante_id = id_est;

  RETURN IFNULL(total, 0);

END $$
DELIMITER ;

```

2. Ejecutar la función para un estudiante específico.

```sql
SELECT total_creditos_estudiante(3);
+------------------------------+
| total_creditos_estudiante(3) |
+------------------------------+
|                           12 |
+------------------------------+
1 row in set (0.00003 sec)

```

3. Eliminar la función.

```sql
DROP FUNCTION IF EXISTS total_creditos_estudiante;
Query OK, 0 rows affected (0.0011 sec)
```

</div>

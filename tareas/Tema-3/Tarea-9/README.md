<div align="justify">

# `>_` Tema 3

creación y manipulación de una base de datos SQLite3 desde la línea de comandos_.


## Tarea 9


## - Obtener el nombre del alumno y el nombre de la clase en la que está inscrito.
```sql
sqlite> SELECT a.nombre AS Alumno, c.nombre AS Clases_inscritas FROM Inscripciones AS i JOIN Alumnos AS a ON i.id_alumno = a.id JOIN Clases AS c ON i.id_clase = c.id;
+--------+------------------------+
| Alumno |    Clases_inscritas    |
+--------+------------------------+
| Juan   | Matemáticas 101        |
| Juan   | Historia Antigua       |
| María  | Literatura Moderna     |
| María  | Biología Avanzada      |
| Pedro  | Química Orgánica       |
| Pedro  | Física Cuántica        |
| Laura  | Arte Contemporáneo     |
| Laura  | Inglés Avanzado        |
| Carlos | Economía Internacional |
| Ana    | Derecho Penal          |
+--------+------------------------+
```
## - Obtener el nombre del alumno y la materia de las clases en las que está inscrito.
```sql
sqlite> SELECT a.nombre AS nombre_alumno, c.materia FROM Inscripciones AS i JOIN Alumnos AS a ON i.id_alumno = a.id JOIN Clases AS c ON i.id_clase = c.id;
+---------------+-------------+
| nombre_alumno |   materia   |
+---------------+-------------+
| Juan          | Matemáticas |
| Juan          | Historia    |
| María         | Literatura  |
| María         | Biología    |
| Pedro         | Química     |
| Pedro         | Física      |
| Laura         | Arte        |
| Laura         | Idiomas     |
| Carlos        | Economía    |
| Ana           | Derecho     |
+---------------+-------------+
```

## - Obtener el nombre del alumno, la edad y el nombre del profesor de las clases en las que está inscrito.
```sql
sqlite> SELECT a.nombre AS nombre_alumno, a.edad AS edad_alumno,  c.profesor FROM Inscripciones AS i JOIN Alumnos AS a ON i.id_alumno = a.id JOIN Clases AS c ON i.id_clase = c.id;
+---------------+-------------+------------+
| nombre_alumno | edad_alumno |  profesor  |
+---------------+-------------+------------+
| Juan          | 20          | Profesor X |
| Juan          | 20          | Profesor Y |
| María         | 21          | Profesor Z |
| María         | 21          | Profesor W |
| Pedro         | 19          | Profesor V |
| Pedro         | 19          | Profesor U |
| Laura         | 22          | Profesor T |
| Laura         | 22          | Profesor S |
| Carlos        | 20          | Profesor R |
| Ana           | 19          | Profesor Q |
+---------------+-------------+------------+
```
## - Obtener el nombre del alumno y la dirección de las clases en las que está inscrito.
>CREO QUE LA CONSULTA ESTÁ MAL, Y LO QUE NOS PIDES ES EL NOMBRE DEL ALUMNO, DIRECCIÓN Y CLASES EN LA QUE ESTÁ INSCRITO PORQUE LA CLASE NO TIENE DIRECCIÓN 
```sql
sqlite> SELECT a.nombre AS nombre_alumno, a.direccion, c.nombre AS clases_inscrito FROM Inscripciones AS i JOIN Alumnos AS a ON i.id_alumno = a.id JOIN Clases AS c ON i.id_clase = c.id;
+---------------+-----------+------------------------+
| nombre_alumno | direccion |    clases_inscrito     |
+---------------+-----------+------------------------+
| Juan          | Calle A   | Matemáticas 101        |
| Juan          | Calle A   | Historia Antigua       |
| María         | Calle B   | Literatura Moderna     |
| María         | Calle B   | Biología Avanzada      |
| Pedro         | Calle C   | Química Orgánica       |
| Pedro         | Calle C   | Física Cuántica        |
| Laura         | Calle D   | Arte Contemporáneo     |
| Laura         | Calle D   | Inglés Avanzado        |
| Carlos        | Calle E   | Economía Internacional |
| Ana           | Calle F   | Derecho Penal          |
+---------------+-----------+------------------------+
```

## - Obtener el nombre del alumno y el nombre de la clase junto con el profesor.

```sql
sqlite> SELECT a.nombre AS nombre_alumno, c.nombre AS clases_inscrito, c.profesor FROM Inscripciones AS i JOIN Alumnos AS a ON i.id_alumno = a.id JOIN Clases AS c ON i.id_clase = c.id;
+---------------+------------------------+------------+
| nombre_alumno |    clases_inscrito     |  profesor  |
+---------------+------------------------+------------+
| Juan          | Matemáticas 101        | Profesor X |
| Juan          | Historia Antigua       | Profesor Y |
| María         | Literatura Moderna     | Profesor Z |
| María         | Biología Avanzada      | Profesor W |
| Pedro         | Química Orgánica       | Profesor V |
| Pedro         | Física Cuántica        | Profesor U |
| Laura         | Arte Contemporáneo     | Profesor T |
| Laura         | Inglés Avanzado        | Profesor S |
| Carlos        | Economía Internacional | Profesor R |
| Ana           | Derecho Penal          | Profesor Q |
+---------------+------------------------+------------+
```

## - Obtener el nombre del alumno, la materia y el nombre del profesor de las clases en las que está inscrito.

```sql
sqlite> SELECT a.nombre AS nombre_alumno, c.materia, c.profesor FROM Inscripciones AS i JOIN Alumnos AS a ON i.id_alumno = a.id JOIN Clases AS c ON i.id_clase = c.id; 
+---------------+-------------+------------+
| nombre_alumno |   materia   |  profesor  |
+---------------+-------------+------------+
| Juan          | Matemáticas | Profesor X |
| Juan          | Historia    | Profesor Y |
| María         | Literatura  | Profesor Z |
| María         | Biología    | Profesor W |
| Pedro         | Química     | Profesor V |
| Pedro         | Física      | Profesor U |
| Laura         | Arte        | Profesor T |
| Laura         | Idiomas     | Profesor S |
| Carlos        | Economía    | Profesor R |
| Ana           | Derecho     | Profesor Q |
+---------------+-------------+------------+
```

## - Obtener el nombre del alumno, la edad y la materia de las clases en las que está inscrito.

```sql
sqlite> SELECT a.nombre AS nombre_alumno, a.edad, c.materia FROM Inscripciones AS i JOIN Alumnos AS a ON i.id_alumno = a.id JOIN Clases AS c ON i.id_clase = c.id; 
+---------------+------+-------------+
| nombre_alumno | edad |   materia   |
+---------------+------+-------------+
| Juan          | 20   | Matemáticas |
| Juan          | 20   | Historia    |
| María         | 21   | Literatura  |
| María         | 21   | Biología    |
| Pedro         | 19   | Química     |
| Pedro         | 19   | Física      |
| Laura         | 22   | Arte        |
| Laura         | 22   | Idiomas     |
| Carlos        | 20   | Economía    |
| Ana           | 19   | Derecho     |
+---------------+------+-------------+
```

## - Obtener el nombre del alumno, la dirección y el profesor de las clases en las que está inscrito.

```sql
sqlite> SELECT a.nombre AS nombre_alumno, a.direccion, c.profesor FROM Inscripciones AS i JOIN Alumnos AS a ON i.id_alumno = a.id JOIN Clases AS c ON i.id_clase = c.id;
+---------------+-----------+------------+
| nombre_alumno | direccion |  profesor  |
+---------------+-----------+------------+
| Juan          | Calle A   | Profesor X |
| Juan          | Calle A   | Profesor Y |
| María         | Calle B   | Profesor Z |
| María         | Calle B   | Profesor W |
| Pedro         | Calle C   | Profesor V |
| Pedro         | Calle C   | Profesor U |
| Laura         | Calle D   | Profesor T |
| Laura         | Calle D   | Profesor S |
| Carlos        | Calle E   | Profesor R |
| Ana           | Calle F   | Profesor Q |
+---------------+-----------+------------+
```

## - Obtener el nombre del alumno y la materia de las clases en las que está inscrito, ordenado por el nombre del alumno.

```sql
sqlite> SELECT a.nombre AS nombre_alumno, c.materia AS materia_inscrita FROM Inscripciones AS i JOIN Alumnos AS a ON i.id_alumno = a.id JOIN Clases AS c ON i.id_clase = c.id ORDER BY a.nombre;
+---------------+------------------+
| nombre_alumno | materia_inscrita |
+---------------+------------------+
| Ana           | Derecho          |
| Carlos        | Economía         |
| Juan          | Matemáticas      |
| Juan          | Historia         |
| Laura         | Arte             |
| Laura         | Idiomas          |
| María         | Literatura       |
| María         | Biología         |
| Pedro         | Química          |
| Pedro         | Física           |
+---------------+------------------+
```

## - Contar cuántos alumnos están inscritos en cada clase.

```sql
sqlite> SELECT c.nombre AS nombre_curso, COUNT(a.id) AS cantidad_alumnos FROM Inscripciones AS i JOIN Clases AS c ON i.id_clase = c.id JOIN Alumnos AS a ON i.id_alumno = a.id GROUP BY c.nombre;
+------------------------+------------------+
|      nombre_curso      | cantidad_alumnos |
+------------------------+------------------+
| Arte Contemporáneo     | 1                |
| Biología Avanzada      | 1                |
| Derecho Penal          | 1                |
| Economía Internacional | 1                |
| Física Cuántica        | 1                |
| Historia Antigua       | 1                |
| Inglés Avanzado        | 1                |
| Literatura Moderna     | 1                |
| Matemáticas 101        | 1                |
| Química Orgánica       | 1                |
+------------------------+------------------+
```


</div>
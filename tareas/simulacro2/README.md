
-- 1. Consultas Básicas (8 consultas - 1.6 puntos)
-- Listar todos los libros disponibles
```sql
SELECT * FROM libro WHERE disponible != 0;
+----+-----------------------------------+------------------------+-----------------+-----------------+------------+
| id |              titulo               |         autor          |     genero      | año_publicacion | disponible |
+----+-----------------------------------+------------------------+-----------------+-----------------+------------+
| 1  | El Quijote                        | Miguel de Cervantes    | Clásico         | 1605            | 1          |
| 3  | 1984                              | George Orwell          | Ciencia ficción | 1949            | 1          |
| 5  | La sombra del viento              | Carlos Ruiz Zafón      | Misterio        | 2001            | 1          |
| 7  | Ficciones                         | Jorge Luis Borges      | Cuentos         | 1944            | 1          |
| 9  | El amor en los tiempos del cólera | Gabriel García Márquez | Romance         | 1985            | 1          |
+----+-----------------------------------+------------------------+-----------------+-----------------+------------+
```
-- Mostrar socios de Madrid ordenados por apellido
```sql
SELECT * FROM socio WHERE ciudad REGEXP "^Madrid*" ORDER BY apellido1, apellido2 ASC;
+----+--------+-----------+-----------+--------+------------+-----------+
| id | nombre | apellido1 | apellido2 | ciudad | fecha_alta | categoria |
+----+--------+-----------+-----------+--------+------------+-----------+
| 1  | Laura  | García    | Martínez  | Madrid | 2020-03-15 | A         |
| 5  | Elena  | Martín    | Díaz      | Madrid | 2023-02-18 | B         |
+----+--------+-----------+-----------+--------+------------+-----------+
```
-- Libros publicados después de 1950
```sql
SELECT * FROM libro WHERE año_publicacion > 1950;
+----+-----------------------------------+------------------------+-----------------+-----------------+------------+
| id |              titulo               |         autor          |     genero      | año_publicacion | disponible |
+----+-----------------------------------+------------------------+-----------------+-----------------+------------+
| 2  | Cien años de soledad              | Gabriel García Márquez | Realismo mágico | 1967            | 0          |
| 5  | La sombra del viento              | Carlos Ruiz Zafón      | Misterio        | 2001            | 1          |
| 6  | Rayuela                           | Julio Cortázar         | Experimental    | 1963            | 0          |
| 8  | Los pilares de la Tierra          | Ken Follett            | Histórica       | 1989            | 0          |
| 9  | El amor en los tiempos del cólera | Gabriel García Márquez | Romance         | 1985            | 1          |
| 10 | La casa de los espíritus          | Isabel Allende         | Realismo mágico | 1982            | 0          |
+----+-----------------------------------+------------------------+-----------------+-----------------+------------+
```
-- Bibliotecarios con más de 3 años de antigüedad
```sql
SELECT * FROM bibliotecario WHERE antiguedad >= 3;
+----+-----------+-----------+-----------+------------+
| id |  nombre   | apellido1 | apellido2 | antiguedad |
+----+-----------+-----------+-----------+------------+
| 1  | Daniel    | Vázquez   | Gil       | 5          |
| 2  | María     | Castro    | Ortega    | 3          |
| 4  | Lucía     | Reyes     | Martín    | 7          |
| 6  | Isabel    | Morales   | Iglesias  | 4          |
| 7  | Francisco | Santana   | Méndez    | 6          |
+----+-----------+-----------+-----------+------------+
```
-- Préstamos realizados en 2023
```sql
SELECT * FROM prestamo WHERE fecha_prestamo REGEXP "^2023";
+----+----------------+------------------+----------+----------+
| id | fecha_prestamo | fecha_devolucion | id_socio | id_libro |
+----+----------------+------------------+----------+----------+
| 1  | 2023-01-10     | 2023-01-24       | 1        | 2        |
| 2  | 2023-02-15     | 2023-03-01       | 3        | 4        |
| 3  | 2023-03-20     |                  | 5        | 6        |
| 4  | 2023-04-05     | 2023-04-19       | 2        | 8        |
| 5  | 2023-05-12     |                  | 4        | 10       |
| 6  | 2023-01-22     | 2023-02-05       | 6        | 2        |
| 7  | 2023-02-18     | 2023-03-04       | 7        | 4        |
| 8  | 2023-03-25     |                  | 8        | 6        |
| 9  | 2023-04-10     | 2023-04-24       | 9        | 8        |
| 10 | 2023-05-15     |                  | 10       | 10       |
| 11 | 2023-01-05     | 2023-01-19       | 1        | 1        |
| 12 | 2023-02-10     | 2023-02-24       | 2        | 3        |
| 13 | 2023-03-15     |                  | 3        | 5        |
| 14 | 2023-04-20     | 2023-05-04       | 4        | 7        |
| 15 | 2023-05-25     |                  | 5        | 9        |
+----+----------------+------------------+----------+----------+
```
-- Socios sin segundo apellido
```sql
SELECT * FROM socio WHERE apellido2 IS NULL;
+----+----------+-----------+-----------+-----------+------------+-----------+
| id |  nombre  | apellido1 | apellido2 |  ciudad   | fecha_alta | categoria |
+----+----------+-----------+-----------+-----------+------------+-----------+
| 3  | Ana      | Sánchez   |           | Valencia  | 2022-01-10 | C         |
| 9  | Patricia | Romero    |           | Barcelona | 2023-01-15 | A         |
+----+----------+-----------+-----------+-----------+------------+-----------+
```
-- Libros del género "Realismo mágico"
```sql
SELECT * FROM libro WHERE genero REGEXP "^Realismo mágico*";
+----+--------------------------+------------------------+-----------------+-----------------+------------+
| id |          titulo          |         autor          |     genero      | año_publicacion | disponible |
+----+--------------------------+------------------------+-----------------+-----------------+------------+
| 2  | Cien años de soledad     | Gabriel García Márquez | Realismo mágico | 1967            | 0          |
| 10 | La casa de los espíritus | Isabel Allende         | Realismo mágico | 1982            | 0          |
+----+--------------------------+------------------------+-----------------+-----------------+------------+
```
-- Préstamos no devueltos (fecha_devolucion IS NULL)
```sql
SELECT * FROM prestamo WHERE fecha_devolucion IS NULL;
+----+----------------+------------------+----------+----------+
| id | fecha_prestamo | fecha_devolucion | id_socio | id_libro |
+----+----------------+------------------+----------+----------+
| 3  | 2023-03-20     |                  | 5        | 6        |
| 5  | 2023-05-12     |                  | 4        | 10       |
| 8  | 2023-03-25     |                  | 8        | 6        |
| 10 | 2023-05-15     |                  | 10       | 10       |
| 13 | 2023-03-15     |                  | 3        | 5        |
| 15 | 2023-05-25     |                  | 5        | 9        |
+----+----------------+------------------+----------+----------+
```
-- 2. Consultas Multitabla (WHERE) (8 consultas - 2.4 puntos)
-- Préstamos con nombres de socio y libro (sin JOIN)
```sql
SELECT s.nombre, l.titulo FROM prestamo p, libro l, socio s WHERE p.id_socio = s.id AND p.id_libro = l.id;
+----------+-----------------------------------+
|  nombre  |              titulo               |
+----------+-----------------------------------+
| Laura    | Cien años de soledad              |
| Ana      | Orgullo y prejuicio               |
| Elena    | Rayuela                           |
| Carlos   | Los pilares de la Tierra          |
| David    | La casa de los espíritus          |
| Javier   | Cien años de soledad              |
| Sofía    | Orgullo y prejuicio               |
| Miguel   | Rayuela                           |
| Patricia | Los pilares de la Tierra          |
| Antonio  | La casa de los espíritus          |
| Laura    | El Quijote                        |
| Carlos   | 1984                              |
| Ana      | La sombra del viento              |
| David    | Ficciones                         |
| Elena    | El amor en los tiempos del cólera |
+----------+-----------------------------------+
```
-- Libros prestados a socios de Barcelona (sin JOIN)
```sql
SELECT s.nombre, l.* FROM prestamo p, libro l, socio s WHERE p.id_socio = s.id AND p.id_libro = l.id AND s.ciudad REGEXP "^Barcelona*";
+----------+----+--------------------------+---------------+-----------------+-----------------+------------+
|  nombre  | id |          titulo          |     autor     |     genero      | año_publicacion | disponible |
+----------+----+--------------------------+---------------+-----------------+-----------------+------------+
| Carlos   | 8  | Los pilares de la Tierra | Ken Follett   | Histórica       | 1989            | 0          |
| Patricia | 8  | Los pilares de la Tierra | Ken Follett   | Histórica       | 1989            | 0          |
| Carlos   | 3  | 1984                     | George Orwell | Ciencia ficción | 1949            | 1          |
+----------+----+--------------------------+---------------+-----------------+-----------------+------------+
```
-- Socios que han tomado prestado "Cien años de soledad" (sin JOIN)
```sql
SELECT s.nombre, l.titulo FROM prestamo p, socio s, libro l WHERE p.id_socio = s.id AND p.id_libro = l.id AND l.titulo REGEXP "^Cien años de soledad$";
+--------+----------------------+
| nombre |        titulo        |
+--------+----------------------+
| Laura  | Cien años de soledad |
| Javier | Cien años de soledad |
+--------+----------------------+
```
-- Bibliotecarios que han gestionado préstamos (sin JOIN)

-- Préstamos con retraso (fecha_devolucion > fecha_prestamo + 14 días)
```sql
SELECT p.*, s.nombre, l.titulo FROM prestamo p, socio s, libro l WHERE p.id_socio = s.id AND p.id_libro = l.id AND DATE(p.fecha_devolucion) > DATE(p.fecha_prestamo, '+14 days');
```
-- Socios que nunca han tomado prestado un libro (sin LEFT JOIN)

-- Libros más prestados (sin JOIN)
```sql
SELECT l.titulo, COUNT(p.id_libro) AS cantidad_prestamos FROM prestamo p, libro l WHERE p.id_libro = l.id GROUP BY l.titulo ORDER BY cantidad_prestamos DESC;
```
-- Autores cuyos libros han sido prestados (sin JOIN)
```sql
SELECT l.titulo, COUNT(p.id_libro) AS cantidad_prestamos FROM prestamo p, libro l WHERE p.id_libro = l.id GROUP BY l.titulo ORDER BY cantidad_prestamos DESC;
+-----------------------------------+--------------------+
|              titulo               | cantidad_prestamos |
+-----------------------------------+--------------------+
| Rayuela                           | 2                  |
| Orgullo y prejuicio               | 2                  |
| Los pilares de la Tierra          | 2                  |
| La casa de los espíritus          | 2                  |
| Cien años de soledad              | 2                  |
| La sombra del viento              | 1                  |
| Ficciones                         | 1                  |
| El amor en los tiempos del cólera | 1                  |
| El Quijote                        | 1                  |
| 1984                              | 1                  |
+-----------------------------------+--------------------+
```
-- 3. Consultas Multitabla (JOIN) (8 consultas - 2.4 puntos)
-- Préstamos con nombres de socio y libro (JOIN)
```sql
SELECT s.nombre AS nombre_socio, l.titulo AS libro_prestado FROM prestamo p JOIN socio s ON p.id_socio = s.id JOIN libro l ON p.id_libro = l.id;
+--------------+-----------------------------------+
| nombre_socio |          libro_prestado           |
+--------------+-----------------------------------+
| Laura        | Cien años de soledad              |
| Ana          | Orgullo y prejuicio               |
| Elena        | Rayuela                           |
| Carlos       | Los pilares de la Tierra          |
| David        | La casa de los espíritus          |
| Javier       | Cien años de soledad              |
| Sofía        | Orgullo y prejuicio               |
| Miguel       | Rayuela                           |
| Patricia     | Los pilares de la Tierra          |
| Antonio      | La casa de los espíritus          |
| Laura        | El Quijote                        |
| Carlos       | 1984                              |
| Ana          | La sombra del viento              |
| David        | Ficciones                         |
| Elena        | El amor en los tiempos del cólera |
+--------------+-----------------------------------+
```
-- Libros prestados a socios de Barcelona (JOIN)
```sql
SELECT l.* FROM prestamo p JOIN libro l ON p.id_libro = l.id JOIN socio s ON p.id_socio = s.id AND s.ciudad REGEXP "^Barcelona*";
+----+--------------------------+---------------+-----------------+-----------------+------------+
| id |          titulo          |     autor     |     genero      | año_publicacion | disponible |
+----+--------------------------+---------------+-----------------+-----------------+------------+
| 8  | Los pilares de la Tierra | Ken Follett   | Histórica       | 1989            | 0          |
| 8  | Los pilares de la Tierra | Ken Follett   | Histórica       | 1989            | 0          |
| 3  | 1984                     | George Orwell | Ciencia ficción | 1949            | 1          |
+----+--------------------------+---------------+-----------------+-----------------+------------+
```
-- Socios que han tomado prestado "Cien años de soledad" (JOIN)
```sql
SELECT s.nombre AS nombre_socio, l.titulo AS libro_prestado FROM prestamo p JOIN libro l ON p.id_libro = l.id AND l.titulo REGEXP "^Cien años de soledad$" JOIN socio s ON p.id_socio = s.id;
+--------------+----------------------+
| nombre_socio |    libro_prestado    |
+--------------+----------------------+
| Laura        | Cien años de soledad |
| Javier       | Cien años de soledad |
+--------------+----------------------+
```
-- Bibliotecarios que han gestionado préstamos (JOIN)

-- Préstamos con datos completos (socio, libro, bibliotecario)

-- Socios con sus préstamos activos (JOIN)
```sql
SELECT s.nombre AS nombre_socio, l.titulo AS libro_aun_prestado FROM prestamo p JOIN socio s ON p.id_socio = s.id JOIN libro l ON p.id_libro = l.id AND p.fecha_devolucion IS NULL;
+--------------+-----------------------------------+
| nombre_socio |        libro_aun_prestado         |
+--------------+-----------------------------------+
| Elena        | Rayuela                           |
| David        | La casa de los espíritus          |
| Miguel       | Rayuela                           |
| Antonio      | La casa de los espíritus          |
| Ana          | La sombra del viento              |
| Elena        | El amor en los tiempos del cólera |
+--------------+-----------------------------------+
```
-- Libros nunca prestados (LEFT JOIN)
```sql
SELECT DISTINCT l.* FROM prestamo p LEFT JOIN libro l ON p.id_libro = l.id WHERE p.id_libro IS NULL;
-- Autores con número de libros prestados (JOIN + GROUP BY)
SELECT l.autor, COUNT(p.id_libro) AS cantidad_libro_prestado FROM prestamo p JOIN libro l ON p.id_libro = l.id GROUP BY l.autor;
+------------------------+-------------------------+
|         autor          | cantidad_libro_prestado |
+------------------------+-------------------------+
| Carlos Ruiz Zafón      | 1                       |
| Gabriel García Márquez | 3                       |
| George Orwell          | 1                       |
| Isabel Allende         | 2                       |
| Jane Austen            | 2                       |
| Jorge Luis Borges      | 1                       |
| Julio Cortázar         | 2                       |
| Ken Follett            | 2                       |
| Miguel de Cervantes    | 1                       |
+------------------------+-------------------------+
```
-- 4. Consultas Resumen (8 consultas - 2.4 puntos)
-- Número de socios por ciudad
```sql
SELECT s.ciudad, COUNT(s.id) AS cantidad FROM socio s GROUP BY ciudad;
+-----------+----------+
|  ciudad   | cantidad |
+-----------+----------+
| Barcelona | 2        |
| Bilbao    | 1        |
| Madrid    | 2        |
| Málaga    | 1        |
| Sevilla   | 1        |
| Valencia  | 2        |
| Zaragoza  | 1        |
+-----------+----------+
```
-- Promedio de antigüedad de bibliotecarios
```sql
SELECT AVG(antiguedad) AS promedio_antiguedad FROM bibliotecario;
+---------------------+
| promedio_antiguedad |
+---------------------+
| 3.75                |
+---------------------+
```
-- Cantidad de préstamos por mes en 2023

-- Libros más populares (por veces prestados)
```sql
SELECT l.titulo, COUNT(p.id_libro) AS cantidad_prestamos FROM prestamo p JOIN libro l ON p.id_libro = l.id GROUP BY l.titulo ORDER BY cantidad_prestamos DESC;
+-----------------------------------+--------------------+
|              titulo               | cantidad_prestamos |
+-----------------------------------+--------------------+
| Rayuela                           | 2                  |
| Orgullo y prejuicio               | 2                  |
| Los pilares de la Tierra          | 2                  |
| La casa de los espíritus          | 2                  |
| Cien años de soledad              | 2                  |
| La sombra del viento              | 1                  |
| Ficciones                         | 1                  |
| El amor en los tiempos del cólera | 1                  |
| El Quijote                        | 1                  |
| 1984                              | 1                  |
+-----------------------------------+--------------------+
```
-- Socios más activos (por préstamos realizados)
```sql
SELECT s.nombre, COUNT(p.id_socio) AS cantidad_prestamos FROM prestamo p JOIN socio s ON p.id_socio = s.id GROUP BY s.nombre ORDER BY cantidad_prestamos DESC;
+----------+--------------------+
|  nombre  | cantidad_prestamos |
+----------+--------------------+
| Laura    | 2                  |
| Elena    | 2                  |
| David    | 2                  |
| Carlos   | 2                  |
| Ana      | 2                  |
| Sofía    | 1                  |
| Patricia | 1                  |
| Miguel   | 1                  |
| Javier   | 1                  |
| Antonio  | 1                  |
+----------+--------------------+
```
-- Porcentaje de libros disponibles
```sql
SELECT ROUND(COUNT(*) * 100.0 / (SELECT COUNT(*) FROM libro), 2) AS porcentaje_disponible FROM libro WHERE disponible = 1;
+-----------------------+
| porcentaje_disponible |
+-----------------------+
| 50.0                  |
+-----------------------+
```
-- Días promedio de préstamo

-- Número de préstamos por categoría de socio
```sql
SELECT s.categoria, COUNT(p.id_socio) AS numero_prestamo FROM prestamo p JOIN socio s ON p.id_socio = s.id GROUP BY s.categoria ORDER BY numero_prestamo DESC;
+-----------+-----------------+
| categoria | numero_prestamo |
+-----------+-----------------+
| A         | 6               |
| B         | 5               |
| C         | 4               |
+-----------+-----------------+
```
-- 5. Subconsultas (8 consultas - 1.2 puntos)

-- Socios que han prestado libros de Gabriel García Márquez
```sql
SELECT * FROM socio s WHERE s.id IN (SELECT p.id_socio FROM prestamo p JOIN libro l ON p.id_libro = l.id WHERE l.autor = 'Gabriel García Márquez');
+----+--------+-----------+-----------+--------+------------+-----------+
| id | nombre | apellido1 | apellido2 | ciudad | fecha_alta | categoria |
+----+--------+-----------+-----------+--------+------------+-----------+
| 1  | Laura  | García    | Martínez  | Madrid | 2020-03-15 | A         |
| 5  | Elena  | Martín    | Díaz      | Madrid | 2023-02-18 | B         |
| 6  | Javier | Ruiz      | Moreno    | Bilbao | 2020-07-22 | A         |
+----+--------+-----------+-----------+--------+------------+-----------+
```
-- Libros con préstamos superiores al promedio
```sql
SELECT * FROM libro l WHERE l.id IN (SELECT p.id_libro FROM prestamo p GROUP BY p.id_libro HAVING COUNT(p.id_libro) > (SELECT AVG(cantidad) FROM (SELECT COUNT(*) AS cantidad FROM prestamo GROUP BY id_libro) AS subquery));
+----+--------------------------+------------------------+-----------------+-----------------+------------+
| id |          titulo          |         autor          |     genero      | año_publicacion | disponible |
+----+--------------------------+------------------------+-----------------+-----------------+------------+
| 2  | Cien años de soledad     | Gabriel García Márquez | Realismo mágico | 1967            | 0          |
| 4  | Orgullo y prejuicio      | Jane Austen            | Romance         | 1813            | 0          |
| 6  | Rayuela                  | Julio Cortázar         | Experimental    | 1963            | 0          |
| 8  | Los pilares de la Tierra | Ken Follett            | Histórica       | 1989            | 0          |
| 10 | La casa de los espíritus | Isabel Allende         | Realismo mágico | 1982            | 0          |
+----+--------------------------+------------------------+-----------------+-----------------+------------+
```
-- Socios con todos los préstamos devueltos a tiempo
```sql
SELECT * FROM socio s WHERE s.id IN (SELECT p.id_socio FROM prestamo p GROUP BY p.id_socio HAVING COUNT(p.id_socio) = (SELECT COUNT(*) FROM prestamo WHERE id_socio = s.id AND fecha_devolucion IS NOT NULL));
+----+----------+-----------+-----------+-----------+------------+-----------+
| id |  nombre  | apellido1 | apellido2 |  ciudad   | fecha_alta | categoria |
+----+----------+-----------+-----------+-----------+------------+-----------+
| 1  | Laura    | García    | Martínez  | Madrid    | 2020-03-15 | A         |
| 2  | Carlos   | López     | Fernández | Barcelona | 2021-05-20 | B         |
| 6  | Javier   | Ruiz      | Moreno    | Bilbao    | 2020-07-22 | A         |
| 7  | Sofía    | Hernández | Jiménez   | Zaragoza  | 2022-09-05 | C         |
| 9  | Patricia | Romero    |           | Barcelona | 2023-01-15 | A         |
+----+----------+-----------+-----------+-----------+------------+-----------+
```
-- Bibliotecarios que no han gestionado préstamos

-- Socios que han prestado más libros que el promedio
```sql
SELECT * FROM socio s WHERE s.id IN (SELECT p.id_socio FROM prestamo p GROUP BY p.id_socio HAVING COUNT(p.id_socio) > (SELECT AVG(cantidad) FROM (SELECT COUNT(*) AS cantidad FROM prestamo GROUP BY id_socio) AS subquery));
+----+--------+-----------+-----------+-----------+------------+-----------+
| id | nombre | apellido1 | apellido2 |  ciudad   | fecha_alta | categoria |
+----+--------+-----------+-----------+-----------+------------+-----------+
| 1  | Laura  | García    | Martínez  | Madrid    | 2020-03-15 | A         |
| 2  | Carlos | López     | Fernández | Barcelona | 2021-05-20 | B         |
| 3  | Ana    | Sánchez   |           | Valencia  | 2022-01-10 | C         |
| 4  | David  | Pérez     | Gómez     | Sevilla   | 2021-11-30 | A         |
| 5  | Elena  | Martín    | Díaz      | Madrid    | 2023-02-18 | B         |
+----+--------+-----------+-----------+-----------+------------+-----------+
```
-- Libros disponibles que nunca han sido prestados
```sql
SELECT * FROM libro l WHERE l.id NOT IN (SELECT p.id_libro FROM prestamo p);
```
-- Socios con préstamos en todas las categorías de libros
```sql
SELECT * FROM socio s WHERE s.id IN (SELECT p.id_socio FROM prestamo p JOIN libro l ON p.id_libro = l.id GROUP BY p.id_socio HAVING COUNT(DISTINCT l.genero) = (SELECT COUNT(DISTINCT genero) FROM libro));
```
-- Bibliotecarios que han gestionado préstamos de todos los socios de Madrid

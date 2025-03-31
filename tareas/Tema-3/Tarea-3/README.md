<div align="justify">

# `>_` Tema 3 


creación y manipulación de una base de datos SQLite3 desde la línea de comandos.

## Tarea 3


### Paso 1: Creación de la BBDD
`>_`

```sh
sqlite3 empleados-dump.db
SQLite version 3.49.1 2025-02-18 13:38:58
Enter ".help" for usage hints.
sqlite> CREATE TABLE empleados (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    nombre TEXT,
    salario REAL,
    departamento TEXT
);

INSERT INTO empleados (nombre, salario, departamento) VALUES ('Juan', 50000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('María', 60000, 'TI');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Carlos', 55000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Ana', 48000, 'Recursos Humanos');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Pedro', 70000, 'TI');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Laura', 52000, 'Ventas');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Javier', 48000, 'Recursos Humanos');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Carmen', 65000, 'TI');
INSERT INTO empleados (nombre, salario, departamento) VALUES ('Miguel'', 63000, 'TI');eados (nombre, salario, departamento) VALUES ('Beatriz
sqlite> .mode table
sqlite> SELECT * FROM empleados;
+----+-----------+---------+------------------+
| id |  nombre   | salario |   departamento   |
+----+-----------+---------+------------------+
| 1  | Juan      | 50000.0 | Ventas           |
| 2  | María     | 60000.0 | TI               |
| 3  | Carlos    | 55000.0 | Ventas           |
| 4  | Ana       | 48000.0 | Recursos Humanos |
| 5  | Pedro     | 70000.0 | TI               |
| 6  | Laura     | 52000.0 | Ventas           |
| 7  | Javier    | 48000.0 | Recursos Humanos |
| 8  | Carmen    | 65000.0 | TI               |
| 9  | Miguel    | 51000.0 | Ventas           |
| 10 | Elena     | 55000.0 | Recursos Humanos |
| 11 | Diego     | 72000.0 | TI               |
| 12 | Sofía     | 49000.0 | Ventas           |
| 13 | Andrés    | 60000.0 | Recursos Humanos |
| 14 | Isabel    | 53000.0 | TI               |
| 15 | Raúl      | 68000.0 | Ventas           |
| 16 | Patricia  | 47000.0 | Recursos Humanos |
| 17 | Alejandro | 71000.0 | TI               |
| 18 | Natalia   | 54000.0 | Ventas           |
| 19 | Roberto   | 49000.0 | Recursos Humanos |
| 20 | Beatriz   | 63000.0 | TI               |
+----+-----------+---------+------------------+
sqlite> .output empleados-dump.sql
sqlite> .dump
sqlite> .exit
```
  
### Paso 2 Lectura del fichero sql

`>_`
```sh
sqlite3 tarea3.db
SQLite version 3.49.1 2025-02-18 13:38:58
Enter ".help" for usage hints.
sqlite> .read empleados-dump.sql
sqlite> .exit
```

### Paso 3: Realización de consultas

Realiza las siguientes consultas, y muestra el resultado obtenido:

- Funciones UPPER y LOWER:
  - Muestra el nombre de todos los empleados en mayúsculas.
  `>_`
  ```sh
    sqlite3 tarea3.db
    SQLite version 3.49.1 2025-02-18 13:38:58
    Enter ".help" for usage hints.
    sqlite> .mode table
    sqlite> SELECT UPPER(nombre) FROM Empleados;
    +---------------+
    | UPPER(nombre) |
    +---------------+
    | JUAN          |
    | MARíA         |
    | CARLOS        |
    | ANA           |
    | PEDRO         |
    | LAURA         |
    | JAVIER        |
    | CARMEN        |
    | MIGUEL        |
    | ELENA         |
    | DIEGO         |
    | SOFíA         |
    | ANDRéS        |
    | ISABEL        |
    | RAúL          |
    | PATRICIA      |
    | ALEJANDRO     |
    | NATALIA       |
    | ROBERTO       |
    | BEATRIZ       |
    +---------------+
  ```
- Funciones Numéricas:
  - Calcula el valor absoluto del salario de todos los empleados.
  `>_`
  ```sh
   sqlite> SELECT ABS(salario) FROM empleados;
    +--------------+
    | ABS(salario) |
    +--------------+
    | 50000.0      |
    | 60000.0      |
    | 55000.0      |
    | 48000.0      |
    | 70000.0      |
    | 52000.0      |
    | 48000.0      |
    | 65000.0      |
    | 51000.0      |
    | 55000.0      |
    | 72000.0      |
    | 49000.0      |
    | 60000.0      |
    | 53000.0      |
    | 68000.0      |
    | 47000.0      |
    | 71000.0      |
    | 54000.0      |
    | 49000.0      |
    | 63000.0      |
    +--------------+
  ```
- Funciones de Fecha y Hora:
  - Muestra la fecha actual.
  `>_`
  ```sh
    sqlite> SELECT DATE('now');
    +-------------+
    | DATE('now') |
    +-------------+
    | 2025-03-17  |
    +-------------+
  ```
- Funciones de Agregación:
  - Calcula el promedio de salarios de todos los empleados.
  `>_`
  ```sh
  sqlite> SELECT AVG(salario) FROM empleados;
    +--------------+
    | AVG(salario) |
    +--------------+
    | 57000.0      |
    +--------------+
  ```
  - Convierte la cadena '123' a un valor entero.
  `>_`
  ```sh
    sqlite> SELECT CAST('123' AS INTEGER);
    +------------------------+
    | CAST('123' AS INTEGER) |
    +------------------------+
    | 123                    |
    +------------------------+
  ```
- Funciones de Manipulación de Cadenas:
  - Concatena el nombre y el departamento de cada empleado.
  `>_`
  ```sh
  sqlite> SELECT nombre || departamento FROM empleados;
    +--------------------------+
    |  nombre || departamento  |
    +--------------------------+
    | JuanVentas               |
    | MaríaTI                  |
    | CarlosVentas             |
    | AnaRecursos Humanos      |
    | PedroTI                  |
    | LauraVentas              |
    | JavierRecursos Humanos   |
    | CarmenTI                 |
    | MiguelVentas             |
    | ElenaRecursos Humanos    |
    | DiegoTI                  |
    | SofíaVentas              |
    | AndrésRecursos Humanos   |
    | IsabelTI                 |
    | RaúlVentas               |
    | PatriciaRecursos Humanos |
    | AlejandroTI              |
    | NataliaVentas            |
    | RobertoRecursos Humanos  |
    | BeatrizTI                |
    +--------------------------+
  ```
- Funciones de Manipulación de Cadenas (CONCAT_WS):
  - Concatena el nombre y el departamento de cada empleado con un guion como separador.
  `>_`
  ```sh
  sqlite> SELECT nombre || ' - ' || departamento AS Nombre_Departamento FROM empleados;
    +-----------------------------+
    |     Nombre_Departamento     |
    +-----------------------------+
    | Juan - Ventas               |
    | María - TI                  |
    | Carlos - Ventas             |
    | Ana - Recursos Humanos      |
    | Pedro - TI                  |
    | Laura - Ventas              |
    | Javier - Recursos Humanos   |
    | Carmen - TI                 |
    | Miguel - Ventas             |
    | Elena - Recursos Humanos    |
    | Diego - TI                  |
    | Sofía - Ventas              |
    | Andrés - Recursos Humanos   |
    | Isabel - TI                 |
    | Raúl - Ventas               |
    | Patricia - Recursos Humanos |
    | Alejandro - TI              |
    | Natalia - Ventas            |
    | Roberto - Recursos Humanos  |
    | Beatriz - TI                |
    +-----------------------------+
  ```
- Funciones de Control de Flujo (CASE):
  - Categoriza a los empleados según sus salarios.
  `>_`
  ```sh
    sqlite> SELECT nombre, 
       CASE 
           WHEN salario > 60000 THEN 'Alto'
           WHEN salario BETWEEN 50000 AND 60000 THEN 'Medio'
           ELSE 'Bajo'
       END AS categoria_salario
    FROM empleados;
    +-----------+-------------------+
    |  nombre   | categoria_salario |
    +-----------+-------------------+
    | Juan      | Medio             |
    | María     | Medio             |
    | Carlos    | Medio             |
    | Ana       | Bajo              |
    | Pedro     | Alto              |
    | Laura     | Medio             |
    | Javier    | Bajo              |
    | Carmen    | Alto              |
    | Miguel    | Medio             |
    | Elena     | Medio             |
    | Diego     | Alto              |
    | Sofía     | Bajo              |
    | Andrés    | Medio             |
    | Isabel    | Medio             |
    | Raúl      | Alto              |
    | Patricia  | Bajo              |
    | Alejandro | Alto              |
    | Natalia   | Medio             |
    | Roberto   | Bajo              |
    | Beatriz   | Alto              |
    +-----------+-------------------+
  ```
- Funciones de Agregación (SUM):
  - Calcula la suma total de salarios de todos los empleados.
  `>_`
  ```sh
  sqlite> SELECT SUM(salario) FROM empleados;
    +--------------+
    | SUM(salario) |
    +--------------+
    | 1140000.0    |
    +--------------+
  ```
- Funciones Numéricas (ROUND):
  - Redondea el salario de todos los empleados a dos decimales.
  `>_`
  ```sh
    sqlite> SELECT ROUND(salario, 2) FROM empleados;
    +-------------------+
    | ROUND(salario, 2) |
    +-------------------+
    | 50000.0           |
    | 60000.0           |
    | 55000.0           |
    | 48000.0           |
    | 70000.0           |
    | 52000.0           |
    | 48000.0           |
    | 65000.0           |
    | 51000.0           |
    | 55000.0           |
    | 72000.0           |
    | 49000.0           |
    | 60000.0           |
    | 53000.0           |
    | 68000.0           |
    | 47000.0           |
    | 71000.0           |
    | 54000.0           |
    | 49000.0           |
    | 63000.0           |
    +-------------------+
  ```
- Funciones de Manipulación de Cadenas (LENGTH):
  - Muestra la longitud de cada nombre de empleado.
  `>_`
  ```sh
  sqlite> SELECT LENGTH(nombre) FROM empleados;
    +----------------+
    | LENGTH(nombre) |
    +----------------+
    | 4              |
    | 5              |
    | 6              |
    | 3              |
    | 5              |
    | 5              |
    | 6              |
    | 6              |
    | 6              |
    | 5              |
    | 5              |
    | 5              |
    | 6              |
    | 6              |
    | 4              |
    | 8              |
    | 9              |
    | 7              |
    | 7              |
    | 7              |
    +----------------+
  ```
- Funciones de Agregación (COUNT):
  - Cuenta el número total de empleados en cada departamento.
  `>_`
  ```sh
  sqlite> SELECT departamento, COUNT(*) FROM empleados GROUP BY departamento;
    +------------------+----------+
    |   departamento   | COUNT(*) |
    +------------------+----------+
    | Recursos Humanos | 6        |
    | TI               | 7        |
    | Ventas           | 7        |
    +------------------+----------+
  ```
- Funciones de Fecha y Hora (CURRENT_TIME):
  - Muestra la hora actual.
  `>_`
  ```sh
  sqlite> SELECT TIME('now');
    +-------------+
    | TIME('now') |
    +-------------+
    | 23:20:24    |
    +-------------+
  ```
- Funciones de Conversión (CAST):
  - Convierte el salario a un valor de punto flotante.
  `>_`
  ```sh
  SELECT CAST(salario AS FLOAT) FROM empleados;
    +------------------------+
    | CAST(salario AS FLOAT) |
    +------------------------+
    | 50000.0                |
    | 60000.0                |
    | 55000.0                |
    | 48000.0                |
    | 70000.0                |
    | 52000.0                |
    | 48000.0                |
    | 65000.0                |
    | 51000.0                |
    | 55000.0                |
    | 72000.0                |
    | 49000.0                |
    | 60000.0                |
    | 53000.0                |
    | 68000.0                |
    | 47000.0                |
    | 71000.0                |
    | 54000.0                |
    | 49000.0                |
    | 63000.0                |
    +------------------------+
  ```
- Funciones de Manipulación de Cadenas (SUBSTR):
  - Muestra los primeros tres caracteres de cada nombre de empleado.
  `>_`
  ```sh
  sqlite> SELECT SUBSTR(nombre, 1, 3) FROM empleados;
    +----------------------+
    | SUBSTR(nombre, 1, 3) |
    +----------------------+
    | Jua                  |
    | Mar                  |
    | Car                  |
    | Ana                  |
    | Ped                  |
    | Lau                  |
    | Jav                  |
    | Car                  |
    | Mig                  |
    | Ele                  |
    | Die                  |
    | Sof                  |
    | And                  |
    | Isa                  |
    | Raú                  |
    | Pat                  |
    | Ale                  |
    | Nat                  |
    | Rob                  |
    | Bea                  |
    +----------------------+
  ```

- __Order By__ and __Like__.
  - Empleados en el departamento de 'Ventas' con salarios superiores a 52000.
  `>_`
  ```sh
  sqlite> SELECT * FROM empleados WHERE departamento = 'Ventas' AND salario > 52000;
    +----+---------+---------+--------------+
    | id | nombre  | salario | departamento |
    +----+---------+---------+--------------+
    | 3  | Carlos  | 55000.0 | Ventas       |
    | 15 | Raúl    | 68000.0 | Ventas       |
    | 18 | Natalia | 54000.0 | Ventas       |
    +----+---------+---------+--------------+
  ```
  - Empleados cuyos nombres contienen la letra 'a' y tienen salarios ordenados de manera ascendente.
  `>_`
  ```sh
  sqlite> SELECT * FROM empleados WHERE nombre REGEXP 'a' ORDER BY salario ASC;
    +----+-----------+---------+------------------+
    | id |  nombre   | salario |   departamento   |
    +----+-----------+---------+------------------+
    | 16 | Patricia  | 47000.0 | Recursos Humanos |
    | 4  | Ana       | 48000.0 | Recursos Humanos |
    | 7  | Javier    | 48000.0 | Recursos Humanos |
    | 12 | Sofía     | 49000.0 | Ventas           |
    | 1  | Juan      | 50000.0 | Ventas           |
    | 6  | Laura     | 52000.0 | Ventas           |
    | 14 | Isabel    | 53000.0 | TI               |
    | 18 | Natalia   | 54000.0 | Ventas           |
    | 3  | Carlos    | 55000.0 | Ventas           |
    | 10 | Elena     | 55000.0 | Recursos Humanos |
    | 2  | María     | 60000.0 | TI               |
    | 13 | Andrés    | 60000.0 | Recursos Humanos |
    | 20 | Beatriz   | 63000.0 | TI               |
    | 8  | Carmen    | 65000.0 | TI               |
    | 15 | Raúl      | 68000.0 | Ventas           |
    | 17 | Alejandro | 71000.0 | TI               |
    +----+-----------+---------+------------------+
  ```
  - Empleados en el departamento 'Recursos Humanos' con salarios entre 45000 y 55000.
  `>_`
  ```sh
  sqlite> SELECT * FROM empleados WHERE departamento = 'Recursos Humanos' AND salario BETWEEN 45000 AND 55000;
    +----+----------+---------+------------------+
    | id |  nombre  | salario |   departamento   |
    +----+----------+---------+------------------+
    | 4  | Ana      | 48000.0 | Recursos Humanos |
    | 7  | Javier   | 48000.0 | Recursos Humanos |
    | 10 | Elena    | 55000.0 | Recursos Humanos |
    | 16 | Patricia | 47000.0 | Recursos Humanos |
    | 19 | Roberto  | 49000.0 | Recursos Humanos |
    +----+----------+---------+------------------+
  ```
  - Empleados con salarios en orden descendente, limitando a los primeros 5 resultados.
  `>_`
  ```sh
  sqlite> SELECT * FROM empleados ORDER BY salario DESC LIMIT 5;
    +----+-----------+---------+--------------+
    | id |  nombre   | salario | departamento |
    +----+-----------+---------+--------------+
    | 11 | Diego     | 72000.0 | TI           |
    | 17 | Alejandro | 71000.0 | TI           |
    | 5  | Pedro     | 70000.0 | TI           |
    | 15 | Raúl      | 68000.0 | Ventas       |
    | 8  | Carmen    | 65000.0 | TI           |
    +----+-----------+---------+--------------+
  ```
  - Empleados cuyos nombres comienzan con 'M' o 'N' y tienen salarios superiores a 50000.
  `>_`
  ```sh
  sqlite> SELECT * FROM empleados WHERE nombre REGEXP '^[MN]' AND salario > 50000;
    +----+---------+---------+--------------+
    | id | nombre  | salario | departamento |
    +----+---------+---------+--------------+
    | 2  | María   | 60000.0 | TI           |
    | 9  | Miguel  | 51000.0 | Ventas       |
    | 18 | Natalia | 54000.0 | Ventas       |
    +----+---------+---------+--------------+
  ```
  - Empleados en el departamento 'TI' o 'Ventas' ordenados alfabéticamente por nombre.
  `>_`
  ```sh
  sqlite> SELECT * FROM empleados WHERE departamento IN ('TI', 'Ventas') ORDER BY nombre;
    +----+-----------+---------+--------------+
    | id |  nombre   | salario | departamento |
    +----+-----------+---------+--------------+
    | 17 | Alejandro | 71000.0 | TI           |
    | 20 | Beatriz   | 63000.0 | TI           |
    | 3  | Carlos    | 55000.0 | Ventas       |
    | 8  | Carmen    | 65000.0 | TI           |
    | 11 | Diego     | 72000.0 | TI           |
    | 14 | Isabel    | 53000.0 | TI           |
    | 1  | Juan      | 50000.0 | Ventas       |
    | 6  | Laura     | 52000.0 | Ventas       |
    | 2  | María     | 60000.0 | TI           |
    | 9  | Miguel    | 51000.0 | Ventas       |
    | 18 | Natalia   | 54000.0 | Ventas       |
    | 5  | Pedro     | 70000.0 | TI           |
    | 15 | Raúl      | 68000.0 | Ventas       |
    | 12 | Sofía     | 49000.0 | Ventas       |
    +----+-----------+---------+--------------+
  ```
  - Empleados con salarios únicos (eliminando duplicados) en orden ascendente.
  `>_`
  ```sh
  sqlite> SELECT DISTINCT salario FROM empleados ORDER BY salario ASC;
    +---------+
    | salario |
    +---------+
    | 47000.0 |
    | 48000.0 |
    | 49000.0 |
    | 50000.0 |
    | 51000.0 |
    | 52000.0 |
    | 53000.0 |
    | 54000.0 |
    | 55000.0 |
    | 60000.0 |
    | 63000.0 |
    | 65000.0 |
    | 68000.0 |
    | 70000.0 |
    | 71000.0 |
    | 72000.0 |
    +---------+
  ```
  - Empleados cuyos nombres terminan con 'o' o 'a' y están en el departamento 'Ventas'.
  `>_`
  ```sh
  sqlite> SELECT * FROM empleados WHERE nombre REGEXP '[oa]$' AND departamento = 'Ventas';
    +----+---------+---------+--------------+
    | id | nombre  | salario | departamento |
    +----+---------+---------+--------------+
    | 6  | Laura   | 52000.0 | Ventas       |
    | 12 | Sofía   | 49000.0 | Ventas       |
    | 18 | Natalia | 54000.0 | Ventas       |
    +----+---------+---------+--------------+
  ```
  - Empleados con salarios fuera del rango de 55000 a 70000, ordenados por departamento.
  `>_`
  ```sh
  sqlite> SELECT * FROM empleados WHERE salario < 55000 OR salario > 70000 ORDER BY departamento;
    +----+-----------+---------+------------------+
    | id |  nombre   | salario |   departamento   |
    +----+-----------+---------+------------------+
    | 4  | Ana       | 48000.0 | Recursos Humanos |
    | 7  | Javier    | 48000.0 | Recursos Humanos |
    | 16 | Patricia  | 47000.0 | Recursos Humanos |
    | 19 | Roberto   | 49000.0 | Recursos Humanos |
    | 11 | Diego     | 72000.0 | TI               |
    | 14 | Isabel    | 53000.0 | TI               |
    | 17 | Alejandro | 71000.0 | TI               |
    | 1  | Juan      | 50000.0 | Ventas           |
    | 6  | Laura     | 52000.0 | Ventas           |
    | 9  | Miguel    | 51000.0 | Ventas           |
    | 12 | Sofía     | 49000.0 | Ventas           |
    | 18 | Natalia   | 54000.0 | Ventas           |
    +----+-----------+---------+------------------+
  ```
  - Empleados en el departamento 'Recursos Humanos' con nombres que no contienen la letra 'e'.
  `>_`
  ```sh
    sqlite> SELECT * FROM empleados WHERE departamento = 'Recursos Humanos' AND nombre NOT REGEXP 'e';
    +----+----------+---------+------------------+
    | id |  nombre  | salario |   departamento   |
    +----+----------+---------+------------------+
    | 4  | Ana      | 48000.0 | Recursos Humanos |
    | 13 | Andrés   | 60000.0 | Recursos Humanos |
    | 16 | Patricia | 47000.0 | Recursos Humanos |
    +----+----------+---------+------------------+

  ```

</div>

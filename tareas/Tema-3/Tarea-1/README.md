<div align="justify">

# <img src=../../../../../images/computer.png width="40"> Tema 3


creación y manipulación de una base de datos SQLite3 desde la línea de comandos.

## Ejercicio 1


### Paso 1: Crear una tabla con un campo de cada tipo

`>_`

 ```sh
    /////////////////////////
    //SE CREA BASE DE DATOS
    /////////////////////////

    sqlite3 tarea1.db 
    SQLite version 3.49.1 2025-02-18 13:38:58
    Enter ".help" for usage hints.

    ////////////////
    //SE CREA TABLA
    ////////////////

    sqlite> CREATE TABLE Ejemplo (
    id INTEGER PRIMARY KEY,
    texto TEXT,
    entero INTEGER,
    decimal REAL,
    fecha DATE,
    booleano BOOLEAN
    );

    //////////////////////
    //SE GUARDAR Y SALIR//
    sqlite> .exit
```


### Paso 2: Insertar 50 entradas

`>_`

```sh
Last login: Mon Mar 17 09:45:12 on ttys001
➜  ~ sqlite3 tarea1.db
SQLite version 3.49.1 2025-02-18 13:38:58
Enter ".help" for usage hints.
sqlite> INSERT INTO Ejemplo (id, texto, entero, decimal, fecha, booleano) VALUES 
(1, 'Ejemplo1', 25, 10.5, '2022-05-15', 0),
(2, 'Ejemplo2', 63, 45.7, '2022-06-22', 1),
(3, 'Ejemplo3', 12, 30.0, '2022-07-10', 0),
(4, 'Ejemplo4', 78, 75.2, '2022-08-05', 1),
(5, 'Ejemplo5', 42, 18.9, '2022-09-12', 0),
(6, 'Ejemplo6', 55, 60.3, '2022-10-08', 1),
(7, 'Ejemplo7', 38, 65.7, '2022-11-11', 0),
(8, 'Ejemplo8', 49, 11.2, '2022-12-18', 1),
(9, 'Ejemplo9', 24, 67.0, '2022-01-28', 0),
(10, 'Ejemplo10', 51, 20.8, '2022-02-17', 1),
(11, 'Ejemplo11', 77, 26.9, '2022-03-25', 0),
(12, 'Ejemplo12', 28, 27.4, '2022-04-30', 1),
(13, 'Ejemplo13', 88, 24.6, '2022-05-01', 0),
(14, 'Ejemplo14', 44, 84.3, '2022-06-02', 1),
(15, 'Ejemplo15', 35, 33.0, '2022-07-03', 0),
(16, 'Ejemplo16', 25, 95.1, '2022-08-04', 1),
(17, 'Ejemplo17', 57, 68.2, '2022-09-05', 0),
(18, 'Ejemplo18', 17, 33.4, '2022-10-06', 1),
(19, 'Ejemplo19', 15, 75.5, '2022-11-07', 0),
(20, 'Ejemplo20', 84, 44.7, '2022-12-08', 1);
sqlite> .mode table
sqlite> SELECT * FROM Ejemplo;
+----+-----------+--------+---------+------------+----------+
| id |   texto   | entero | decimal |   fecha    | booleano |
+----+-----------+--------+---------+------------+----------+
| 1  | Ejemplo1  | 25     | 10.5    | 2022-05-15 | 0        |
| 2  | Ejemplo2  | 63     | 45.7    | 2022-06-22 | 1        |
| 3  | Ejemplo3  | 12     | 30.0    | 2022-07-10 | 0        |
| 4  | Ejemplo4  | 78     | 75.2    | 2022-08-05 | 1        |
| 5  | Ejemplo5  | 42     | 18.9    | 2022-09-12 | 0        |
| 6  | Ejemplo6  | 55     | 60.3    | 2022-10-08 | 1        |
| 7  | Ejemplo7  | 38     | 65.7    | 2022-11-11 | 0        |
| 8  | Ejemplo8  | 49     | 11.2    | 2022-12-18 | 1        |
| 9  | Ejemplo9  | 24     | 67.0    | 2022-01-28 | 0        |
| 10 | Ejemplo10 | 51     | 20.8    | 2022-02-17 | 1        |
| 11 | Ejemplo11 | 77     | 26.9    | 2022-03-25 | 0        |
| 12 | Ejemplo12 | 28     | 27.4    | 2022-04-30 | 1        |
| 13 | Ejemplo13 | 88     | 24.6    | 2022-05-01 | 0        |
| 14 | Ejemplo14 | 44     | 84.3    | 2022-06-02 | 1        |
| 15 | Ejemplo15 | 35     | 33.0    | 2022-07-03 | 0        |
| 16 | Ejemplo16 | 25     | 95.1    | 2022-08-04 | 1        |
| 17 | Ejemplo17 | 57     | 68.2    | 2022-09-05 | 0        |
| 18 | Ejemplo18 | 17     | 33.4    | 2022-10-06 | 1        |
| 19 | Ejemplo19 | 15     | 75.5    | 2022-11-07 | 0        |
| 20 | Ejemplo20 | 84     | 44.7    | 2022-12-08 | 1        |
+----+-----------+--------+---------+------------+----------+
sqlite> .exit

```


### Paso 3: Realizar 5 consultas de datos

1. Obtén todas las entradas de la tabla `Ejemplo`.

`>_`

```sh
sqlite3 tarea1.db
SQLite version 3.49.1 2025-02-18 13:38:58
Enter ".help" for usage hints.
sqlite> .mode table
sqlite> SELECT * FROM Ejemplo;
+----+-----------+--------+---------+------------+----------+
| id |   texto   | entero | decimal |   fecha    | booleano |
+----+-----------+--------+---------+------------+----------+
| 1  | Ejemplo1  | 25     | 10.5    | 2022-05-15 | 0        |
| 2  | Ejemplo2  | 63     | 45.7    | 2022-06-22 | 1        |
| 3  | Ejemplo3  | 12     | 30.0    | 2022-07-10 | 0        |
| 4  | Ejemplo4  | 78     | 75.2    | 2022-08-05 | 1        |
| 5  | Ejemplo5  | 42     | 18.9    | 2022-09-12 | 0        |
| 6  | Ejemplo6  | 55     | 60.3    | 2022-10-08 | 1        |
| 7  | Ejemplo7  | 38     | 65.7    | 2022-11-11 | 0        |
| 8  | Ejemplo8  | 49     | 11.2    | 2022-12-18 | 1        |
| 9  | Ejemplo9  | 24     | 67.0    | 2022-01-28 | 0        |
| 10 | Ejemplo10 | 51     | 20.8    | 2022-02-17 | 1        |
| 11 | Ejemplo11 | 77     | 26.9    | 2022-03-25 | 0        |
| 12 | Ejemplo12 | 28     | 27.4    | 2022-04-30 | 1        |
| 13 | Ejemplo13 | 88     | 24.6    | 2022-05-01 | 0        |
| 14 | Ejemplo14 | 44     | 84.3    | 2022-06-02 | 1        |
| 15 | Ejemplo15 | 35     | 33.0    | 2022-07-03 | 0        |
| 16 | Ejemplo16 | 25     | 95.1    | 2022-08-04 | 1        |
| 17 | Ejemplo17 | 57     | 68.2    | 2022-09-05 | 0        |
| 18 | Ejemplo18 | 17     | 33.4    | 2022-10-06 | 1        |
| 19 | Ejemplo19 | 15     | 75.5    | 2022-11-07 | 0        |
| 20 | Ejemplo20 | 84     | 44.7    | 2022-12-08 | 1        |
+----+-----------+--------+---------+------------+----------+
```

2. Obtén las entradas con el campo `entero` mayor a 50.

`>_`

```sh
sqlite> SELECT * FROM Ejemplo WHERE entero > 50;
+----+-----------+--------+---------+------------+----------+
| id |   texto   | entero | decimal |   fecha    | booleano |
+----+-----------+--------+---------+------------+----------+
| 2  | Ejemplo2  | 63     | 45.7    | 2022-06-22 | 1        |
| 4  | Ejemplo4  | 78     | 75.2    | 2022-08-05 | 1        |
| 6  | Ejemplo6  | 55     | 60.3    | 2022-10-08 | 1        |
| 10 | Ejemplo10 | 51     | 20.8    | 2022-02-17 | 1        |
| 11 | Ejemplo11 | 77     | 26.9    | 2022-03-25 | 0        |
| 13 | Ejemplo13 | 88     | 24.6    | 2022-05-01 | 0        |
| 17 | Ejemplo17 | 57     | 68.2    | 2022-09-05 | 0        |
| 20 | Ejemplo20 | 84     | 44.7    | 2022-12-08 | 1        |
+----+-----------+--------+---------+------------+----------+
sqlite> 

```


### Paso 4: Realizar 3 eliminaciones y 3 modificaciones

1. Elimina las entradas donde el campo `booleano` es igual a `True`.

`>_`

```sh
sqlite> DELETE FROM Ejemplo WHERE booleano = 1;
sqlite> SELECT * FROM Ejemplo;
+----+-----------+--------+---------+------------+----------+
| id |   texto   | entero | decimal |   fecha    | booleano |
+----+-----------+--------+---------+------------+----------+
| 1  | Ejemplo1  | 25     | 10.5    | 2022-05-15 | 0        |
| 3  | Ejemplo3  | 12     | 30.0    | 2022-07-10 | 0        |
| 5  | Ejemplo5  | 42     | 18.9    | 2022-09-12 | 0        |
| 7  | Ejemplo7  | 38     | 65.7    | 2022-11-11 | 0        |
| 9  | Ejemplo9  | 24     | 67.0    | 2022-01-28 | 0        |
| 11 | Ejemplo11 | 77     | 26.9    | 2022-03-25 | 0        |
| 13 | Ejemplo13 | 88     | 24.6    | 2022-05-01 | 0        |
| 15 | Ejemplo15 | 35     | 33.0    | 2022-07-03 | 0        |
| 17 | Ejemplo17 | 57     | 68.2    | 2022-09-05 | 0        |
| 19 | Ejemplo19 | 15     | 75.5    | 2022-11-07 | 0        |
+----+-----------+--------+---------+------------+----------+
sqlite> 

```

1. Modifica el campo `texto` de las entradas donde el campo `entero` es menor a 30 y establece el texto como "Modificado".

`>_`

```sh
sqlite> UPDATE Ejemplo SET texto = 'Modificado' WHERE entero < 30;
sqlite> SELECT * FROM Ejemplo;
+----+------------+--------+---------+------------+----------+
| id |   texto    | entero | decimal |   fecha    | booleano |
+----+------------+--------+---------+------------+----------+
| 1  | Modificado | 25     | 10.5    | 2022-05-15 | 0        |
| 3  | Modificado | 12     | 30.0    | 2022-07-10 | 0        |
| 5  | Ejemplo5   | 42     | 18.9    | 2022-09-12 | 0        |
| 7  | Ejemplo7   | 38     | 65.7    | 2022-11-11 | 0        |
| 9  | Modificado | 24     | 67.0    | 2022-01-28 | 0        |
| 11 | Ejemplo11  | 77     | 26.9    | 2022-03-25 | 0        |
| 13 | Ejemplo13  | 88     | 24.6    | 2022-05-01 | 0        |
| 15 | Ejemplo15  | 35     | 33.0    | 2022-07-03 | 0        |
| 17 | Ejemplo17  | 57     | 68.2    | 2022-09-05 | 0        |
| 19 | Modificado | 15     | 75.5    | 2022-11-07 | 0        |
+----+------------+--------+---------+------------+----------+
sqlite> 

```

2. Elimina las entradas donde el campo `entero` es igual a 50.

>__Nota__: Como no tengo ningun entero con el valor 50, proceso a actualizar el registro 9 para luego eliminarlo con la condición entero = 50;

`>_`

```sh
sqlite> UPDATE Ejemplo SET entero = 50 WHERE entero = 24;
DELETE FROM Ejemplo WHERE entero = 50;
sqlite> SELECT * FROM Ejemplo;
+----+------------+--------+---------+------------+----------+
| id |   texto    | entero | decimal |   fecha    | booleano |
+----+------------+--------+---------+------------+----------+
| 1  | Modificado | 25     | 10.5    | 2022-05-15 | 0        |
| 3  | Modificado | 12     | 30.0    | 2022-07-10 | 0        |
| 5  | Ejemplo5   | 42     | 18.9    | 2022-09-12 | 0        |
| 7  | Ejemplo7   | 38     | 65.7    | 2022-11-11 | 0        |
| 11 | Ejemplo11  | 77     | 26.9    | 2022-03-25 | 0        |
| 13 | Ejemplo13  | 88     | 24.6    | 2022-05-01 | 0        |
| 15 | Ejemplo15  | 35     | 33.0    | 2022-07-03 | 0        |
| 17 | Ejemplo17  | 57     | 68.2    | 2022-09-05 | 0        |
| 19 | Modificado | 15     | 75.5    | 2022-11-07 | 0        |
+----+------------+--------+---------+------------+----------+

```

3. Incrementa en 10 el valor del campo `entero` para las entradas donde el campo `booleano` es igual a `False`.

`>_`
```sh
sqlite> UPDATE Ejemplo SET entero = entero + 10 WHERE booleano = 0;
sqlite> SELECT * FROM Ejemplo;
+----+------------+--------+---------+------------+----------+
| id |   texto    | entero | decimal |   fecha    | booleano |
+----+------------+--------+---------+------------+----------+
| 1  | Modificado | 35     | 10.5    | 2022-05-15 | 0        |
| 3  | Modificado | 22     | 30.0    | 2022-07-10 | 0        |
| 5  | Ejemplo5   | 52     | 18.9    | 2022-09-12 | 0        |
| 7  | Ejemplo7   | 48     | 65.7    | 2022-11-11 | 0        |
| 11 | Ejemplo11  | 87     | 26.9    | 2022-03-25 | 0        |
| 13 | Ejemplo13  | 98     | 24.6    | 2022-05-01 | 0        |
| 15 | Ejemplo15  | 45     | 33.0    | 2022-07-03 | 0        |
| 17 | Ejemplo17  | 67     | 68.2    | 2022-09-05 | 0        |
| 19 | Modificado | 25     | 75.5    | 2022-11-07 | 0        |
+----+------------+--------+---------+------------+----------+
sqlite> 

```


4. Elimina las entradas donde el campo `decimal` es menor a 50.

`>_`
```sh
sqlite> DELETE FROM Ejemplo WHERE decimal < 50;
sqlite> SELECT * FROM Ejemplo;
+----+------------+--------+---------+------------+----------+
| id |   texto    | entero | decimal |   fecha    | booleano |
+----+------------+--------+---------+------------+----------+
| 7  | Ejemplo7   | 48     | 65.7    | 2022-11-11 | 0        |
| 17 | Ejemplo17  | 67     | 68.2    | 2022-09-05 | 0        |
| 19 | Modificado | 25     | 75.5    | 2022-11-07 | 0        |
+----+------------+--------+---------+------------+----------+
sqlite> 
```

5. Actualiza el campo `fecha` de todas las entradas a la fecha actual.


`>_`
```sh
sqlite> UPDATE Ejemplo SET fecha = DATE('now');
sqlite> SELECT * FROM Ejemplo;
+----+------------+--------+---------+------------+----------+
| id |   texto    | entero | decimal |   fecha    | booleano |
+----+------------+--------+---------+------------+----------+
| 7  | Ejemplo7   | 48     | 65.7    | 2025-03-17 | 0        |
| 17 | Ejemplo17  | 67     | 68.2    | 2025-03-17 | 0        |
| 19 | Modificado | 25     | 75.5    | 2025-03-17 | 0        |
+----+------------+--------+---------+------------+----------+
sqlite> 

```


</div>
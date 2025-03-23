<div align="justify">

# `>_` Tema 3

creación y manipulación de una base de datos SQLite3 desde la línea de comandos_.

> NOTA IMPORTANTE: PROFESOR SQLITE POR LO MENOS EN MI ORDENADO NO FUNCIONAN LAS EXPRESIONES REGULARES COMO DEBERIA FUNCIONAR, SOLO FUNCIONAN LAS QUE NO SON COMPLEJAS, ALGO PASA CON SQLITE

## Ejercicio 5

### Paso 0: Creación de la BBDD

```sh
sqlite3 base-datos-libros.db
SQLite version 3.49.1 2025-02-18 13:38:58
Enter ".help" for usage hints.
sqlite> CREATE TABLE IF NOT EXISTS libro (
    codigo INTEGER PRIMARY KEY,
    titulo TEXT,
    autor_id INTEGER,
    editorial TEXT,
    precio REAL,
    FOREIGN KEY (autor_id) REFERENCES autor(id)
);
sqlite> CREATE TABLE IF NOT EXISTS autor (
    id INTEGER PRIMARY KEY,
    nombre TEXT
);
sqlite> INSERT INTO autor (nombre) VALUES
    ('J.K. Rowling'),
    ('Stephen King'),
    ('George Orwell'),
    ('Jane Austen'),
    ('Agatha Christie');

INSERT INTO libro (titulo, autor_id, editorial, precio) VALUES
    ('The Great Gatsby', 6, 'Charles Scribner''s Sons', 20.99),
    ('To Kill a Mockingbird', 7, 'J.B. Lippincott & Co.', 15.95),
    ('The Catcher in the Rye', 8, 'Little, Brown and Company', 18.75),
    ('One Hundred Years of Solitude', 9, 'Harper & Row', 22.50),
    ('Brave New World', 3, 'Chatto & Windus', 17.99),
    ('The Hobbit', 10, 'George Allen & Unwin', 24.99),
    ('The Lord of the Rings', 10, 'George Allen & Unwin', 35.50),
    ('The Chronicles of Narnia', 11, 'Geoffrey Bles', 28.99),
    ('The Odyssey', 12, 'Homer', 14.95),
    ('The Iliad', 12, 'Homer', 14.95),
    ('Moby-Dick', 13, 'Harper & Brothers', 19.99),
    ('The Road', 14, 'Alfred A. Knopf', 16.75),
    ('The Grapes of Wrath', 15, 'The Viking Press', 21.50),
    ('Wuthering Heights', 16, 'Emily Brontë', 12.99),
    ('The Old Man and the Sea', 17, 'Charles Scribner''s Sons', 18.95),
    ('The Count of Monte Cristo', 18, 'Pétion', 27.99),
    ('The Picture of Dorian Gray', 19, 'Ward, Lock, and Company', 14.50),
    ('The Adventures of Sherlock Holmes', 20, 'George Newnes', 16.99),
    ('Frankenstein', 21, 'Lackington, Hughes, Harding, Mavor, & Jones', 13.25),
    ('Alice''s Adventures in Wonderland', 22, 'Macmillan', 11.50),
    ('The Prince', 23, 'Niccolò Machiavelli', 10.99),
    ('Don Quixote', 24, 'Francisco de Robles', 26.75),
    ('The Divine Comedy', 25, 'Dante Alighieri', 20.50),
    ('Anna Karenina', 26, 'The Russian Messenger', 23.99),
    ('Les Misérables', 27, 'A. Lacroix, Verboeckhoven & Cie.', 29.75),
    ('The Jungle Book', 28, 'Macmillan Publishers', 14.99),
    ('The Wind in the Willows', 29, 'Methuen & Co.', 17.50),
    ('War and Peace', 26, 'The Russian Messenger', 33.25),
    ('Crime and Punishment', 30, 'The Russian Messenger', 19.99);
sqlite> .mode table
sqlite> SELECT * FROM autor;
+----+-----------------+
| id |     nombre      |
+----+-----------------+
| 1  | J.K. Rowling    |
| 2  | Stephen King    |
| 3  | George Orwell   |
| 4  | Jane Austen     |
| 5  | Agatha Christie |
+----+-----------------+
sqlite> SELECT * FROM libro;
+--------+-----------------------------------+----------+---------------------------------------------+--------+
| codigo |              titulo               | autor_id |                  editorial                  | precio |
+--------+-----------------------------------+----------+---------------------------------------------+--------+
| 1      | The Great Gatsby                  | 6        | Charles Scribner's Sons                     | 20.99  |
| 2      | To Kill a Mockingbird             | 7        | J.B. Lippincott & Co.                       | 15.95  |
| 3      | The Catcher in the Rye            | 8        | Little, Brown and Company                   | 18.75  |
| 4      | One Hundred Years of Solitude     | 9        | Harper & Row                                | 22.5   |
| 5      | Brave New World                   | 3        | Chatto & Windus                             | 17.99  |
| 6      | The Hobbit                        | 10       | George Allen & Unwin                        | 24.99  |
| 7      | The Lord of the Rings             | 10       | George Allen & Unwin                        | 35.5   |
| 8      | The Chronicles of Narnia          | 11       | Geoffrey Bles                               | 28.99  |
| 9      | The Odyssey                       | 12       | Homer                                       | 14.95  |
| 10     | The Iliad                         | 12       | Homer                                       | 14.95  |
| 11     | Moby-Dick                         | 13       | Harper & Brothers                           | 19.99  |
| 12     | The Road                          | 14       | Alfred A. Knopf                             | 16.75  |
| 13     | The Grapes of Wrath               | 15       | The Viking Press                            | 21.5   |
| 14     | Wuthering Heights                 | 16       | Emily Brontë                                | 12.99  |
| 15     | The Old Man and the Sea           | 17       | Charles Scribner's Sons                     | 18.95  |
| 16     | The Count of Monte Cristo         | 18       | Pétion                                      | 27.99  |
| 17     | The Picture of Dorian Gray        | 19       | Ward, Lock, and Company                     | 14.5   |
| 18     | The Adventures of Sherlock Holmes | 20       | George Newnes                               | 16.99  |
| 19     | Frankenstein                      | 21       | Lackington, Hughes, Harding, Mavor, & Jones | 13.25  |
| 20     | Alice's Adventures in Wonderland  | 22       | Macmillan                                   | 11.5   |
| 21     | The Prince                        | 23       | Niccolò Machiavelli                         | 10.99  |
| 22     | Don Quixote                       | 24       | Francisco de Robles                         | 26.75  |
| 23     | The Divine Comedy                 | 25       | Dante Alighieri                             | 20.5   |
| 24     | Anna Karenina                     | 26       | The Russian Messenger                       | 23.99  |
| 25     | Les Misérables                    | 27       | A. Lacroix, Verboeckhoven & Cie.            | 29.75  |
| 26     | The Jungle Book                   | 28       | Macmillan Publishers                        | 14.99  |
| 27     | The Wind in the Willows           | 29       | Methuen & Co.                               | 17.5   |
| 28     | War and Peace                     | 26       | The Russian Messenger                       | 33.25  |
| 29     | Crime and Punishment              | 30       | The Russian Messenger                       | 19.99  |
+--------+-----------------------------------+----------+---------------------------------------------+--------+
sqlite> .output supermercado-dump.sql
sqlite> .dump
sqlite> .exit

sqlite3 tarea5.db
SQLite version 3.49.1 2025-02-18 13:38:58
Enter ".help" for usage hints.
sqlite> .read base-datos-libros.sql
sqlite> .exit

```
  
### Paso 1 Selección de libros cuyo título comienza con "H".

> NINGUN LIBRO CUMPLE ESTA CONDICION POR ESO NO SE DEVUELVE NADA
```sh
    sqlite> SELECT * FROM libro WHERE titulo REGEXP '^H';
    sqlite> 

```


### Libros escritos por autores cuyos nombres terminan con "ing".

> LOS AUTORES CON NOMBRES QUE TERMINAN EN "ing" NO TIENEN LIBROS ESCRITOS REGISTRADOS EN LA BASE DE DATOS

```sh
    sqlite> SELECT l.titulo, a.nombre
    FROM libro l
    JOIN autor a ON l.autor_id = a.id
    WHERE a.nombre REGEXP 'ing$';
    sqlite> 
```

### Libros con títulos que contienen la palabra "and" en cualquier posición.
```sh
    sqlite> SELECT * FROM libro WHERE titulo REGEXP 'and';
    +--------+----------------------------------+----------+-------------------------+--------+
    | codigo |              titulo              | autor_id |        editorial        | precio |
    +--------+----------------------------------+----------+-------------------------+--------+
    | 15     | The Old Man and the Sea          | 17       | Charles Scribner's Sons | 18.95  |
    | 20     | Alice's Adventures in Wonderland | 22       | Macmillan               | 11.5   |
    | 28     | War and Peace                    | 26       | The Russian Messenger   | 33.25  |
    | 29     | Crime and Punishment             | 30       | The Russian Messenger   | 19.99  |
    +--------+----------------------------------+----------+-------------------------+--------+

```
### Libros cuyo título comienza con una vocal.
```sh
    sqlite> SELECT * FROM libro WHERE titulo REGEXP '^[AEIOUaeiou]';
    +--------+----------------------------------+----------+-----------------------+--------+
    | codigo |              titulo              | autor_id |       editorial       | precio |
    +--------+----------------------------------+----------+-----------------------+--------+
    | 4      | One Hundred Years of Solitude    | 9        | Harper & Row          | 22.5   |
    | 20     | Alice's Adventures in Wonderland | 22       | Macmillan             | 11.5   |
    | 24     | Anna Karenina                    | 26       | The Russian Messenger | 23.99  |
    +--------+----------------------------------+----------+-----------------------+--------+
    sqlite> 

```

### Libros cuyo autor tiene al menos una vocal repetida.
```sh
sqlite> SELECT libro.titulo, autor.nombre 
FROM libro 
JOIN autor ON libro.autor_id = autor.id 
WHERE autor.nombre REGEXP '.*a.*a.*|.*e.*e.*|.*i.*i.*|.*o.*o.*|.*u.*u.*';
+-----------------+---------------+
|     titulo      |    nombre     |
+-----------------+---------------+
| Brave New World | George Orwell |
+-----------------+---------------+
sqlite> 
```
### Libros con precios que tienen dos dígitos decimales exactos.

```sh
sqlite> SELECT libro.titulo, libro.precio
FROM libro
WHERE CAST(precio AS TEXT) = printf('%.2f', precio);
+-----------------------------------+--------+
|              titulo               | precio |
+-----------------------------------+--------+
| The Great Gatsby                  | 20.99  |
| To Kill a Mockingbird             | 15.95  |
| The Catcher in the Rye            | 18.75  |
| Brave New World                   | 17.99  |
| The Hobbit                        | 24.99  |
| The Chronicles of Narnia          | 28.99  |
| The Odyssey                       | 14.95  |
| The Iliad                         | 14.95  |
| Moby-Dick                         | 19.99  |
| The Road                          | 16.75  |
| Wuthering Heights                 | 12.99  |
| The Old Man and the Sea           | 18.95  |
| The Count of Monte Cristo         | 27.99  |
| The Adventures of Sherlock Holmes | 16.99  |
| Frankenstein                      | 13.25  |
| The Prince                        | 10.99  |
| Don Quixote                       | 26.75  |
| Anna Karenina                     | 23.99  |
| Les Misérables                    | 29.75  |
| The Jungle Book                   | 14.99  |
| War and Peace                     | 33.25  |
| Crime and Punishment              | 19.99  |
+-----------------------------------+--------+
sqlite> 

```

### Libros cuyos títulos tienen al menos tres palabras.
```sh
sqlite> SELECT titulo
FROM libro
WHERE titulo REGEXP '^(\S+\s+){2}\S+';
+-----------------------------------+
|              titulo               |
+-----------------------------------+
| The Great Gatsby                  |
| To Kill a Mockingbird             |
| The Catcher in the Rye            |
| One Hundred Years of Solitude     |
| Brave New World                   |
| The Lord of the Rings             |
| The Chronicles of Narnia          |
| The Grapes of Wrath               |
| The Old Man and the Sea           |
| The Count of Monte Cristo         |
| The Picture of Dorian Gray        |
| The Adventures of Sherlock Holmes |
| Alice's Adventures in Wonderland  |
| The Divine Comedy                 |
| The Jungle Book                   |
| The Wind in the Willows           |
| War and Peace                     |
| Crime and Punishment              |
+-----------------------------------+
sqlite> 

```
### Obtener todos los autores cuyo nombre empieza con la letra "A":
```sh
sqlite> SELECT *
FROM autor
WHERE nombre REGEXP '^A';
+----+-----------------+
| id |     nombre      |
+----+-----------------+
| 5  | Agatha Christie |
+----+-----------------+
sqlite> 

```
### Seleccionar los libros cuyo título contiene la palabra "SQL":
> NINGUN LIBRO CUMPLE ESTA CONDICION POR ESO NO SE DEVUELVE NADA
```sh
sqlite> SELECT *
FROM libro
WHERE titulo REGEXP '(^|\\s)SQL(\\s|$)';
sqlite> 

```
### Obtener todos los autores cuyo nombre termina con "ez":
> NINGUN AUTOR CUMPLE ESTA CONDICION POR ESO NO SE DEVUELVE NADA
```sh
sqlite> SELECT *
FROM autor
WHERE nombre REGEXP 'ez$';
sqlite> 
```
### Obtener todos los autores cuyo nombre tiene al menos 5 caracteres:
```sh
sqlite> SELECT *
FROM autor
WHERE nombre REGEXP '^.{5,}$';
+----+-----------------+
| id |     nombre      |
+----+-----------------+
| 1  | J.K. Rowling    |
| 2  | Stephen King    |
| 3  | George Orwell   |
| 4  | Jane Austen     |
| 5  | Agatha Christie |
+----+-----------------+
sqlite> 

```
### Seleccionar los libros cuya editorial es diferente de "EditorialX":
```sh
sqlite> SELECT *
FROM libro
WHERE editorial <> 'EditorialX';
+--------+-----------------------------------+----------+---------------------------------------------+--------+
| codigo |              titulo               | autor_id |                  editorial                  | precio |
+--------+-----------------------------------+----------+---------------------------------------------+--------+
| 1      | The Great Gatsby                  | 6        | Charles Scribner's Sons                     | 20.99  |
| 2      | To Kill a Mockingbird             | 7        | J.B. Lippincott & Co.                       | 15.95  |
| 3      | The Catcher in the Rye            | 8        | Little, Brown and Company                   | 18.75  |
| 4      | One Hundred Years of Solitude     | 9        | Harper & Row                                | 22.5   |
| 5      | Brave New World                   | 3        | Chatto & Windus                             | 17.99  |
| 6      | The Hobbit                        | 10       | George Allen & Unwin                        | 24.99  |
| 7      | The Lord of the Rings             | 10       | George Allen & Unwin                        | 35.5   |
| 8      | The Chronicles of Narnia          | 11       | Geoffrey Bles                               | 28.99  |
| 9      | The Odyssey                       | 12       | Homer                                       | 14.95  |
| 10     | The Iliad                         | 12       | Homer                                       | 14.95  |
| 11     | Moby-Dick                         | 13       | Harper & Brothers                           | 19.99  |
| 12     | The Road                          | 14       | Alfred A. Knopf                             | 16.75  |
| 13     | The Grapes of Wrath               | 15       | The Viking Press                            | 21.5   |
| 14     | Wuthering Heights                 | 16       | Emily Brontë                                | 12.99  |
| 15     | The Old Man and the Sea           | 17       | Charles Scribner's Sons                     | 18.95  |
| 16     | The Count of Monte Cristo         | 18       | Pétion                                      | 27.99  |
| 17     | The Picture of Dorian Gray        | 19       | Ward, Lock, and Company                     | 14.5   |
| 18     | The Adventures of Sherlock Holmes | 20       | George Newnes                               | 16.99  |
| 19     | Frankenstein                      | 21       | Lackington, Hughes, Harding, Mavor, & Jones | 13.25  |
| 20     | Alice's Adventures in Wonderland  | 22       | Macmillan                                   | 11.5   |
| 21     | The Prince                        | 23       | Niccolò Machiavelli                         | 10.99  |
| 22     | Don Quixote                       | 24       | Francisco de Robles                         | 26.75  |
| 23     | The Divine Comedy                 | 25       | Dante Alighieri                             | 20.5   |
| 24     | Anna Karenina                     | 26       | The Russian Messenger                       | 23.99  |
| 25     | Les Misérables                    | 27       | A. Lacroix, Verboeckhoven & Cie.            | 29.75  |
| 26     | The Jungle Book                   | 28       | Macmillan Publishers                        | 14.99  |
| 27     | The Wind in the Willows           | 29       | Methuen & Co.                               | 17.5   |
| 28     | War and Peace                     | 26       | The Russian Messenger                       | 33.25  |
| 29     | Crime and Punishment              | 30       | The Russian Messenger                       | 19.99  |
+--------+-----------------------------------+----------+---------------------------------------------+--------+
sqlite> 

```
### Obtener todos los autores cuyo nombre contiene al menos una vocal:
```sh
sqlite> SELECT *
FROM autor
WHERE nombre REGEXP '[aeiouAEIOU]';
+----+-----------------+
| id |     nombre      |
+----+-----------------+
| 1  | J.K. Rowling    |
| 2  | Stephen King    |
| 3  | George Orwell   |
| 4  | Jane Austen     |
| 5  | Agatha Christie |
+----+-----------------+
sqlite> 
```
### Seleccionar los libros cuyo título comienza con una letra mayúscula:
```sh
sqlite> SELECT *
FROM libro
WHERE titulo REGEXP '^[A-Z]';
+--------+-----------------------------------+----------+---------------------------------------------+--------+
| codigo |              titulo               | autor_id |                  editorial                  | precio |
+--------+-----------------------------------+----------+---------------------------------------------+--------+
| 1      | The Great Gatsby                  | 6        | Charles Scribner's Sons                     | 20.99  |
| 2      | To Kill a Mockingbird             | 7        | J.B. Lippincott & Co.                       | 15.95  |
| 3      | The Catcher in the Rye            | 8        | Little, Brown and Company                   | 18.75  |
| 4      | One Hundred Years of Solitude     | 9        | Harper & Row                                | 22.5   |
| 5      | Brave New World                   | 3        | Chatto & Windus                             | 17.99  |
| 6      | The Hobbit                        | 10       | George Allen & Unwin                        | 24.99  |
| 7      | The Lord of the Rings             | 10       | George Allen & Unwin                        | 35.5   |
| 8      | The Chronicles of Narnia          | 11       | Geoffrey Bles                               | 28.99  |
| 9      | The Odyssey                       | 12       | Homer                                       | 14.95  |
| 10     | The Iliad                         | 12       | Homer                                       | 14.95  |
| 11     | Moby-Dick                         | 13       | Harper & Brothers                           | 19.99  |
| 12     | The Road                          | 14       | Alfred A. Knopf                             | 16.75  |
| 13     | The Grapes of Wrath               | 15       | The Viking Press                            | 21.5   |
| 14     | Wuthering Heights                 | 16       | Emily Brontë                                | 12.99  |
| 15     | The Old Man and the Sea           | 17       | Charles Scribner's Sons                     | 18.95  |
| 16     | The Count of Monte Cristo         | 18       | Pétion                                      | 27.99  |
| 17     | The Picture of Dorian Gray        | 19       | Ward, Lock, and Company                     | 14.5   |
| 18     | The Adventures of Sherlock Holmes | 20       | George Newnes                               | 16.99  |
| 19     | Frankenstein                      | 21       | Lackington, Hughes, Harding, Mavor, & Jones | 13.25  |
| 20     | Alice's Adventures in Wonderland  | 22       | Macmillan                                   | 11.5   |
| 21     | The Prince                        | 23       | Niccolò Machiavelli                         | 10.99  |
| 22     | Don Quixote                       | 24       | Francisco de Robles                         | 26.75  |
| 23     | The Divine Comedy                 | 25       | Dante Alighieri                             | 20.5   |
| 24     | Anna Karenina                     | 26       | The Russian Messenger                       | 23.99  |
| 25     | Les Misérables                    | 27       | A. Lacroix, Verboeckhoven & Cie.            | 29.75  |
| 26     | The Jungle Book                   | 28       | Macmillan Publishers                        | 14.99  |
| 27     | The Wind in the Willows           | 29       | Methuen & Co.                               | 17.5   |
| 28     | War and Peace                     | 26       | The Russian Messenger                       | 33.25  |
| 29     | Crime and Punishment              | 30       | The Russian Messenger                       | 19.99  |
+--------+-----------------------------------+----------+---------------------------------------------+--------+
sqlite> 

```
### Obtener todos los autores cuyo nombre no contiene la letra "r":
```sh
sqlite> SELECT *
FROM autor
WHERE nombre NOT REGEXP '[rR]';
+----+--------------+
| id |    nombre    |
+----+--------------+
| 2  | Stephen King |
| 4  | Jane Austen  |
+----+--------------+
sqlite> 

```
### Seleccionar los libros cuya editorial empieza con la letra "P":
```sh
sqlite> SELECT * FROM libro WHERE editorial REGEXP '^[pP]';
+--------+---------------------------+----------+-----------+--------+
| codigo |          titulo           | autor_id | editorial | precio |
+--------+---------------------------+----------+-----------+--------+
| 16     | The Count of Monte Cristo | 18       | Pétion    | 27.99  |
+--------+---------------------------+----------+-----------+--------+
sqlite> 
```
### Obtener todos los autores cuyo nombre tiene exactamente 6 caracteres:
> NINGUN AUTOR CUMPLE ESTA CONDICION YA QUE NOMBRE Y APELLIDO NO ESTAN SEPARADOS EN CAMBIOS INDEPENDIENTES POR ESO NO SE DEVUELVE NADA
```sh
sqlite> SELECT *
FROM autor
WHERE nombre REGEXP '^.{6}$';
sqlite> 
```
### Seleccionar los libros cuyo título contiene al menos un número:
> NINGUN LIBRO CUMPLE ESTA CONDICION POR ESO NO SE DEVUELVE NADA
```sh
sqlite> SELECT * FROM libro WHERE titulo REGEXP '[0-9]';
sqlite> 

```
### Obtener todos los autores cuyo nombre inicia con una vocal:
```sh
sqlite> SELECT * FROM autor WHERE nombre REGEXP '^[aeiouAEIOU]';
+----+-----------------+
| id |     nombre      |
+----+-----------------+
| 5  | Agatha Christie |
+----+-----------------+
sqlite> 
```
### Obtener todos los autores cuyo nombre no contiene espacios en blanco:
> NINGUN AUTOR CUMPLE ESTA CONDICION POR ESO NO SE DEVUELVE NADA
```sh
sqlite> SELECT * FROM autor WHERE nombre NOT REGEXP ' ';
```
### Seleccionar los libros cuyo título termina con una vocal:
```sh
sqlite> SELECT * FROM libro WHERE titulo REGEXP '[aeiouAEIOU]$';
+--------+-------------------------------+----------+---------------------------+--------+
| codigo |            titulo             | autor_id |         editorial         | precio |
+--------+-------------------------------+----------+---------------------------+--------+
| 3      | The Catcher in the Rye        | 8        | Little, Brown and Company | 18.75  |
| 4      | One Hundred Years of Solitude | 9        | Harper & Row              | 22.5   |
| 8      | The Chronicles of Narnia      | 11       | Geoffrey Bles             | 28.99  |
| 15     | The Old Man and the Sea       | 17       | Charles Scribner's Sons   | 18.95  |
| 16     | The Count of Monte Cristo     | 18       | Pétion                    | 27.99  |
| 21     | The Prince                    | 23       | Niccolò Machiavelli       | 10.99  |
| 22     | Don Quixote                   | 24       | Francisco de Robles       | 26.75  |
| 24     | Anna Karenina                 | 26       | The Russian Messenger     | 23.99  |
| 28     | War and Peace                 | 26       | The Russian Messenger     | 33.25  |
+--------+-------------------------------+----------+---------------------------+--------+
sqlite> 
```
### Obtener todos los autores cuyo nombre contiene la secuencia "er":
> NINGUN AUTOR CUMPLE ESTA CONDICION POR ESO NO SE DEVUELVE NADA
```sh
SELECT *
FROM autor
WHERE nombre REGEXP 'er';

```
### Seleccionar los libros cuyo título empieza con la palabra "The":
```sh
sqlite> SELECT * FROM libro WHERE titulo REGEXP 'The';
+--------+-----------------------------------+----------+---------------------------+--------+
| codigo |              titulo               | autor_id |         editorial         | precio |
+--------+-----------------------------------+----------+---------------------------+--------+
| 1      | The Great Gatsby                  | 6        | Charles Scribner's Sons   | 20.99  |
| 3      | The Catcher in the Rye            | 8        | Little, Brown and Company | 18.75  |
| 6      | The Hobbit                        | 10       | George Allen & Unwin      | 24.99  |
| 7      | The Lord of the Rings             | 10       | George Allen & Unwin      | 35.5   |
| 8      | The Chronicles of Narnia          | 11       | Geoffrey Bles             | 28.99  |
| 9      | The Odyssey                       | 12       | Homer                     | 14.95  |
| 10     | The Iliad                         | 12       | Homer                     | 14.95  |
| 12     | The Road                          | 14       | Alfred A. Knopf           | 16.75  |
| 13     | The Grapes of Wrath               | 15       | The Viking Press          | 21.5   |
| 15     | The Old Man and the Sea           | 17       | Charles Scribner's Sons   | 18.95  |
| 16     | The Count of Monte Cristo         | 18       | Pétion                    | 27.99  |
| 17     | The Picture of Dorian Gray        | 19       | Ward, Lock, and Company   | 14.5   |
| 18     | The Adventures of Sherlock Holmes | 20       | George Newnes             | 16.99  |
| 21     | The Prince                        | 23       | Niccolò Machiavelli       | 10.99  |
| 23     | The Divine Comedy                 | 25       | Dante Alighieri           | 20.5   |
| 26     | The Jungle Book                   | 28       | Macmillan Publishers      | 14.99  |
| 27     | The Wind in the Willows           | 29       | Methuen & Co.             | 17.5   |
+--------+-----------------------------------+----------+---------------------------+--------+
sqlite> 
```
### Obtener todos los autores cuyo nombre tiene al menos una letra mayúscula:
```sh
sqlite> SELECT * FROM autor WHERE nombre REGEXP '[A-Z]';
+----+-----------------+
| id |     nombre      |
+----+-----------------+
| 1  | J.K. Rowling    |
| 2  | Stephen King    |
| 3  | George Orwell   |
| 4  | Jane Austen     |
| 5  | Agatha Christie |
+----+-----------------+
sqlite> 
```
### Seleccionar los libros cuyo precio es un número decimal con exactamente dos decimales:
```sh
sqlite> SELECT *
FROM libro
WHERE CAST(precio AS TEXT) = printf('%.2f', precio);
+--------+-----------------------------------+----------+---------------------------------------------+--------+
| codigo |              titulo               | autor_id |                  editorial                  | precio |
+--------+-----------------------------------+----------+---------------------------------------------+--------+
| 1      | The Great Gatsby                  | 6        | Charles Scribner's Sons                     | 20.99  |
| 2      | To Kill a Mockingbird             | 7        | J.B. Lippincott & Co.                       | 15.95  |
| 3      | The Catcher in the Rye            | 8        | Little, Brown and Company                   | 18.75  |
| 5      | Brave New World                   | 3        | Chatto & Windus                             | 17.99  |
| 6      | The Hobbit                        | 10       | George Allen & Unwin                        | 24.99  |
| 8      | The Chronicles of Narnia          | 11       | Geoffrey Bles                               | 28.99  |
| 9      | The Odyssey                       | 12       | Homer                                       | 14.95  |
| 10     | The Iliad                         | 12       | Homer                                       | 14.95  |
| 11     | Moby-Dick                         | 13       | Harper & Brothers                           | 19.99  |
| 12     | The Road                          | 14       | Alfred A. Knopf                             | 16.75  |
| 14     | Wuthering Heights                 | 16       | Emily Brontë                                | 12.99  |
| 15     | The Old Man and the Sea           | 17       | Charles Scribner's Sons                     | 18.95  |
| 16     | The Count of Monte Cristo         | 18       | Pétion                                      | 27.99  |
| 18     | The Adventures of Sherlock Holmes | 20       | George Newnes                               | 16.99  |
| 19     | Frankenstein                      | 21       | Lackington, Hughes, Harding, Mavor, & Jones | 13.25  |
| 21     | The Prince                        | 23       | Niccolò Machiavelli                         | 10.99  |
| 22     | Don Quixote                       | 24       | Francisco de Robles                         | 26.75  |
| 24     | Anna Karenina                     | 26       | The Russian Messenger                       | 23.99  |
| 25     | Les Misérables                    | 27       | A. Lacroix, Verboeckhoven & Cie.            | 29.75  |
| 26     | The Jungle Book                   | 28       | Macmillan Publishers                        | 14.99  |
| 28     | War and Peace                     | 26       | The Russian Messenger                       | 33.25  |
| 29     | Crime and Punishment              | 30       | The Russian Messenger                       | 19.99  |
+--------+-----------------------------------+----------+---------------------------------------------+--------+
sqlite> 
```
### Obtener todos los autores cuyo nombre no contiene números:
```sh
sqlite> SELECT *
FROM autor
WHERE nombre NOT REGEXP '[0-9]';
+----+-----------------+
| id |     nombre      |
+----+-----------------+
| 1  | J.K. Rowling    |
| 2  | Stephen King    |
| 3  | George Orwell   |
| 4  | Jane Austen     |
| 5  | Agatha Christie |
+----+-----------------+
sqlite> 
```
### Seleccionar los libros cuyo título contiene al menos tres vocales:
```sh
sqlite> SELECT *
FROM libro
WHERE titulo REGEXP '.*[aeiouAEIOU].*[aeiouAEIOU].*[aeiouAEIOU].*';
+--------+-----------------------------------+----------+---------------------------------------------+--------+
| codigo |              titulo               | autor_id |                  editorial                  | precio |
+--------+-----------------------------------+----------+---------------------------------------------+--------+
| 1      | The Great Gatsby                  | 6        | Charles Scribner's Sons                     | 20.99  |
| 2      | To Kill a Mockingbird             | 7        | J.B. Lippincott & Co.                       | 15.95  |
| 3      | The Catcher in the Rye            | 8        | Little, Brown and Company                   | 18.75  |
| 4      | One Hundred Years of Solitude     | 9        | Harper & Row                                | 22.5   |
| 5      | Brave New World                   | 3        | Chatto & Windus                             | 17.99  |
| 6      | The Hobbit                        | 10       | George Allen & Unwin                        | 24.99  |
| 7      | The Lord of the Rings             | 10       | George Allen & Unwin                        | 35.5   |
| 8      | The Chronicles of Narnia          | 11       | Geoffrey Bles                               | 28.99  |
| 9      | The Odyssey                       | 12       | Homer                                       | 14.95  |
| 10     | The Iliad                         | 12       | Homer                                       | 14.95  |
| 12     | The Road                          | 14       | Alfred A. Knopf                             | 16.75  |
| 13     | The Grapes of Wrath               | 15       | The Viking Press                            | 21.5   |
| 14     | Wuthering Heights                 | 16       | Emily Brontë                                | 12.99  |
| 15     | The Old Man and the Sea           | 17       | Charles Scribner's Sons                     | 18.95  |
| 16     | The Count of Monte Cristo         | 18       | Pétion                                      | 27.99  |
| 17     | The Picture of Dorian Gray        | 19       | Ward, Lock, and Company                     | 14.5   |
| 18     | The Adventures of Sherlock Holmes | 20       | George Newnes                               | 16.99  |
| 19     | Frankenstein                      | 21       | Lackington, Hughes, Harding, Mavor, & Jones | 13.25  |
| 20     | Alice's Adventures in Wonderland  | 22       | Macmillan                                   | 11.5   |
| 21     | The Prince                        | 23       | Niccolò Machiavelli                         | 10.99  |
| 22     | Don Quixote                       | 24       | Francisco de Robles                         | 26.75  |
| 23     | The Divine Comedy                 | 25       | Dante Alighieri                             | 20.5   |
| 24     | Anna Karenina                     | 26       | The Russian Messenger                       | 23.99  |
| 25     | Les Misérables                    | 27       | A. Lacroix, Verboeckhoven & Cie.            | 29.75  |
| 26     | The Jungle Book                   | 28       | Macmillan Publishers                        | 14.99  |
| 27     | The Wind in the Willows           | 29       | Methuen & Co.                               | 17.5   |
| 28     | War and Peace                     | 26       | The Russian Messenger                       | 33.25  |
| 29     | Crime and Punishment              | 30       | The Russian Messenger                       | 19.99  |
+--------+-----------------------------------+----------+---------------------------------------------+--------+
sqlite> 
```
### Obtener todos los autores cuyo nombre inicia con una consonante:
```sh
sqlite> SELECT *
FROM autor
WHERE nombre REGEXP '^[^aeiouAEIOU]';
+----+---------------+
| id |    nombre     |
+----+---------------+
| 1  | J.K. Rowling  |
| 2  | Stephen King  |
| 3  | George Orwell |
| 4  | Jane Austen   |
+----+---------------+
sqlite> 
```
### Seleccionar los libros cuyo título no contiene la palabra "Science":
```sh
sqlite> SELECT * FROM libro WHERE titulo NOT REGEXP 'Science';
+--------+-----------------------------------+----------+---------------------------------------------+--------+
| codigo |              titulo               | autor_id |                  editorial                  | precio |
+--------+-----------------------------------+----------+---------------------------------------------+--------+
| 1      | The Great Gatsby                  | 6        | Charles Scribner's Sons                     | 20.99  |
| 2      | To Kill a Mockingbird             | 7        | J.B. Lippincott & Co.                       | 15.95  |
| 3      | The Catcher in the Rye            | 8        | Little, Brown and Company                   | 18.75  |
| 4      | One Hundred Years of Solitude     | 9        | Harper & Row                                | 22.5   |
| 5      | Brave New World                   | 3        | Chatto & Windus                             | 17.99  |
| 6      | The Hobbit                        | 10       | George Allen & Unwin                        | 24.99  |
| 7      | The Lord of the Rings             | 10       | George Allen & Unwin                        | 35.5   |
| 8      | The Chronicles of Narnia          | 11       | Geoffrey Bles                               | 28.99  |
| 9      | The Odyssey                       | 12       | Homer                                       | 14.95  |
| 10     | The Iliad                         | 12       | Homer                                       | 14.95  |
| 11     | Moby-Dick                         | 13       | Harper & Brothers                           | 19.99  |
| 12     | The Road                          | 14       | Alfred A. Knopf                             | 16.75  |
| 13     | The Grapes of Wrath               | 15       | The Viking Press                            | 21.5   |
| 14     | Wuthering Heights                 | 16       | Emily Brontë                                | 12.99  |
| 15     | The Old Man and the Sea           | 17       | Charles Scribner's Sons                     | 18.95  |
| 16     | The Count of Monte Cristo         | 18       | Pétion                                      | 27.99  |
| 17     | The Picture of Dorian Gray        | 19       | Ward, Lock, and Company                     | 14.5   |
| 18     | The Adventures of Sherlock Holmes | 20       | George Newnes                               | 16.99  |
| 19     | Frankenstein                      | 21       | Lackington, Hughes, Harding, Mavor, & Jones | 13.25  |
| 20     | Alice's Adventures in Wonderland  | 22       | Macmillan                                   | 11.5   |
| 21     | The Prince                        | 23       | Niccolò Machiavelli                         | 10.99  |
| 22     | Don Quixote                       | 24       | Francisco de Robles                         | 26.75  |
| 23     | The Divine Comedy                 | 25       | Dante Alighieri                             | 20.5   |
| 24     | Anna Karenina                     | 26       | The Russian Messenger                       | 23.99  |
| 25     | Les Misérables                    | 27       | A. Lacroix, Verboeckhoven & Cie.            | 29.75  |
| 26     | The Jungle Book                   | 28       | Macmillan Publishers                        | 14.99  |
| 27     | The Wind in the Willows           | 29       | Methuen & Co.                               | 17.5   |
| 28     | War and Peace                     | 26       | The Russian Messenger                       | 33.25  |
| 29     | Crime and Punishment              | 30       | The Russian Messenger                       | 19.99  |
+--------+-----------------------------------+----------+---------------------------------------------+--------+
sqlite> 
```
### Obtener todos los autores cuyo nombre tiene al menos una letra repetida consecutivamente:
> SE SUPONE QUE ESTA DEBERIA DEVOLVERME EL RESULTADO PERO NO SE POR QUE NO FUNCIONA Y YA ME ESTA ROMPIENDO LA PACIENCIA ASI QUE TE LA PONGO PARA DISCUTIRLA EN CLASE
```sql
SELECT * FROM autor WHERE nombre REGEXP '([A-Za-z])\\1';
```
> LA QUE LOGRE QUE ME FUNCIONE ES ESTA
```sql
sqlite> SELECT * FROM autor
WHERE lower(nombre) REGEXP 'aa|bb|cc|dd|ee|ff|gg|hh|ii|jj|kk|ll|mm|nn|oo|pp|qq|rr|ss|tt|uu|vv|ww|xx|yy|zz';
+----+---------------+
| id |    nombre     |
+----+---------------+
| 3  | George Orwell |
+----+---------------+
sqlite> 
```
### Obtener todos los autores cuyo nombre empieza con "M" o termina con "n":
```sh
sqlite> SELECT *
FROM autor
WHERE nombre REGEXP '^M' OR nombre REGEXP 'n$';
+----+-------------+
| id |   nombre    |
+----+-------------+
| 4  | Jane Austen |
+----+-------------+
sqlite> 

```
### Obtener todos los autores cuyo nombre no contiene caracteres especiales:
```sh
sqlite> SELECT *
FROM autor
WHERE nombre REGEXP '^[A-Za-z ]+$';
+----+-----------------+
| id |     nombre      |
+----+-----------------+
| 2  | Stephen King    |
| 3  | George Orwell   |
| 4  | Jane Austen     |
| 5  | Agatha Christie |
+----+-----------------+
sqlite> 
```





</div>
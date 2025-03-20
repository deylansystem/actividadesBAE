<div align="justify">

# `>_` Tema 3

creación y manipulación de una base de datos SQLite3 desde la línea de comandos_.

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
    ('Crime and Punishment', 30, 'The Russian Messenger', 19.99);.75),, 13.25),
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




</div>
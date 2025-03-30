<div align="justify">

# `>_` Tema 3

creación y manipulación de una base de datos SQLite3 desde la línea de comandos_.


## Tarea 7

### 1. Listar los coches vendidos con sus modelos y precios, junto con los nombres de los clientes que los compraron.
```sql
sqlite> SELECT c.modelo, c.precio, cl.nombre FROM ventas v JOIN coches c ON v.id_coche = c.id_coche JOIN clientes cl ON v.id_cliente = cl.id_cliente;
+----------------+---------+-----------------+
|     modelo     | precio  |     nombre      |
+----------------+---------+-----------------+
| Sedán 2022     | 25000.0 | Juan Pérez      |
| Hatchback 2021 | 22000.0 | María Gómez     |
| SUV 2023       | 30000.0 | Carlos López    |
| Coupé 2022     | 28000.0 | Ana Martínez    |
| Camioneta 2023 | 32000.0 | Pedro Rodríguez |
| Compacto 2021  | 20000.0 | Laura Sánchez   |
| Híbrido 2022   | 27000.0 | Miguel González |
| Deportivo 2023 | 35000.0 | Isabel Díaz     |
| Eléctrico 2021 | 40000.0 | Elena Torres    |
+----------------+---------+-----------------+
```
### 2. Encontrar los clientes que han comprado coches con precios superiores al promedio de todos los coches vendidos.
```sql
sqlite> SELECT AVG(c.precio) FROM ventas v JOIN coches c ON v.id_coche = c.id_coche;
+------------------+
|  AVG(c.precio)   |
+------------------+
| 28777.7777777778 |
+------------------+

sqlite> SELECT cl.nombre, c.modelo, c.precio FROM ventas v JOIN coches c ON v.id_coche = c.id_coche JOIN clientes cl ON v.id_cliente = cl.id_cliente WHERE c.precio > (SELECT AVG(precio) FROM coches);
+-----------------+----------------+---------+
|     nombre      |     modelo     | precio  |
+-----------------+----------------+---------+
| Carlos López    | SUV 2023       | 30000.0 |
| Pedro Rodríguez | Camioneta 2023 | 32000.0 |
| Isabel Díaz     | Deportivo 2023 | 35000.0 |
| Elena Torres    | Eléctrico 2021 | 40000.0 |
+-----------------+----------------+---------+
```
### Mostrar los modelos de coches y sus precios que no han sido vendidos aún
```sql
sqlite> SELECT modelo, precio FROM coches WHERE id_coche NOT IN(SELECT id_coche FROM ventas);
+-------------+---------+
|   modelo    | precio  |
+-------------+---------+
| Pickup 2022 | 31000.0 |
+-------------+---------+
```

### Calcular el total gastado por todos los clientes en coches
```sql
sqlite> SELECT SUM(precio) FROM coches WHERE id_coche IN(SELECT id_coche FROM ventas);
+-------------+
| SUM(precio) |
+-------------+
| 259000.0    |
+-------------+
```

### Listar los coches vendidos junto con la fecha de venta y el nombre del cliente, ordenados por fecha de venta de forma descendente 
```sql
sqlite> SELECT c.modelo, v.fecha_venta, cl.nombre FROM ventas v JOIN coches c ON v.id_coche = c.id_coche JOIN clientes cl ON v.id_cliente = cl.id_cliente ORDER BY v.fecha_venta DESC;
+----------------+-------------+-----------------+
|     modelo     | fecha_venta |     nombre      |
+----------------+-------------+-----------------+
| Eléctrico 2021 | 2023-10-05  | Elena Torres    |
| Deportivo 2023 | 2023-08-25  | Isabel Díaz     |
| Híbrido 2022   | 2023-07-20  | Miguel González |
| Compacto 2021  | 2023-06-15  | Laura Sánchez   |
| Camioneta 2023 | 2023-05-05  | Pedro Rodríguez |
| Coupé 2022     | 2023-04-10  | Ana Martínez    |
| SUV 2023       | 2023-03-25  | Carlos López    |
| Hatchback 2021 | 2023-02-20  | María Gómez     |
| Sedán 2022     | 2023-01-15  | Juan Pérez      |
+----------------+-------------+-----------------+
```
### Encontrar el modelo de coche más caro.
```sql
sqlite> SELECT modelo, precio FROM coches WHERE precio = (SELECT MAX(precio) FROM coches);
+----------------+---------+
|     modelo     | precio  |
+----------------+---------+
| Eléctrico 2021 | 40000.0 |
+----------------+---------+
```
### Mostrar los clientes que han comprado al menos un coche (un coche o más) y la cantidad de coches comprados.

```sql
sqlite> SELECT cl.nombre, COUNT(v.id_coche) AS cantidad_comprada FROM ventas v JOIN clientes cl ON v.id_cliente = cl.id_cliente GROUP BY cl.nombre ORDER BY cantidad_comprada DESC;
+-----------------+-------------------+
|     nombre      | cantidad_comprada |
+-----------------+-------------------+
| Pedro Rodríguez | 1                 |
| Miguel González | 1                 |
| María Gómez     | 1                 |
| Laura Sánchez   | 1                 |
| Juan Pérez      | 1                 |
| Isabel Díaz     | 1                 |
| Elena Torres    | 1                 |
| Carlos López    | 1                 |
| Ana Martínez    | 1                 |
+-----------------+-------------------+
```


### Encontrar los clientes que han comprado coches de la marca 'Toyota'
```sql
sqlite> SELECT cl.nombre, c.modelo FROM ventas v JOIN coches c ON v.id_coche = c.id_coche JOIN clientes cl ON v.id_cliente = cl.id_cliente WHERE c.marca = 'Toyota';
+------------+------------+
|   nombre   |   modelo   |
+------------+------------+
| Juan Pérez | Sedán 2022 |
+------------+------------+
```


### Calcular el promedio de edad de los clientes que han comprado coches de más de 25,000
```sql
sqlite> SELECT AVG(cl.edad) FROM ventas v JOIN coches c ON v.id_coche = c.id_coche JOIN clientes cl ON v.id_cliente = cl.id_cliente WHERE c.precio > 25000;
+------------------+
|   AVG(cl.edad)   |
+------------------+
| 32.8333333333333 |
+------------------+
```


### Mostrar los modelos de coches y sus precios que fueron comprados por clientes mayores de 30 años
```sql
sqlite> SELECT c.modelo, c.precio FROM ventas v JOIN coches c ON v.id_coche = c.id_coche JOIN clientes cl ON v.id_cliente = cl.id_cliente WHERE cl.edad > 30;
+----------------+---------+
|     modelo     | precio  |
+----------------+---------+
| SUV 2023       | 30000.0 |
| Camioneta 2023 | 32000.0 |
| Compacto 2021  | 20000.0 |
| Deportivo 2023 | 35000.0 |
+----------------+---------+
```

### Encontrar los coches vendidos en el año 2022 junto con la cantidad total de ventas en ese año
>NO EXISTEN VENTAS EN EL 2022 POR ESO NO DEVUELVE NINGUN DATO
```sql
sqlite> SELECT c.modelo, COUNT(v.id_coche) AS total_ventas FROM ventas v JOIN coches c ON v.id_coche = c.id_coche WHERE v.fecha_venta BETWEEN '2022-01-01' AND '2022-12-31'  GROUP BY c.modelo;

```

### Listar los coches cuyos precios son mayores que el precio promedio de coches vendidos a clientes menores de 30 años
```sql
sqlite> SELECT c.modelo, c.precio FROM coches c WHERE c.precio > (SELECT AVG(c2.precio) FROM ventas v JOIN coches c2 ON v.id_coche = c2.id_coche JOIN clientes cl ON v.id_cliente = cl.id_cliente WHERE cl.edad < 30);
+----------------+---------+
|     modelo     | precio  |
+----------------+---------+
| SUV 2023       | 30000.0 |
| Camioneta 2023 | 32000.0 |
| Deportivo 2023 | 35000.0 |
| Pickup 2022    | 31000.0 |
| Eléctrico 2021 | 40000.0 |
+----------------+---------+
```

### Calcular el total de ventas por marca de coche, ordenado de forma descendente por el total de ventas
```sql
sqlite> SELECT c.marca, COUNT(c.id_coche) AS cantidad_ventas, SUM(c.precio) AS total_ventas FROM ventas v JOIN coches c ON v.id_coche = c.id_coche GROUP BY c.marca ORDER BY total_ventas DESC;
+------------+-----------------+--------------+
|   marca    | cantidad_ventas | total_ventas |
+------------+-----------------+--------------+
| Tesla      | 1               | 40000.0      |
| Mazda      | 1               | 35000.0      |
| Nissan     | 1               | 32000.0      |
| Ford       | 1               | 30000.0      |
| Chevrolet  | 1               | 28000.0      |
| Hyundai    | 1               | 27000.0      |
| Toyota     | 1               | 25000.0      |
| Honda      | 1               | 22000.0      |
| Volkswagen | 1               | 20000.0      |
+------------+-----------------+--------------+
```

</div>
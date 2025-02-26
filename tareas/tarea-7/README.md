<div align="justify">


# Ejercicio 7 (Base de datos (Gestión Tienda)")


## Base de Datos No Normalizada: Tienda

| ProductoID | Nombre          | Categorias                  | Precio | ClienteID | NombreCliente | DireccionesEnvio                      |
|------------|-----------------|-----------------------------|--------|-----------|---------------|---------------------------------------|
| 1          | Laptop HP       | Electrónicos, Informática   | 800    | 101       | Juan          | Calle 1, Ciudad A / Calle 2, Ciudad A |
| 2          | Camiseta Nike   | Ropa, Deportes              | 30     | 102       | María         | Calle 3, Ciudad B                     |
| 3          | Libro "Dune"    | Libros, Ciencia Ficción     | 20     | 101       | Juan          | Calle 1, Ciudad A                     |

## SOLUCION :
Se pide:

- Verifica y transforma a __1FN__ justificando la respuesta.

    > Para que los datos sean atomicos y puedan cumplir con la normalizacion 1FN se necesita crear cada fila con su respectivo valor categorias

 
| ProductoID | Nombre        | Categoria        | Precio | ClienteID | NombreCliente | DireccionEnvio      |
|------------|---------------|------------------|--------|-----------|---------------|---------------------|
| 1          | Laptop HP     | Electrónicos     | 800    | 101       | Juan          | Calle 1, Ciudad A   |
| 1          | Laptop HP     | Informática      | 800    | 101       | Juan          | Calle 1, Ciudad A   |
| 1          | Laptop HP     | Electrónicos     | 800    | 101       | Juan          | Calle 2, Ciudad A   |
| 1          | Laptop HP     | Informática      | 800    | 101       | Juan          | Calle 2, Ciudad A   |
| 2          | Camiseta Nike | Ropa             | 30     | 102       | María         | Calle 3, Ciudad B   |
| 2          | Camiseta Nike | Deportes         | 30     | 102       | María         | Calle 3, Ciudad B   |
| 3          | Libro "Dune"  | Libros           | 20     | 101       | Juan          | Calle 1, Ciudad A   |
| 3          | Libro "Dune"  | Ciencia Ficción  | 20     | 101       | Juan          | Calle 1, Ciudad A   |

- Verifica y transforma a __2FN__ justificando la respuesta.

    > Para aplicar la normalizacion 2FN se divide la tabla inicial en: producto, categoria y direccion de envio para reducir los campos repetidos y de nombre se extrae y se crean dos columnas llamadas marca, titulo

| ProductoID | Nombre   | Marca | Titulo | Precio | ClienteID | NombreCliente |
|------------|----------|-------|--------|--------|-----------|---------------|
| 1          | Laptop   |  HP   | null   | 800    | 101       | Juan          |
| 2          | Camiseta | Nike  | null   | 30     | 102       | María         |
| 3          | Libro    | null  | "Dune" | 20     | 101       | Juan          |


***
> CATEGORIAS

| ProductoID | Categorias      | 
|------------|-----------------|
| 1          | Electrónicos    |
| 1          | Informática     |
| 2          | Ropa            | 
| 2          | Deportes        | 
| 3          | Libros          | 
| 3          | Ciencia Ficción | 

***
> DIRECCION DE ENVIO

| ClienteID | DireccionesEnvio  |
|-----------|-------------------|
| 101       | Calle 1, Ciudad A |
| 101       | Calle 2, Ciudad A |
| 102       | Calle 3, Ciudad B |
***



- Verifica y transforma a __3FN__ justificando la respuesta.

    > Revisando la tabla me doy cuenta que se puede extraer la tabla clientes, y separar de nombre la marca y el titulo, a tablas independientes aplicando asi la tercera forma de normalizacion tambien crear una tabla de ventas

PRODUCTOS

| ProductoID | Nombre   | MarcaID | Titulo | Precio |
|------------|----------|---------|--------|--------|
| 1          | Laptop   |  1      | null   | 800    |
| 2          | Camiseta |  2      | null   | 30     |
| 3          | Libro    | null    | "Dune" | 20     |


CLIENTES

| ClienteID | NombreCliente |
|-----------|---------------|
| 101       | Juan          |
| 102       | María         |

MARCAS

| MarcaID | NombreMarca |
|---------|-------------|
| 1       | HP          |
| 2       | Nike        |

VENTAS

| ProductoID | ClienteID |
|------------|-----------|
|1           |101        |
|2           |102        |
|3           |101        |




 </div>
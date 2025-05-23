
# 🧪 Simulacro de BBDD: Índices, Vistas, Funciones y Procedimientos

## 🎯 Objetivo

Consolidar el uso de los principales componentes de MySQL:

- Índices
- Vistas
- Funciones
- Procedimientos

---

## 🧱 Enunciado del ejercicio

La empresa **"TecnoMarket"** quiere analizar las ventas realizadas por sus clientes. Para ello, necesita organizar la información en su base de datos y optimizar el rendimiento de las consultas.

### Tu tarea consiste en:

1. Crear las tablas necesarias.
2. Insertar índices que mejoren las búsquedas más frecuentes.
3. Crear una vista que resuma las ventas.
4. Definir una función para calcular totales.
5. Crear un procedimiento que devuelva el resumen de ventas de un cliente específico.
6. Ejecutar el procedimiento para validar el resultado.

---

## 📘 Parte 1: Creación de Tablas

```sql
CREATE TABLE clientes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    ciudad VARCHAR(50)
);

CREATE TABLE productos (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(100),
    precio DECIMAL(10, 2)
);

CREATE TABLE ventas (
    id INT AUTO_INCREMENT PRIMARY KEY,
    cliente_id INT,
    producto_id INT,
    fecha DATE,
    cantidad INT,
    FOREIGN KEY (cliente_id) REFERENCES clientes(id),
    FOREIGN KEY (producto_id) REFERENCES productos(id)
);

Inserción de datos:

INSERT INTO productos (id, nombre, precio) VALUES
(1, 'Laptop', 1200.00),
(2, 'Teclado', 50.00),
(3, 'Monitor', 300.00);

INSERT INTO ventas (id, cliente_id, producto_id, fecha, cantidad) VALUES
(1, 1, 1, '2024-05-01', 1),
(2, 1, 2, '2024-05-12', 2),
(3, 2, 3, '2024-05-13', 1),
(4, 3, 2, '2024-05-14', 1);



```
## 🔍 Parte 2: Creación de Índices

```sql

CREATE INDEX idx_ciudad ON clientes(ciudad);
CREATE INDEX idx_fecha ON ventas(fecha);

¿Son óptimos?
	•	Sí, porque:
	•	idx_ciudad optimiza búsquedas por ciudad en clientes.
	•	idx_fecha mejora las búsquedas por fecha en ventas, comunes en informes por periodos.


```
## 👁️ Parte 3: Crear una Vista

```sql
CREATE VIEW vista_ventas AS
SELECT
    v.id AS venta_id,
    c.nombre AS cliente,
    p.nombre AS producto,
    v.fecha,
    v.cantidad,
    (p.precio * v.cantidad) AS total
FROM ventas v
JOIN clientes c ON v.cliente_id = c.id
JOIN productos p ON v.producto_id = p.id;

📊 Resultado esperado:

| venta_id | cliente     | producto | fecha       | cantidad | total   |
|----------|-------------|----------|-------------|----------|---------|
| 1        | Ana Pérez   | Laptop   | 2024-05-01  | 1        | 1200.00 |
| 2        | Ana Pérez   | Teclado  | 2024-05-12  | 2        | 100.00  |
| 3        | Luis Gómez  | Monitor  | 2024-05-13  | 1        | 300.00  |
| 4        | Carla Ruiz  | Teclado  | 2024-05-14  | 1        | 50.00   |



```
## 🧮 Parte 4: Crear una Función
```sql
DELIMITER //

CREATE FUNCTION calcular_total(precio DECIMAL(10,2), cantidad INT)
RETURNS DECIMAL(10,2)
DETERMINISTIC
BEGIN
    RETURN precio * cantidad;
END //

DELIMITER ;

Ejemplo de uso:

SELECT calcular_total(1200.00, 2); -- Resultado: 2400.00



```
## ⚙️ Parte 5: Crear un Procedimiento
```sql
DELIMITER //

CREATE PROCEDURE resumen_cliente(IN id_cliente INT)
BEGIN
    SELECT 
        c.nombre,
        v.fecha,
        p.nombre AS producto,
        v.cantidad,
        p.precio * v.cantidad AS total
    FROM ventas v
    JOIN clientes c ON v.cliente_id = c.id
    JOIN productos p ON v.producto_id = p.id
    WHERE v.cliente_id = id_cliente;
END //

DELIMITER ;

Ejemplo de ejecución:

CALL resumen_cliente(1);

| nombre     | fecha       | producto | cantidad | total   |
|------------|-------------|----------|----------|---------|
| Ana Pérez  | 2024-05-01  | Laptop   | 1        | 1200.00 |
| Ana Pérez  | 2024-05-12  | Teclado  | 2        | 100.00  |



```
```text
❓ Preguntas Teóricas

📌 ¿Qué ventajas ofrece el uso de una vista?
	•	Facilita consultas complejas con múltiples JOIN.
	•	Mejora la legibilidad del código.
	•	Centraliza la lógica de negocio.
	•	Permite seguridad (ocultar columnas sensibles).

📌 ¿Por qué declarar una función como DETERMINISTIC?
	•	Indica que con los mismos parámetros siempre devuelve el mismo resultado.
	•	Permite optimizaciones por parte del motor de MySQL.

📌 Diferencias entre función y procedimiento

| Característica      | Función                           | Procedimiento                          |
|---------------------|-----------------------------------|----------------------------------------|
| Retorno             | Devuelve un valor                 | No retorna valor directamente          |
| Uso en consultas    | Sí                                | No (no se puede usar en SELECT)        |
| Objetivo            | Calcular y devolver un resultado  | Ejecutar una acción o conjunto         |

📌 ¿Qué impacto tienen los índices?
	•	Mejoran el rendimiento de búsqueda y filtros.
	•	Reducen el tiempo de respuesta.
	•	Aumentan el tamaño de la base de datos y ralentizan INSERT/UPDATE.

📌 ¿Cuándo usar TRIGGER en vez de procedimiento?
	•	Cuando se requiere ejecutar lógica automáticamente al insertar, actualizar o eliminar datos.
	•	Ej: registrar automáticamente en un historial cuando se modifica una tabla.

```
## 📝 Preguntas Prácticas

✅ Modifica el procedimiento para incluir filtro por fechas
```sql
DELIMITER //

CREATE PROCEDURE resumen_cliente_fecha(
    IN id_cliente INT,
    IN fecha_inicio DATE,
    IN fecha_fin DATE
)
BEGIN
    SELECT 
        c.nombre,
        v.fecha,
        p.nombre AS producto,
        v.cantidad,
        p.precio * v.cantidad AS total
    FROM ventas v
    JOIN clientes c ON v.cliente_id = c.id
    JOIN productos p ON v.producto_id = p.id
    WHERE v.cliente_id = id_cliente
    AND v.fecha BETWEEN fecha_inicio AND fecha_fin;
END //

DELIMITER ;
```
✅ Índice en producto_id
```sql
CREATE INDEX idx_producto_id ON ventas(producto_id);
```
✅ ¿Qué pasa si insertas una venta con cliente_id inexistente?
	•	Error de integridad referencial: Cannot add or update a child row: a foreign key constraint fails.

✅ Modifica la vista para incluir ciudad
```sql
CREATE OR REPLACE VIEW vista_ventas AS
SELECT
    v.id AS venta_id,
    c.nombre AS cliente,
    c.ciudad,
    p.nombre AS producto,
    v.fecha,
    v.cantidad,
    (p.precio * v.cantidad) AS total
FROM ventas v
JOIN clientes c ON v.cliente_id = c.id
JOIN productos p ON v.producto_id = p.id;
```
✅ Validación de existencia de cliente
```sql
DELIMITER //

CREATE PROCEDURE resumen_cliente_validado(IN id_cliente INT)
BEGIN
    DECLARE existe_cliente INT;

    SELECT COUNT(*) INTO existe_cliente
    FROM clientes
    WHERE id = id_cliente;

    IF existe_cliente = 0 THEN
        SELECT 'Cliente no existe' AS mensaje;
    ELSE
        SELECT 
            c.nombre,
            v.fecha,
            p.nombre AS producto,
            v.cantidad,
            p.precio * v.cantidad AS total
        FROM ventas v
        JOIN clientes c ON v.cliente_id = c.id
        JOIN productos p ON v.producto_id = p.id
        WHERE v.cliente_id = id_cliente;
    END IF;
END //

DELIMITER ;
```

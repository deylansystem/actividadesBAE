PRAGMA foreign_keys=OFF;
BEGIN TRANSACTION;
CREATE TABLE productos (
    id INTEGER PRIMARY KEY,
    nombre TEXT,
    categoria TEXT,
    precio REAL
);
INSERT INTO productos VALUES(1,'Arroz','Alimentos',2.5);
INSERT INTO productos VALUES(2,'Leche','Lácteos',1.800000000000000044);
INSERT INTO productos VALUES(3,'Pan','Panadería',1.199999999999999956);
INSERT INTO productos VALUES(4,'Manzanas','Frutas',3.0);
INSERT INTO productos VALUES(5,'Pollo','Carnes',5.5);
INSERT INTO productos VALUES(6,'Huevos','Lácteos',1.0);
INSERT INTO productos VALUES(7,'Yogurt','Lácteos',2.0);
INSERT INTO productos VALUES(8,'Tomates','Verduras',2.200000000000000178);
INSERT INTO productos VALUES(9,'Queso','Lácteos',4.0);
INSERT INTO productos VALUES(10,'Cereal','Desayuno',3.5);
INSERT INTO productos VALUES(11,'Papel Higiénico','Hogar',1.5);
INSERT INTO productos VALUES(12,'Cepillo de Dientes','Higiene',2.0);
INSERT INTO productos VALUES(13,'Detergente','Limpieza',2.799999999999999823);
INSERT INTO productos VALUES(14,'Galletas','Snacks',1.699999999999999956);
INSERT INTO productos VALUES(15,'Aceite de Oliva','Cocina',4.5);
INSERT INTO productos VALUES(16,'Café','Bebidas',5.0);
INSERT INTO productos VALUES(17,'Sopa enlatada','Conservas',2.299999999999999822);
INSERT INTO productos VALUES(18,'Jabón de Baño','Higiene',1.199999999999999956);
INSERT INTO productos VALUES(19,'Botellas de Agua','Bebidas',1.0);
INSERT INTO productos VALUES(20,'Cerveza','Bebidas',3.799999999999999823);
CREATE TABLE ventas (
    id INTEGER PRIMARY KEY,
    id_producto INTEGER,
    cantidad INTEGER,
    fecha DATE,
    FOREIGN KEY (id_producto) REFERENCES productos(id)
);
INSERT INTO ventas VALUES(1,1,5,'2024-01-17');
INSERT INTO ventas VALUES(2,2,3,'2024-01-17');
INSERT INTO ventas VALUES(3,4,2,'2024-01-17');
INSERT INTO ventas VALUES(4,5,1,'2024-01-17');
INSERT INTO ventas VALUES(5,6,10,'2024-01-18');
INSERT INTO ventas VALUES(6,8,4,'2024-01-18');
INSERT INTO ventas VALUES(7,10,2,'2024-01-18');
INSERT INTO ventas VALUES(8,14,7,'2024-01-19');
INSERT INTO ventas VALUES(9,16,3,'2024-01-19');
INSERT INTO ventas VALUES(10,18,6,'2024-01-20');
COMMIT;

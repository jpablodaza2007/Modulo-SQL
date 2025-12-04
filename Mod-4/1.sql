CREATE DATABASE mi_primera_bd;

-- Línea 1: Conectarse a la base de datos creada
\c mi_primera_bd;
-- Línea 2: Verificar en qué base de datos estamos
SELECT current_database();
-- Línea 3: Ver información básica de la conexión
\conninfo

-- Línea 1-8: Crear tabla de clientes con estructura completa
CREATE TABLE clientes (
id SERIAL PRIMARY KEY,
nombre VARCHAR(100) NOT NULL,
email VARCHAR(150) UNIQUE,
telefono VARCHAR(15),
fecha_registro DATE DEFAULT CURRENT_DATE,
activo BOOLEAN DEFAULT TRUE
);

-- Línea 1-4: Insertar un cliente completo especificando todas las columnas
INSERT INTO clientes (nombre, email, telefono, fecha_registro, activo)
VALUES ('Juan Pérez', 'juan.perez@email.com', '555-0123', '2024-01-15', TRUE);
-- Línea 6-7: Insertar cliente con valores por defecto (más simple)
INSERT INTO clientes (nombre, email)
VALUES ('María García', 'maria.garcia@email.com');
-- Línea 9: Insertar múltiples clientes de una vez
INSERT INTO clientes (nombre, email, telefono) VALUES
('Carlos López', 'carlos@email.com', '555-0124'),
('Ana Martínez', 'ana@email.com', '555-0125'),
('Luis Rodríguez', 'luis@email.com', '555-0126');

-- Línea 1: Ver todos los datos de todos los clientes
SELECT * FROM clientes;
-- Línea 3: Ver solo nombres y emails
SELECT nombre, email FROM clientes;
-- Línea 5: Ver clientes con un filtro específico
SELECT nombre, telefono FROM clientes WHERE activo = TRUE;
-- Línea 7: Contar cuántos clientes tienes
SELECT COUNT(*) FROM clientes;
-- Línea 9: Ver clientes ordenados alfabéticamente
SELECT nombre, email FROM clientes ORDER BY nombre;
-- Línea 11: Ver solo los primeros 3 clientes
SELECT * FROM clientes LIMIT 3;

-- Línea 1: Buscar clientes por nombre exacto
SELECT * FROM clientes WHERE nombre = 'Juan Pérez';
-- Línea 3: Buscar clientes que contengan una palabra
SELECT * FROM clientes WHERE nombre LIKE '%García%';
-- Línea 5: Clientes registrados en una fecha específica
SELECT * FROM clientes WHERE fecha_registro = '2024-01-15';
-- Línea 7: Clientes registrados después de una fecha
SELECT * FROM clientes WHERE fecha_registro > '2024-01-01';
-- Línea 9: Múltiples condiciones con AND
SELECT * FROM clientes WHERE activo = TRUE AND fecha_registro > '2024-01-01';
-- Línea 11: Condiciones alternativas con OR
SELECT * FROM clientes WHERE nombre LIKE '%Juan%' OR nombre LIKE '%María%';
-- Línea 13: Buscar en una lista de valores
SELECT * FROM clientes WHERE nombre IN ('Juan Pérez', 'María García', 'Carlos López');
-- Línea 15: Excluir valores específicos
SELECT * FROM clientes WHERE nombre NOT LIKE '%López%';
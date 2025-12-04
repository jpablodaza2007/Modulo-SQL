-- Crear el esquema
CREATE DATABASE apuntes_personales;
USE apuntes_personales;
-- Tabla de Autores (sin dependencias)
CREATE TABLE autores (
codigo_autor INTEGER PRIMARY KEY,
nombre VARCHAR(50) NOT NULL,
apellidos VARCHAR(100) NOT NULL,
UNIQUE (nombre, apellidos)
);
-- Tabla de Temas (sin dependencias)
CREATE TABLE temas (
codigo_tema INTEGER PRIMARY KEY,
nombre_tema VARCHAR(100) NOT NULL UNIQUE,
descripcion TEXT
);
-- Tabla de Apuntes (sin dependencias)
CREATE TABLE apuntes (
codigo_apunte INTEGER PRIMARY KEY,
estanteria INTEGER NOT NULL CHECK (estanteria > 0),
estante INTEGER NOT NULL CHECK (estante > 0),
carpeta VARCHAR(50) NOT NULL
);
-- Tabla de relación Temas por Carpeta
CREATE TABLE temas_por_carpeta (
codigo_apunte INTEGER,
codigo_tema INTEGER,
PRIMARY KEY (codigo_apunte, codigo_tema),
FOREIGN KEY (codigo_apunte) REFERENCES apuntes(codigo_apunte)
ON DELETE CASCADE,
FOREIGN KEY (codigo_tema) REFERENCES temas(codigo_tema)
ON DELETE CASCADE
);
-- Tabla de relación Autores de Temas
CREATE TABLE autores_de_temas (
codigo_tema INTEGER,
codigo_autor INTEGER,
PRIMARY KEY (codigo_tema, codigo_autor),
FOREIGN KEY (codigo_tema) REFERENCES temas(codigo_tema)
ON DELETE CASCADE,
FOREIGN KEY (codigo_autor) REFERENCES autores(codigo_autor)
ON DELETE CASCADE
);

-- 1. Buscar la ubicación de apuntes sobre un tema específico
SELECT a.estanteria, a.estante, a.carpeta, t.nombre_tema
FROM apuntes a
JOIN temas_por_carpeta tc ON a.codigo_apunte = tc.codigo_apunte
JOIN temas t ON tc.codigo_tema = t.codigo_tema
WHERE t.nombre_tema LIKE '%Bases de Datos%';
-- 2. Listar todos los temas con sus autores
SELECT t.nombre_tema, a.nombre, a.apellidos
FROM temas t
JOIN autores_de_temas at ON t.codigo_tema = at.codigo_tema
JOIN autores a ON at.codigo_autor = a.codigo_autor
ORDER BY t.nombre_tema, a.apellidos;
-- 3. Contar cuántos apuntes hay por tema
SELECT t.nombre_tema, COUNT(tc.codigo_apunte) AS num_carpetas
FROM temas t
LEFT JOIN temas_por_carpeta tc ON t.codigo_tema = tc.codigo_tema
GROUP BY t.codigo_tema, t.nombre_tema
ORDER BY num_carpetas DESC;
-- 4. Encontrar apuntes de un autor específico
SELECT DISTINCT a.estanteria, a.estante, a.carpeta, t.nombre_tema
FROM apuntes a
JOIN temas_por_carpeta tc ON a.codigo_apunte = tc.codigo_apunte
JOIN temas t ON tc.codigo_tema = t.codigo_tema
JOIN autores_de_temas at ON t.codigo_tema = at.codigo_tema
JOIN autores au ON at.codigo_autor = au.codigo_autor
WHERE au.apellidos = 'García';
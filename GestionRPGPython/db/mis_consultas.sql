
USE rpg_manager;

-- ==========================================
-- BLOQUE 1: CONSULTAS BÁSICAS
-- ==========================================

-- Ejercicio 2: Mostrar personajes ordenados por oro
SELECT nombre, vida, oro
FROM personaje
ORDER BY oro DESC;

-- Ejercicio 3: Buscar a Aragorn por su nombre
SELECT *
FROM personaje
WHERE nombre = 'Aragorn';

-- Ejercicio 4: Buscar personajes cuyos nombres empiezan por G
SELECT *
FROM personaje
WHERE nombre LIKE 'G%';


-- ==========================================
-- BLOQUE 2: UNIONES (JOIN)
-- ==========================================

-- Ejercicio 1: Mostrar personajes con el nombre de su clase
SELECT p.nombre, p.nivel, c.nombre AS clase
FROM personaje p
INNER JOIN clase c
    ON p.id_clase = c.id_clase;

-- Ejercicio 2: Mostrar todos los personajes, tengan clase o no
SELECT p.nombre, p.nivel, c.nombre AS clase
FROM personaje p
LEFT JOIN clase c
    ON p.id_clase = c.id_clase;

-- Ejercicio 3: Mostrar personajes, ítems y cantidades
SELECT p.nombre AS personaje, i.nombre AS item, inv.cantidad
FROM personaje p
INNER JOIN inventario inv
    ON p.id_personaje = inv.id_personaje
INNER JOIN item i
    ON inv.id_item = i.id_item;

-- Ejercicio 4: Mostrar todos los personajes, tengan ítems o no
SELECT p.nombre AS personaje, i.nombre AS item
FROM personaje p
LEFT JOIN inventario inv
    ON p.id_personaje = inv.id_personaje
LEFT JOIN item i
    ON inv.id_item = i.id_item;


-- ==========================================
-- BLOQUE 3: AGREGACIONES Y AGRUPAMIENTOS
-- ==========================================

-- Ejercicio 1: Contar todos los personajes
SELECT COUNT(*) AS total_personajes
FROM personaje;

-- Ejercicio 2: Contar personajes por clase
SELECT id_clase, COUNT(*) AS cantidad
FROM personaje
GROUP BY id_clase;

-- Ejercicio 3: Mostrar clases con más de un personaje
SELECT id_clase, COUNT(*) AS cantidad
FROM personaje
GROUP BY id_clase
HAVING COUNT(*) > 1;

-- Ejercicio 4: Calcular el promedio de oro
SELECT AVG(oro) AS promedio_oro
FROM personaje;

-- Ejercicio 5: Obtener el nivel máximo y mínimo
SELECT
    MAX(nivel) AS nivel_maximo,
    MIN(nivel) AS nivel_minimo
FROM personaje;

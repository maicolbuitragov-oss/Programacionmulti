
-- ==========================================
-- BASE DE DATOS RPG MANAGER
-- Archivo: db/mis_tablas.sql
-- ==========================================

CREATE DATABASE IF NOT EXISTS rpg_manager;
USE rpg_manager;


-- ============================================
-- RPG MANAGER
-- Archivo: db/mis_tablas.sql
-- ============================================

CREATE DATABASE IF NOT EXISTS rpg_manager;
USE rpg_manager;

-- ============================================
-- TABLA: personajes (tabla original)
-- ============================================

CREATE TABLE IF NOT EXISTS personajes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(60) NOT NULL,
    clase VARCHAR(20) NOT NULL,
    nivel INT NOT NULL DEFAULT 1,
    vida INT NOT NULL DEFAULT 100
) ENGINE=InnoDB;

-- Datos iniciales de personajes
INSERT INTO personajes (nombre, clase, nivel, vida)
SELECT 'Aragorn', 'Guerrero', 10, 100
WHERE NOT EXISTS (
    SELECT 1 FROM personajes WHERE nombre = 'Aragorn'
);

INSERT INTO personajes (nombre, clase, nivel, vida)
SELECT 'Legolas', 'Arquero', 25, 100
WHERE NOT EXISTS (
    SELECT 1 FROM personajes WHERE nombre = 'Legolas'
);

INSERT INTO personajes (nombre, clase, nivel, vida)
SELECT 'Gandalf', 'Mago', 50, 200
WHERE NOT EXISTS (
    SELECT 1 FROM personajes WHERE nombre = 'Gandalf'
);

-- ============================================
-- TABLA: clase
-- ============================================

CREATE TABLE IF NOT EXISTS clase (
    id_clase INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(30) NOT NULL UNIQUE
) ENGINE=InnoDB;

INSERT IGNORE INTO clase (nombre)
VALUES ('Guerrero'), ('Arquero'), ('Mago');

-- ============================================
-- TABLA: personaje
-- ============================================

CREATE TABLE IF NOT EXISTS personaje (
    id_personaje INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(60) NOT NULL,
    id_clase INT NOT NULL,
    nivel INT NOT NULL DEFAULT 1,
    vida INT NOT NULL DEFAULT 100,
    oro INT NOT NULL DEFAULT 0,

    CONSTRAINT fk_personaje_clase
        FOREIGN KEY (id_clase)
        REFERENCES clase(id_clase),

    CONSTRAINT chk_personaje_nivel
        CHECK (nivel BETWEEN 1 AND 100)
) ENGINE=InnoDB;

-- Insertar personajes solo si no existen
INSERT INTO personaje (nombre, id_clase, nivel, vida, oro)
SELECT 'Aragorn', c.id_clase, 10, 100, 500
FROM clase c
WHERE c.nombre = 'Guerrero'
AND NOT EXISTS (
    SELECT 1 FROM personaje p
    WHERE p.nombre = 'Aragorn'
);

INSERT INTO personaje (nombre, id_clase, nivel, vida, oro)
SELECT 'Legolas', c.id_clase, 25, 100, 2000
FROM clase c
WHERE c.nombre = 'Arquero'
AND NOT EXISTS (
    SELECT 1 FROM personaje p
    WHERE p.nombre = 'Legolas'
);

INSERT INTO personaje (nombre, id_clase, nivel, vida, oro)
SELECT 'Gandalf', c.id_clase, 50, 200, 0
FROM clase c
WHERE c.nombre = 'Mago'
AND NOT EXISTS (
    SELECT 1 FROM personaje p
    WHERE p.nombre = 'Gandalf'
);

-- ============================================
-- TABLA: item
-- ============================================

CREATE TABLE IF NOT EXISTS item (
    id_item INT AUTO_INCREMENT PRIMARY KEY,
    nombre VARCHAR(60) NOT NULL
) ENGINE=InnoDB;

INSERT INTO item (nombre)
SELECT 'Espada'
WHERE NOT EXISTS (
    SELECT 1 FROM item WHERE nombre = 'Espada'
);

INSERT INTO item (nombre)
SELECT 'Arco'
WHERE NOT EXISTS (
    SELECT 1 FROM item WHERE nombre = 'Arco'
);

INSERT INTO item (nombre)
SELECT 'Poción'
WHERE NOT EXISTS (
    SELECT 1 FROM item WHERE nombre = 'Poción'
);

-- ============================================
-- TABLA: inventario
-- ============================================

CREATE TABLE IF NOT EXISTS inventario (
    id_personaje INT NOT NULL,
    id_item INT NOT NULL,
    cantidad INT NOT NULL DEFAULT 1,

    PRIMARY KEY (id_personaje, id_item),

    CONSTRAINT fk_inventario_personaje
        FOREIGN KEY (id_personaje)
        REFERENCES personaje(id_personaje),

    CONSTRAINT fk_inventario_item
        FOREIGN KEY (id_item)
        REFERENCES item(id_item)
) ENGINE=InnoDB;

-- Asignar espada a Aragorn
INSERT INTO inventario (id_personaje, id_item, cantidad)
SELECT p.id_personaje, i.id_item, 1
FROM personaje p
JOIN item i ON i.nombre = 'Espada'
WHERE p.nombre = 'Aragorn'
AND NOT EXISTS (
    SELECT 1 FROM inventario inv
    WHERE inv.id_personaje = p.id_personaje
    AND inv.id_item = i.id_item
);

-- Asignar arco a Legolas
INSERT INTO inventario (id_personaje, id_item, cantidad)
SELECT p.id_personaje, i.id_item, 1
FROM personaje p
JOIN item i ON i.nombre = 'Arco'
WHERE p.nombre = 'Legolas'
AND NOT EXISTS (
    SELECT 1 FROM inventario inv
    WHERE inv.id_personaje = p.id_personaje
    AND inv.id_item = i.id_item
);

-- Asignar cinco pociones a Gandalf
INSERT INTO inventario (id_personaje, id_item, cantidad)
SELECT p.id_personaje, i.id_item, 5
FROM personaje p
JOIN item i ON i.nombre = 'Poción'
WHERE p.nombre = 'Gandalf'
AND NOT EXISTS (
    SELECT 1 FROM inventario inv
    WHERE inv.id_personaje = p.id_personaje
    AND inv.id_item = i.id_item
);

-- ============================================
-- VERIFICAR TABLAS
-- ============================================

SHOW TABLES;

-- ============================================
-- GPS TRACKER ITEMS - DATABASE INSTALLATION
-- ============================================
-- Führe dieses SQL-Script aus, um die Items in die Datenbank einzufügen

-- Items für ox_inventory/ESX Legacy
-- Tabelle: items

INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
('gps_tracker_1h', 'GPS-Tracker 1 Stunde', 200, 0, 1),
('gps_tracker_24h', 'GPS-Tracker 24 Stunden', 250, 0, 1),
('gps_tracker_permanent', 'GPS-Tracker Permanent', 300, 0, 1),
('gps_remover', 'GPS Remover Tool', 180, 0, 1);

-- ============================================
-- HINWEIS FÜR OX_INVENTORY
-- ============================================
-- Falls du ox_inventory nutzt, musst du ZUSÄTZLICH die Items in
-- ox_inventory/data/items.lua definieren!
-- Siehe mtj_gps_tracker/reference/items.lua für die Definition.

-- ============================================
-- ALTERNATIVE: ox_inventory ohne SQL
-- ============================================
-- Wenn du NUR ox_inventory nutzt (ohne items Tabelle),
-- brauchst du dieses SQL nicht und musst nur die items.lua editieren!


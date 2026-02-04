-- ============================================
-- GPS TRACKER ITEMS - SQL INSTALLATION
-- ============================================
-- Dieses SQL fügt die GPS-Tracker Items in die Datenbank ein

-- WICHTIG: Führe dieses SQL aus, um die Items zu erstellen!

-- Items in die Datenbank einfügen
INSERT INTO `items` (`name`, `label`, `weight`, `rare`, `can_remove`) VALUES
('gps_tracker_1h', 'GPS-Tracker 1 Stunde', 200, 0, 1),
('gps_tracker_24h', 'GPS-Tracker 24 Stunden', 250, 0, 1),
('gps_tracker_permanent', 'GPS-Tracker Permanent', 300, 0, 1),
('gps_remover', 'GPS Remover Tool', 180, 0, 1);

-- ============================================
-- ZUSÄTZLICH FÜR OX_INVENTORY
-- ============================================
-- Wenn du ox_inventory nutzt, füge ZUSÄTZLICH die Items
-- in ox_inventory/data/items.lua ein!
-- 
-- Siehe: mtj_gps_tracker/reference/items.lua
-- für die komplette Item-Definition mit Beschreibungen

-- ============================================
-- TESTEN
-- ============================================
-- Nach dem SQL-Import kannst du die Items testen:
-- /giveitem [name] gps_tracker_1h 3
-- /giveitem [name] gps_tracker_24h 2
-- /giveitem [name] gps_tracker_permanent 1
-- /giveitem [name] gps_remover 5


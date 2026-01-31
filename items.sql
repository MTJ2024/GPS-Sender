-- GPS Tracker Items SQL Script
-- Verwende diese SQL-Befehle nur, falls du Items direkt zur Datenbank hinzufügen musst
-- WICHTIG: ox_inventory nutzt normalerweise items.lua - SQL ist nur für manuelle DB-Verwaltung

-- HINWEIS: ox_inventory speichert Items normalerweise NICHT in der Datenbank
-- Die Items werden in ox_inventory/data/items.lua definiert
-- Dieser SQL-Code ist nur als Referenz für andere Inventarsysteme gedacht

-- Falls du ein alternatives Inventarsystem nutzt, kannst du folgende Items hinzufügen:

-- GPS Tracker Basic
-- INSERT INTO items (name, label, weight, rare, can_remove) VALUES 
-- ('gps_tracker_basic', 'GPS-Tracker Basic', 150, 0, 1);

-- GPS Tracker Standard
-- INSERT INTO items (name, label, weight, rare, can_remove) VALUES 
-- ('gps_tracker_standard', 'GPS-Tracker Standard', 200, 0, 1);

-- GPS Tracker Advanced
-- INSERT INTO items (name, label, weight, rare, can_remove) VALUES 
-- ('gps_tracker_advanced', 'GPS-Tracker Advanced', 250, 0, 1);

-- GPS Tracker Premium
-- INSERT INTO items (name, label, weight, rare, can_remove) VALUES 
-- ('gps_tracker_premium', 'GPS-Tracker Premium', 300, 0, 1);

-- GPS Remover Tool
-- INSERT INTO items (name, label, weight, rare, can_remove) VALUES 
-- ('gps_remover', 'GPS Remover Tool', 180, 0, 1);

-- ========================================
-- ADMIN BEFEHLE ZUM TESTEN
-- ========================================

-- Gib dir selbst Tracker zum Testen (ersetze "dein_name" mit deinem Ingame-Namen):

-- /giveitem dein_name gps_tracker_basic 5
-- /giveitem dein_name gps_tracker_standard 3
-- /giveitem dein_name gps_tracker_advanced 2
-- /giveitem dein_name gps_tracker_premium 1
-- /giveitem dein_name gps_remover 3

-- ========================================
-- FÜR ANDERE SPIELER
-- ========================================

-- Falls du Items für andere Spieler hinzufügen willst:
-- /giveitem [spielername] gps_tracker_basic [anzahl]

-- ========================================
-- WICHTIGER HINWEIS
-- ========================================

-- ox_inventory Items werden in der Datei ox_inventory/data/items.lua definiert!
-- Nutze NICHT SQL zum Hinzufügen von Items bei ox_inventory
-- Siehe items.lua für die korrekte Item-Definition

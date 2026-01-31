-- GPS Tracker Items Installation SQL
-- Führe dieses SQL-Script in deiner Datenbank aus, um die Items zu erstellen

-- WICHTIG: Für ox_inventory musst du die Items MANUELL in ox_inventory/data/items.lua einfügen!
-- Diese SQL ist nur für alternative Inventarsysteme!

-- Für ox_inventory: Öffne ox_inventory/data/items.lua und füge folgendes ein:
/*
['gps_tracker_1h'] = {
    label = 'GPS-Tracker 1 Stunde',
    weight = 200,
    stack = true,
    close = true,
    description = 'Illegaler GPS-Tracker mit 1 Stunde Laufzeit.',
    client = {
        image = 'gps_tracker.png',
    }
},

['gps_tracker_24h'] = {
    label = 'GPS-Tracker 24 Stunden',
    weight = 250,
    stack = true,
    close = true,
    description = 'Illegaler GPS-Tracker mit 24 Stunden Laufzeit.',
    client = {
        image = 'gps_tracker.png',
    }
},

['gps_tracker_permanent'] = {
    label = 'GPS-Tracker Permanent',
    weight = 300,
    stack = true,
    close = true,
    description = 'Illegaler GPS-Tracker mit Dauer-Funktion (7 Tage).',
    client = {
        image = 'gps_tracker.png',
    }
},

['gps_remover'] = {
    label = 'GPS Remover Tool',
    weight = 180,
    stack = true,
    close = true,
    description = 'Werkzeug zum Entfernen von GPS-Trackern.',
    client = {
        image = 'gps_remover.png',
    }
},
*/

-- Für ESX/andere Systeme mit items Tabelle:
-- INSERT INTO items (name, label, weight, rare, can_remove) VALUES 
-- ('gps_tracker_1h', 'GPS-Tracker 1 Stunde', 200, 0, 1),
-- ('gps_tracker_24h', 'GPS-Tracker 24 Stunden', 250, 0, 1),
-- ('gps_tracker_permanent', 'GPS-Tracker Permanent', 300, 0, 1),
-- ('gps_remover', 'GPS Remover Tool', 180, 0, 1);

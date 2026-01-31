-- GPS Tracker Items für ox_inventory
-- Diese Items sollten zu eurer ox_inventory/data/items.lua hinzugefügt werden
-- Illegales Tracking-System mit realistischen Laufzeiten

-- GPS Tracker 1 Stunde
['gps_tracker_1h'] = {
    label = 'GPS-Tracker 1 Stunde',
    weight = 200,
    stack = true,
    close = true,
    description = 'Illegaler GPS-Tracker mit 1 Stunde Laufzeit. Kurzzeitüberwachung für schnelle Jobs.',
    client = {
        image = 'gps_tracker.png',
    }
},

-- GPS Tracker 24 Stunden
['gps_tracker_24h'] = {
    label = 'GPS-Tracker 24 Stunden',
    weight = 250,
    stack = true,
    close = true,
    description = 'Illegaler GPS-Tracker mit 24 Stunden Laufzeit. Perfekt für ganztägige Überwachung.',
    client = {
        image = 'gps_tracker.png',
    }
},

-- GPS Tracker Permanent
['gps_tracker_permanent'] = {
    label = 'GPS-Tracker Permanent',
    weight = 300,
    stack = true,
    close = true,
    description = 'Illegaler GPS-Tracker mit Dauer-Funktion. Langzeit-Überwachung (7 Tage).',
    client = {
        image = 'gps_tracker.png',
    }
},

-- GPS Remover Tool
['gps_remover'] = {
    label = 'GPS Remover Tool',
    weight = 180,
    stack = true,
    close = true,
    description = 'Spezielles Werkzeug zum Entfernen von GPS-Trackern. Vorsicht ist geboten!',
    client = {
        image = 'gps_remover.png',
    }
},

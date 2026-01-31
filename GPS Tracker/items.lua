-- GPS Tracker Items für ox_inventory
-- Diese Items sollten zu eurer ox_inventory/data/items.lua hinzugefügt werden

-- GPS Tracker Basic (5 Minuten)
['gps_tracker_basic'] = {
    label = 'GPS-Tracker Basic',
    weight = 150,
    stack = true,
    close = true,
    description = 'Ein einfacher GPS-Tracker mit 5 Minuten Laufzeit. Perfekt für schnelle Verfolgungen.',
    client = {
        image = 'gps_tracker.png',
    }
},

-- GPS Tracker Standard (10 Minuten)
['gps_tracker_standard'] = {
    label = 'GPS-Tracker Standard',
    weight = 200,
    stack = true,
    close = true,
    description = 'Ein solider GPS-Tracker mit 10 Minuten Laufzeit. Der bewährte Standard.',
    client = {
        image = 'gps_tracker.png',
    }
},

-- GPS Tracker Advanced (15 Minuten)
['gps_tracker_advanced'] = {
    label = 'GPS-Tracker Advanced',
    weight = 250,
    stack = true,
    close = true,
    description = 'Ein verbesserter GPS-Tracker mit 15 Minuten Laufzeit. Für längere Verfolgungen.',
    client = {
        image = 'gps_tracker.png',
    }
},

-- GPS Tracker Premium (30 Minuten)
['gps_tracker_premium'] = {
    label = 'GPS-Tracker Premium',
    weight = 300,
    stack = true,
    close = true,
    description = 'Ein Premium GPS-Tracker mit 30 Minuten Laufzeit. Top-Qualität für professionelle Überwachung.',
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

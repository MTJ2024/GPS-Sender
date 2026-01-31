Config = {}

-- GPS Tracker Typen mit verschiedenen Laufzeiten und Preisen
Config.TrackerTypes = {
    {
        item = 'gps_tracker_basic',          -- Item-Name im Inventar
        label = 'GPS-Tracker Basic',         -- Anzeigename
        duration = 300,                      -- 5 Minuten
        price = 2500,                        -- Preis beim Kauf (optional, für Shop-Integration)
        description = '5 Min. Laufzeit - Gut für schnelle Jobs',
        icon = '⏱️'
    },
    {
        item = 'gps_tracker_standard',
        label = 'GPS-Tracker Standard',
        duration = 600,                      -- 10 Minuten
        price = 5000,
        description = '10 Min. Laufzeit - Solider Standard',
        icon = '📍'
    },
    {
        item = 'gps_tracker_advanced',
        label = 'GPS-Tracker Advanced',
        duration = 900,                      -- 15 Minuten
        price = 8000,
        description = '15 Min. Laufzeit - Für längere Verfolgungen',
        icon = '🎯'
    },
    {
        item = 'gps_tracker_premium',
        label = 'GPS-Tracker Premium',
        duration = 1800,                     -- 30 Minuten
        price = 15000,
        description = '30 Min. Laufzeit - Top-Qualität',
        icon = '💎'
    }
}

-- GPS Remover Preis (optional, für Shop-Integration)
Config.RemoverPrice = 3000

-- Animation beim Anbringen/Entfernen
Config.AttachAnimation = {
    dict = "PROP_HUMAN_BUM_BIN",
    duration = 10000
}

Config.RemoveAnimation = {
    dict = "PROP_HUMAN_BUM_BIN",
    duration = 10000
}

Config.ScanAnimation = {
    dict = "PROP_HUMAN_BUM_BIN",
    duration = 5000
}

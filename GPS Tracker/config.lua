Config = {}

-- GPS Tracker Typen mit verschiedenen Laufzeiten und Preisen
-- Illegales Tracking-System mit realistischen Laufzeiten
Config.TrackerTypes = {
    {
        item = 'gps_tracker_1h',             -- Item-Name im Inventar
        label = 'GPS-Tracker 1 Stunde',     -- Anzeigename
        duration = 3600,                     -- 1 Stunde (60 Minuten)
        price = 10000,                       -- Preis beim Kauf (Schwarzmarkt)
        description = '1 Std. Echtzeit - Kurzzeitüberwachung',
        icon = '⏱️'
    },
    {
        item = 'gps_tracker_24h',
        label = 'GPS-Tracker 24 Stunden',
        duration = 86400,                    -- 24 Stunden (1 Tag)
        price = 25000,
        description = '1 Tag Echtzeit - Ganztägige Überwachung',
        icon = '📅'
    },
    {
        item = 'gps_tracker_permanent',
        label = 'GPS-Tracker Permanent',
        duration = 604800,                   -- 7 Tage (praktisch permanent)
        price = 50000,
        description = 'Dauer-Tracking - Langzeit-Überwachung',
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

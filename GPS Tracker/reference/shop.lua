-- GPS-Tracker Shop Konfiguration für ESX Shops
-- Diese Konfiguration kann zu eurem Shop-System hinzugefügt werden

-- Beispiel für esx_shops oder ox_inventory shops
-- Tracker sollten im "Schwarzmarkt" verkauft werden (illegales System!)

Config.GPSShop = {
    -- Shop Name
    name = "Schwarzmarkt - GPS Tracker",
    
    -- Shop Items
    items = {
        {
            name = 'gps_tracker_1h',
            price = 10000,
            label = 'GPS-Tracker 1 Stunde',
            limit = 3  -- Maximale Anzahl pro Einkauf
        },
        {
            name = 'gps_tracker_24h',
            price = 25000,
            label = 'GPS-Tracker 24 Stunden',
            limit = 2
        },
        {
            name = 'gps_tracker_permanent',
            price = 50000,
            label = 'GPS-Tracker Permanent',
            limit = 1  -- Sehr limitiert wegen hohem Preis
        },
        {
            name = 'gps_remover',
            price = 5000,
            label = 'GPS Remover Tool',
            limit = 5
        }
    },
    
    -- Shop Positionen (Beispiel - Schwarzmarkt)
    locations = {
        -- Schwarzmarkt Position (anpassen nach Bedarf)
        {x = 707.85, y = -966.88, z = 30.41, heading = 0.0}
    }
}

-- Alternative: ox_inventory Shop Format
-- Füge dies zu ox_inventory/data/shops.lua hinzu:
--[[
["gps_blackmarket"] = {
    name = "Schwarzmarkt - GPS Tracker",
    blip = {
        id = 521, colour = 1, scale = 0.7  -- Rote Farbe für Schwarzmarkt
    },
    inventory = {
        { name = 'gps_tracker_1h', price = 10000 },
        { name = 'gps_tracker_24h', price = 25000 },
        { name = 'gps_tracker_permanent', price = 50000 },
        { name = 'gps_remover', price = 5000 }
    },
    locations = {
        vec3(707.85, -966.88, 30.41)
    },
    targets = {
        { loc = vec3(707.85, -966.88, 30.41), length = 0.5, width = 0.5, heading = 0.0, minZ = 29.5, maxZ = 31.0, distance = 2.5 }
    }
}
]]--

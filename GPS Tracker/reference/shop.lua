-- GPS-Tracker Shop Konfiguration für ESX Shops
-- Diese Konfiguration kann zu eurem Shop-System hinzugefügt werden

-- Beispiel für esx_shops oder ox_inventory shops
-- Tracker sollten in einem speziellen "Elektronik-Shop" oder "Schwarzmarkt" verkauft werden

Config.GPSShop = {
    -- Shop Name
    name = "GPS & Elektronik",
    
    -- Shop Items
    items = {
        {
            name = 'gps_tracker_basic',
            price = 2500,
            label = 'GPS-Tracker Basic (5 Min.)',
            limit = 5  -- Maximale Anzahl pro Einkauf
        },
        {
            name = 'gps_tracker_standard',
            price = 5000,
            label = 'GPS-Tracker Standard (10 Min.)',
            limit = 5
        },
        {
            name = 'gps_tracker_advanced',
            price = 8000,
            label = 'GPS-Tracker Advanced (15 Min.)',
            limit = 3
        },
        {
            name = 'gps_tracker_premium',
            price = 15000,
            label = 'GPS-Tracker Premium (30 Min.)',
            limit = 2
        },
        {
            name = 'gps_remover',
            price = 3000,
            label = 'GPS Remover Tool',
            limit = 5
        }
    },
    
    -- Shop Positionen (Beispiel)
    locations = {
        -- Elektronik-Shop in der Stadt
        {x = -656.95, y = -858.03, z = 24.5, heading = 0.0},
        -- Schwarzmarkt (optional)
        {x = 707.85, y = -966.88, z = 30.41, heading = 0.0}
    }
}

-- Alternative: ox_inventory Shop Format
-- Füge dies zu ox_inventory/data/shops.lua hinzu:
--[[
["gps_shop"] = {
    name = "GPS & Elektronik",
    blip = {
        id = 521, colour = 3, scale = 0.8
    },
    inventory = {
        { name = 'gps_tracker_basic', price = 2500 },
        { name = 'gps_tracker_standard', price = 5000 },
        { name = 'gps_tracker_advanced', price = 8000 },
        { name = 'gps_tracker_premium', price = 15000 },
        { name = 'gps_remover', price = 3000 }
    },
    locations = {
        vec3(-656.95, -858.03, 24.5)
    },
    targets = {
        { loc = vec3(-656.95, -858.03, 24.5), length = 0.5, width = 0.5, heading = 0.0, minZ = 24.0, maxZ = 25.0, distance = 2.5 }
    }
}
]]--

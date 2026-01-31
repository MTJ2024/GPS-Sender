local ESX = exports['es_extended']:getSharedObject()
local trackedVehicles = {} -- netId => source
local TRACK_DURATION = 600 -- Sekunden (10 Minuten)

-- Prüfe, ob an das Fahrzeug ein Tracker angebracht werden kann
ESX.RegisterServerCallback('mtj_gps:canAttach', function(source, cb, netId)
    cb(not trackedVehicles[netId])
end)

-- Tracker anbringen
RegisterNetEvent('mtj_gps:attachTracker', function(netId)
    local src = source
    if trackedVehicles[netId] then
        TriggerClientEvent('mtj_gps:uiShowEffect', src, {
            title = "GPS-Tracker schon installiert",
            rpText = "❌ <b>Hier steckt schon ein Tracker in den Kabeln!</b><br>Ein zweites Gerät würde sofort auffallen.",
            status = "inactive",
            signal = "weak",
            time = "00:00",
            color = "#444444",
            effect = "fadeInRed"
        })
        TriggerClientEvent('mtj_gps:notify', src, '❌ An diesem Fahrzeug ist bereits ein Tracker angebracht!')
        return
    end

    -- Inventar-Check
    local removed = exports.ox_inventory:RemoveItem(src, 'gps_tracker', 1)
    if not removed then
        TriggerClientEvent('mtj_gps:uiShowEffect', src, {
            title = "Kein Tracker im Gepäck",
            rpText = "❌ <b>Du tastest deine Taschen ab...<br>Kein GPS-Tracker mehr dabei!</b><br>Such dir einen neuen, um das Ziel zu überwachen.",
            status = "inactive",
            signal = "weak",
            time = "00:00",
            color = "#444444",
            effect = "fadeInRed"
        })
        TriggerClientEvent('mtj_gps:notify', src, '❌ Du besitzt keinen GPS-Tracker im Inventar!')
        return
    end

    -- Tracker aktivieren
    trackedVehicles[netId] = src
    TriggerClientEvent('mtj_gps:trackVehicle', src, netId, TRACK_DURATION)

    TriggerClientEvent('mtj_gps:uiShowEffect', src, {
        title = "GPS-Tracker scharfgestellt",
        rpText = "🛰️ <b>Ein Tracker sitzt nun verborgen im Fahrzeug!</b><br>Jeder deiner Schritte wird live übertragen.<br><span id='trackerHint'>⚠️ Bleib vorsichtig, das Gerät funkt dauerhaft und kann entdeckt werden!</span>",
        status = "active",
        signal = "strong",
        time = string.format("%02d:%02d", math.floor(TRACK_DURATION/60), TRACK_DURATION%60),
        color = "#c0392b",
        effect = "fadeInRed"
    })

    -- Ablauf nach Zeit
    SetTimeout(TRACK_DURATION * 1000, function()
        local trackerSrc = trackedVehicles[netId]
        trackedVehicles[netId] = nil
        if trackerSrc then
            TriggerClientEvent('mtj_gps:removeBlip', trackerSrc, netId)
            TriggerClientEvent('mtj_gps:uiShowEffect', trackerSrc, {
                title = "Signal verloren",
                rpText = "⏰ <b>Der Tracker gibt einen letzten Ping von sich.<br>Das Ziel ist jetzt wieder frei – du bist raus!</b>",
                status = "inactive",
                signal = "weak",
                time = "00:00",
                color = "#444444",
                effect = "fadeInGray"
            })
            SetTimeout(4500, function()
                TriggerClientEvent('mtj_gps:uiHide', trackerSrc)
            end)
        end
    end)
end)

-- Tracker entfernen
RegisterNetEvent('mtj_gps:removeTracker', function(netId)
    local src = source
    local trackerSrc = trackedVehicles[netId]
    if not trackerSrc then
        TriggerClientEvent('mtj_gps:uiShowEffect', src, {
            title = "Nichts zu holen",
            rpText = "ℹ️ <b>Kein GPS-Tracker gefunden.</b><br>Vielleicht war jemand schneller als du?",
            status = "inactive",
            signal = "weak",
            time = "00:00",
            color = "#444444",
            effect = "fadeInGray"
        })
        TriggerClientEvent('mtj_gps:notify', src, "ℹ️ An diesem Fahrzeug war kein GPS-Tracker angebracht.")
        return
    end

    -- Inventar-Check für Remover
    local removed = exports.ox_inventory:RemoveItem(src, 'gps_remover', 1)
    if not removed then
        TriggerClientEvent('mtj_gps:uiShowEffect', src, {
            title = "Kein Werkzeug",
            rpText = "❌ <b>Du brauchst Fingerspitzengefühl.<br>Ohne <b>GPS-Remover</b> riskierst du alles!</b>",
            status = "inactive",
            signal = "weak",
            time = "00:00",
            color = "#444444",
            effect = "fadeInRed"
        })
        TriggerClientEvent('mtj_gps:notify', src, "❌ Du benötigst ein GPS Remover-Tool!")
        return
    end

    trackedVehicles[netId] = nil
    TriggerClientEvent('mtj_gps:removeBlip', trackerSrc, netId)
    TriggerClientEvent('mtj_gps:uiShowEffect', trackerSrc, {
        title = "Tracker entfernt",
        rpText = "🛠️ <b>Jemand hat deinen Tracker aufgespürt und entfernt.</b><br>Die Jagd ist vorbei – fürs Erste.",
        status = "inactive",
        signal = "weak",
        time = "00:00",
        color = "#444444",
        effect = "fadeInGray"
    })
    TriggerClientEvent('mtj_gps:uiShowEffect', src, {
        title = "Mission erfüllt",
        rpText = "✅ <b>Mit ruhiger Hand hebelst du den Tracker heraus.<br>Das Fahrzeug ist wieder clean.</b>",
        status = "inactive",
        signal = "weak",
        time = "00:00",
        color = "#444444",
        effect = "fadeInGray"
    })
    TriggerClientEvent('mtj_gps:notify', src, "✅ GPS-Tracker wurde erfolgreich entfernt!")

    SetTimeout(3500, function()
        TriggerClientEvent('mtj_gps:uiHide', src)
        TriggerClientEvent('mtj_gps:uiHide', trackerSrc)
    end)
end)

-- Admin/Force-Entfernen
RegisterNetEvent("gps:forceRemoveTracker", function(netId)
    local src = source
    local trackerSrc = trackedVehicles[netId]
    if trackerSrc then
        trackedVehicles[netId] = nil
        TriggerClientEvent('mtj_gps:removeBlip', trackerSrc, netId)
        TriggerClientEvent('mtj_gps:uiShowEffect', trackerSrc, {
            title = "Dein Tracker ist Geschichte",
            rpText = "🛠️ <b>Ein Admin hat deinen Tracker kompromisslos entfernt!</b><br>Du wurdest ausgetrickst.",
            status = "inactive",
            signal = "weak",
            time = "00:00",
            color = "#444444",
            effect = "fadeInGray"
        })
        TriggerClientEvent('mtj_gps:uiShowEffect', src, {
            title = "Admin-Zugriff",
            rpText = "✅ <b>Du hast als Admin den Tracker entfernt.<br>Das Ziel ist jetzt frei.</b>",
            status = "inactive",
            signal = "weak",
            time = "00:00",
            color = "#444444",
            effect = "fadeInGray"
        })
        TriggerClientEvent("gps:forceRemoveTracker", src, netId)
        TriggerClientEvent('mtj_gps:notify', src, "✅ GPS-Tracker wurde entfernt!")
        SetTimeout(3500, function()
            TriggerClientEvent('mtj_gps:uiHide', src)
            TriggerClientEvent('mtj_gps:uiHide', trackerSrc)
        end)
    else
        -- Kein Tracker - trotzdem Feedback für den Admin
        TriggerClientEvent('mtj_gps:uiShowEffect', src, {
            title = "Kein Tracker",
            rpText = "ℹ️ <b>Im Ziel-Fahrzeug war kein Tracker versteckt.</b>",
            status = "inactive",
            signal = "weak",
            time = "00:00",
            color = "#444444",
            effect = "fadeInGray"
        })
        TriggerClientEvent("gps:forceRemoveTracker", src, netId)
    end
end)
local ESX = exports['es_extended']:getSharedObject()
local trackedVehicles = {} -- netId => {source, trackerType, duration}

-- Prüfe, ob an das Fahrzeug ein Tracker angebracht werden kann
ESX.RegisterServerCallback('mtj_gps:canAttach', function(source, cb, netId)
    cb(not trackedVehicles[netId])
end)

-- Prüfe welche Tracker der Spieler besitzt
ESX.RegisterServerCallback('mtj_gps:getAvailableTrackers', function(source, cb)
    local xPlayer = ESX.GetPlayerFromId(source)
    if not xPlayer then 
        cb({})
        return 
    end
    
    local availableTrackers = {}
    for _, trackerType in ipairs(Config.TrackerTypes) do
        local count = exports.ox_inventory:GetItemCount(source, trackerType.item)
        if count and count > 0 then
            table.insert(availableTrackers, {
                item = trackerType.item,
                label = trackerType.label,
                duration = trackerType.duration,
                description = trackerType.description,
                icon = trackerType.icon,
                count = count
            })
        end
    end
    cb(availableTrackers)
end)

-- Tracker anbringen
RegisterNetEvent('mtj_gps:attachTracker', function(netId, trackerItem)
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

    -- Finde den Tracker-Typ in der Config
    local trackerConfig = nil
    for _, trackerType in ipairs(Config.TrackerTypes) do
        if trackerType.item == trackerItem then
            trackerConfig = trackerType
            break
        end
    end

    if not trackerConfig then
        TriggerClientEvent('mtj_gps:notify', src, '❌ Ungültiger Tracker-Typ!')
        return
    end

    -- Inventar-Check
    local removed = exports.ox_inventory:RemoveItem(src, trackerItem, 1)
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
    local TRACK_DURATION = trackerConfig.duration
    trackedVehicles[netId] = {
        source = src,
        trackerType = trackerItem,
        duration = TRACK_DURATION
    }
    TriggerClientEvent('mtj_gps:trackVehicle', src, netId, TRACK_DURATION)

    TriggerClientEvent('mtj_gps:uiShowEffect', src, {
        title = "GPS-Tracker scharfgestellt",
        rpText = "🛰️ <b>Ein "..trackerConfig.label.." sitzt nun verborgen im Fahrzeug!</b><br>Jeder deiner Schritte wird live übertragen.<br><span id='trackerHint'>⚠️ Bleib vorsichtig, das Gerät funkt dauerhaft und kann entdeckt werden!</span>",
        status = "active",
        signal = "strong",
        time = string.format("%02d:%02d", math.floor(TRACK_DURATION/60), TRACK_DURATION%60),
        color = "#c0392b",
        effect = "fadeInRed"
    })

    -- Ablauf nach Zeit
    SetTimeout(TRACK_DURATION * 1000, function()
        if trackedVehicles[netId] then
            local trackerSrc = trackedVehicles[netId].source
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
        end
    end)
end)

-- Tracker entfernen
RegisterNetEvent('mtj_gps:removeTracker', function(netId)
    local src = source
    local trackerData = trackedVehicles[netId]
    if not trackerData then
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

    local trackerSrc = trackerData.source
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
    local trackerData = trackedVehicles[netId]
    if trackerData then
        local trackerSrc = trackerData.source
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
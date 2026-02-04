-- ESX Initialisierung (NEU ab ESX Legacy 1.12+)
local ESX = exports['es_extended']:getSharedObject()

local myBlips = {}
local trackerTimers = {}
local trackerThreads = {}

-- Cache für Inventar-Status (für canInteract Performance)
local inventoryCache = {
    hasTracker = false,
    hasRemover = false,
    lastUpdate = 0
}

-- Update Inventar-Cache regelmäßig
CreateThread(function()
    while true do
        Wait(2000) -- Alle 2 Sekunden aktualisieren
        
        ESX.TriggerServerCallback('mtj_gps:hasAnyTracker', function(hasTracker)
            inventoryCache.hasTracker = hasTracker
            inventoryCache.lastUpdate = GetGameTimer()
        end)
        
        ESX.TriggerServerCallback('mtj_gps:hasRemover', function(hasRemover)
            inventoryCache.hasRemover = hasRemover
        end)
    end
end)


-- Helper: Info-Panel (wie im Shuttle-UI)
function showInfo(message, color)
    -- Immer mindestens 3 Sekunden anzeigen!
    SendNUIMessage({ action = "showInfo", text = message, color = color or "grey", sec = 3 })
end

function showTimerUI(seconds, color)
    local min = math.floor(seconds / 60)
    local sec = seconds % 60
    local timeStr = string.format("%02d:%02d", min, sec)
    SendNUIMessage({ action = "showTimer", time = timeStr, color = color or "red" })
end

function hideTimerUI()
    SendNUIMessage({ action = "hideTimer" })
end

function playTrackerUiAnimation(params)
    -- Alternative Animationen:
    -- "PROP_HUMAN_BUM_BIN" (knien/kauern), "WORLD_HUMAN_WELDING" (schweißen), "WORLD_HUMAN_HAMMERING"
    TaskStartScenarioInPlace(PlayerPedId(), "PROP_HUMAN_BUM_BIN", 0, true)
    showInfo(params.title or "Bitte warten...", "grey")
    Citizen.Wait(params.duration or 7000)
    ClearPedTasks(PlayerPedId())
    if params.finishTitle then
        showInfo(params.finishTitle, params.finishStatus == "error" and "red" or "grey")
    end
end

function startTrackerTimer(netId, duration)
    trackerTimers[netId] = tonumber(duration) or 600
    trackerThreads[netId] = true
    showTimerUI(trackerTimers[netId], "red")

    CreateThread(function()
        while trackerThreads[netId] and trackerTimers[netId] and trackerTimers[netId] > 0 do
            Wait(1000)
            trackerTimers[netId] = trackerTimers[netId] - 1
            showTimerUI(trackerTimers[netId], "red")
        end
        if trackerThreads[netId] and trackerTimers[netId] and trackerTimers[netId] <= 0 then
            trackerThreads[netId] = nil
            trackerTimers[netId] = nil
            showTimerUI(0, "gray")
            showInfo("⏰ <b>Der GPS-Tracker verstummt!</b><br><span style='color:#ff4a4a'>Das Signal ist tot – Zeit zu verschwinden!</span>", "red")
            Citizen.Wait(3000)
            hideTimerUI()
        end
    end)
end

function stopTrackerEvent(netId)
    trackerThreads[netId] = nil
    trackerTimers[netId] = nil
    if myBlips[netId] then
        if DoesBlipExist(myBlips[netId]) then RemoveBlip(myBlips[netId]) end
        myBlips[netId] = nil
    end
    hideTimerUI()
end

-- EVENTS

RegisterNetEvent('mtj_gps:trackVehicle', function(netId, duration)
    local vehicle = NetworkGetEntityFromNetworkId(netId)
    if not DoesEntityExist(vehicle) then
        showInfo("🚫 <b>GPS-Fehler:</b><br><span style='color:#ff4a4a'>Das Ziel-Fahrzeug ist wie vom Erdboden verschluckt!</span>", "red")
        return
    end
    stopTrackerEvent(netId)
    local blip = AddBlipForEntity(vehicle)
    SetBlipSprite(blip, 225)
    SetBlipColour(blip, 1)
    SetBlipScale(blip, 1.0)
    SetBlipAsShortRange(blip, false)
    BeginTextCommandSetBlipName("STRING")
    AddTextComponentString("GPS-Tracker")
    EndTextCommandSetBlipName(blip)
    myBlips[netId] = blip

    startTrackerTimer(netId, duration)
    showInfo("🚨 <b>Das Fahrzeug ist jetzt unter Beobachtung!</b><br><span style='color:#ff4a4a'>Jeder Meter zählt. Restzeit: <b>"..math.floor((tonumber(duration) or 600)/60).." Min.</b></span>", "grey")
end)

RegisterNetEvent('mtj_gps:removeBlip', function(netId)
    stopTrackerEvent(netId)
    showInfo("🛠️ <b>Du hast den Tracker mit ruhiger Hand entfernt.<br>Hoffentlich warst du unauffällig...</b>", "grey")
    Citizen.Wait(3000)
    hideTimerUI()
end)

RegisterNetEvent('gps:forceRemoveTracker', function(netId)
    stopTrackerEvent(netId)
    showInfo("👮 <b>Ein Admin hat den Tracker kompromisslos entfernt.<br>Du bist fürs Erste sicher.</b>", "red")
    Citizen.Wait(3000)
    hideTimerUI()
end)

RegisterNetEvent('mtj_gps:notify', function(msg)
    showInfo("⚠️ <b>Warnung:</b> <span style='color:#ff4a4a'>"..msg.."</span>", "red")
end)

-- OX_TARGET: GPS-Menü fürs Fahrzeug
-- Warte bis ox_target geladen ist
CreateThread(function()
    -- Warte auf ox_target
    while GetResourceState('ox_target') ~= 'started' do
        Wait(100)
    end
    
    -- Registriere ox_target Optionen
    exports.ox_target:addGlobalVehicle({
        {
            label = 'GPS-Tracker anbringen',
            icon = 'fa-solid fa-location-dot',
            distance = 2.0,
            onSelect = function(data)
                local ent = data.entity
                local netId = NetworkGetNetworkIdFromEntity(ent)
                ESX.TriggerServerCallback('mtj_gps:canAttach', function(canAttach)
                    if canAttach then
                        -- Hole verfügbare Tracker vom Server
                        ESX.TriggerServerCallback('mtj_gps:getAvailableTrackers', function(availableTrackers)
                            if #availableTrackers == 0 then
                                showInfo("❌ <b>Keine GPS-Tracker!</b><br><span style='color:#ff4a4a'>Du hast keinen Tracker im Inventar.</span>", "red")
                                return
                            end

                            -- Erstelle Menü-Optionen
                            local menuOptions = {}
                            for _, tracker in ipairs(availableTrackers) do
                                local minutes = math.floor(tracker.duration / 60)
                                table.insert(menuOptions, {
                                    title = tracker.icon .. ' ' .. tracker.label,
                                    description = tracker.description .. ' | Anzahl: ' .. tracker.count,
                                    icon = 'location-dot',
                                    onSelect = function()
                                        playTrackerUiAnimation{
                                            title = "🔧 Du schiebst den " .. tracker.label .. " tief ins Motorblock-Versteck.<br><i>Hoffentlich merkt das keiner ...</i>",
                                            duration = 10000,
                                            finishTitle = "✅ <b>GPS-Tracker installiert!</b><br><span style='color:#5fff77'>Niemand scheint dich bemerkt zu haben.</span>",
                                            finishStatus = "success"
                                        }
                                        TriggerServerEvent('mtj_gps:attachTracker', netId, tracker.item)
                                    end
                                })
                            end

                            -- Zeige Auswahl-Menü mit ox_lib
                            lib.registerContext({
                                id = 'gps_tracker_menu',
                                title = '📍 GPS-Tracker auswählen',
                                options = menuOptions
                            })
                            lib.showContext('gps_tracker_menu')
                        end)
                    else
                        showInfo("❌ <b>Achtung:</b> Hier ist bereits ein Tracker installiert.<br><span style='color:#ff4a4a'>Riskier nicht zu viel ...</span>", "red")
                    end
                end, netId)
            end,
            canInteract = function(entity)
                local netId = NetworkGetNetworkIdFromEntity(entity)
                -- Nur wenn kein Tracker am Fahrzeug UND Spieler hat mindestens einen Tracker
                return not trackerTimers[netId] and inventoryCache.hasTracker
            end
        },
        {
            label = 'GPS-Tracker entfernen',
            icon = 'fa-solid fa-location-xmark',
            distance = 2.0,
            onSelect = function(data)
                playTrackerUiAnimation{
                    title = "🛠️ Mit zittrigen Händen löst du vorsichtig den Tracker ...",
                    duration = 10000,
                    finishTitle = "✔️ <b>Tracker entfernt!</b><br><span style='color:#5fff77'>Zeit, die Szene zu verlassen.</span>",
                    finishStatus = "success"
                }
                local netId = NetworkGetNetworkIdFromEntity(data.entity)
                TriggerServerEvent('mtj_gps:removeTracker', netId)
            end,
            canInteract = function(entity)
                local netId = NetworkGetNetworkIdFromEntity(entity)
                -- Nur wenn Tracker am Fahrzeug UND Spieler hat Remover Tool
                return trackerTimers[netId] and inventoryCache.hasRemover
            end
        },
        {
            label = 'GPS-Tracker scannen',
            icon = 'fa-solid fa-magnifying-glass',
            distance = 2.0,
            onSelect = function(data)
                playTrackerUiAnimation{
                    title = "🔎 Du lauschst und suchst nach versteckter Elektronik ...",
                    duration = 5000,
                }
                local netId = NetworkGetNetworkIdFromEntity(data.entity)
                SetTimeout(5200, function()
                    if trackerTimers[netId] then
                        showInfo("✅ <b>Tracker entdeckt!</b><br>Jemand hat hier große Pläne ...", "grey")
                        Citizen.Wait(2000)
                        -- Tracker entfernen
                        TriggerServerEvent('mtj_gps:removeTracker', netId)
                        Citizen.Wait(500) -- kleiner Delay, um Event zu verarbeiten
                        showInfo("✔️ <b>Tracker entfernt!</b><br><span style='color:#5fff77'>Zeit, die Szene zu verlassen.</span>", "success")
                    else
                        showInfo("❌ <b>Kein Tracker gefunden.</b><br>Aber sicher ist sicher – lieber weiter beobachten ...", "grey")
                    end
                end)
            end,
            canInteract = function(entity)
                -- Scannen erfordert GPS Remover Tool (zum Scannen und ggf. Entfernen)
                return inventoryCache.hasRemover
            end
        }
    })
    
    print('^2[MTJ GPS] ox_target erfolgreich initialisiert!^0')
end)


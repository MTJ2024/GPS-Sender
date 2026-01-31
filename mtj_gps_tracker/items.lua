-- GPS Tracker Items - Auto-Registration für ox_inventory
-- Diese Datei registriert die Items automatisch bei ox_inventory

if GetResourceState('ox_inventory') == 'started' then
    exports('Items', function()
        return {
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

            ['gps_remover'] = {
                label = 'GPS Remover Tool',
                weight = 180,
                stack = true,
                close = true,
                description = 'Spezielles Werkzeug zum Entfernen von GPS-Trackern. Vorsicht ist geboten!',
                client = {
                    image = 'gps_remover.png',
                }
            }
        }
    end)
end

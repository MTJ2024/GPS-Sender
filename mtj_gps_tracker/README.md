# MTJ GPS Tracker - Illegales Tracking System

## 🚨 WICHTIG: Installation

### Schritt 1: Resource installieren
Kopiere den Ordner `mtj_gps_tracker` nach `resources/[esx]/mtj_gps_tracker`

### Schritt 2: Items zu ox_inventory hinzufügen
**KRITISCH:** Öffne `ox_inventory/data/items.lua` und füge MANUELL folgende Items ein:

```lua
['gps_tracker_1h'] = {
    label = 'GPS-Tracker 1 Stunde',
    weight = 200,
    stack = true,
    close = true,
    description = 'Illegaler GPS-Tracker mit 1 Stunde Laufzeit.',
    client = {
        image = 'gps_tracker.png',
    }
},

['gps_tracker_24h'] = {
    label = 'GPS-Tracker 24 Stunden',
    weight = 250,
    stack = true,
    close = true,
    description = 'Illegaler GPS-Tracker mit 24 Stunden Laufzeit.',
    client = {
        image = 'gps_tracker.png',
    }
},

['gps_tracker_permanent'] = {
    label = 'GPS-Tracker Permanent',
    weight = 300,
    stack = true,
    close = true,
    description = 'Illegaler GPS-Tracker mit Dauer-Funktion (7 Tage).',
    client = {
        image = 'gps_tracker.png',
    }
},

['gps_remover'] = {
    label = 'GPS Remover Tool',
    weight = 180,
    stack = true,
    close = true,
    description = 'Werkzeug zum Entfernen von GPS-Trackern.',
    client = {
        image = 'gps_remover.png',
    }
},
```

### Schritt 3: Server.cfg
Füge zu deiner `server.cfg` hinzu:
```
ensure mtj_gps_tracker
```

### Schritt 4: Restart
```
restart ox_inventory
restart mtj_gps_tracker
```

## Items testen
```
/giveitem [name] gps_tracker_1h 3
/giveitem [name] gps_tracker_24h 2
/giveitem [name] gps_tracker_permanent 1
/giveitem [name] gps_remover 5
```

## Tracker-Typen

| Item | Laufzeit | Preis | Verwendung |
|------|----------|-------|------------|
| gps_tracker_1h | 60 Min | 10.000€ | Kurzzeitüberwachung |
| gps_tracker_24h | 1 Tag | 25.000€ | Ganztägige Observation |
| gps_tracker_permanent | 7 Tage | 50.000€ | Langzeit-Tracking |
| gps_remover | - | 5.000€ | Tracker entfernen |

## Verwendung

**📋 Vollständige Befehlsliste:** Siehe [COMMANDS.md](COMMANDS.md)

### Schnellstart:

1. GPS-Tracker im Inventar haben
2. Zu einem Fahrzeug gehen
3. Alt drücken (ox_target)
4. "GPS-Tracker anbringen" wählen
5. Tracker-Typ aus Menü wählen
6. 10 Sekunden warten
7. Tracker ist aktiv!

### Alle verfügbaren Aktionen:
- **GPS-Tracker anbringen** - Tracker am Fahrzeug installieren (benötigt Tracker-Item)
- **GPS-Tracker entfernen** - Tracker entfernen (benötigt GPS Remover Tool)
- **GPS-Tracker scannen** - Fahrzeug auf Tracker prüfen (kostenlos!)

## Support

Bei Problemen:
1. Stelle sicher ox_inventory läuft
2. Prüfe ob Items in ox_inventory/data/items.lua sind
3. Restart ox_inventory und mtj_gps_tracker
4. Prüfe F8 Console auf Fehler

## Abhängigkeiten

- ESX Legacy 1.12+
- ox_lib
- ox_target
- ox_inventory

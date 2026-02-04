# GPS-Tracker Installation & Setup Guide

## Schritt-für-Schritt Installation

### 1. Ressource installieren

1. Benenne den Ordner `GPS Tracker` um zu `mtj_gps_tracker`
2. Kopiere den Ordner nach `resources/[esx]/mtj_gps_tracker`

### 2. Items zu ox_inventory hinzufügen

Öffne die Datei `ox_inventory/data/items.lua` und füge folgende Items hinzu (siehe auch `mtj_gps_tracker/reference/items.lua`):

```lua
-- GPS Tracker Items (Illegales System)
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
},
```

### 3. Bilder hinzufügen (Optional)

Erstelle oder füge folgende Bilder hinzu:
- `ox_inventory/web/images/gps_tracker.png` (für alle Tracker-Typen)
- `ox_inventory/web/images/gps_remover.png`

Falls du keine eigenen Bilder hast, kannst du temporär ein Platzhalter-Bild verwenden.

### 4. Shop einrichten (Schwarzmarkt empfohlen!)

#### Option A: ox_inventory Shop

Öffne `ox_inventory/data/shops.lua` und füge hinzu (siehe auch `mtj_gps_tracker/reference/shop.lua`):

```lua
["gps_blackmarket"] = {
    name = "Schwarzmarkt - GPS Tracker",
    blip = {
        id = 521, 
        colour = 1,  -- Rot für Schwarzmarkt
        scale = 0.7
    },
    inventory = {
        { name = 'gps_tracker_1h', price = 10000 },
        { name = 'gps_tracker_24h', price = 25000 },
        { name = 'gps_tracker_permanent', price = 50000 },
        { name = 'gps_remover', price = 5000 }
    },
    locations = {
        vec3(707.85, -966.88, 30.41)  -- Schwarzmarkt-Position
    },
    targets = {
        { 
            loc = vec3(707.85, -966.88, 30.41), 
            length = 0.5, 
            width = 0.5, 
            heading = 0.0, 
            minZ = 29.5, 
            maxZ = 31.0, 
            distance = 2.5 
        }
    }
}
```

#### Option B: Eigenes Shop-System

Nutze die Preise aus `config.lua` (Schwarzmarkt-Preise):
- GPS-Tracker 1 Stunde: 10.000€
- GPS-Tracker 24 Stunden: 25.000€
- GPS-Tracker Permanent: 50.000€
- GPS Remover: 5.000€

### 5. Server.cfg aktualisieren

Füge folgende Zeile zu deiner `server.cfg` hinzu:

```cfg
ensure mtj_gps_tracker
```

Stelle sicher, dass folgende Ressourcen VORHER geladen werden:
```cfg
ensure ox_lib
ensure ox_target
ensure ox_inventory
ensure es_extended
ensure mtj_gps_tracker
```

### 6. Server neu starten

```bash
# Im Server-Terminal
restart mtj_gps_tracker
# oder kompletter Server-Neustart
```

## Testen der Installation

### Test 1: Items im Inventar
1. Gib dir Items mit Admin-Befehlen:
   ```
   /giveitem [dein_name] gps_tracker_1h 3
   /giveitem [dein_name] gps_tracker_24h 2
   /giveitem [dein_name] gps_tracker_permanent 1
   /giveitem [dein_name] gps_remover 2
   ```

### Test 2: Tracker anbringen
1. Gehe zu einem geparkten Fahrzeug
2. Drücke Alt (ox_target)
3. Wähle "GPS-Tracker anbringen"
4. Es sollte ein Menü mit deinen verfügbaren Trackern erscheinen
5. Wähle einen Tracker aus
6. Warte 10 Sekunden
7. Der Timer sollte links am Bildschirm erscheinen

### Test 3: Tracker entfernen
1. Gehe zum Fahrzeug mit Tracker
2. Drücke Alt (ox_target)
3. Wähle "GPS-Tracker entfernen"
4. Warte 10 Sekunden
5. Der Tracker sollte entfernt sein

## Fehlerbehebung

### Problem: "No such export GetItemCount in resource ox_inventory"
**Lösung**: Aktualisiere ox_inventory auf die neueste Version

### Problem: Menü erscheint nicht beim Tracker anbringen
**Lösung**: 
1. Stelle sicher, dass ox_lib korrekt installiert ist
2. Prüfe die F8-Konsole auf Fehler
3. Restart von ox_lib: `restart ox_lib`

### Problem: Items nicht im Inventar sichtbar
**Lösung**: 
1. Prüfe ob die Items in `ox_inventory/data/items.lua` richtig hinzugefügt wurden
2. Restart ox_inventory: `restart ox_inventory`
3. Prüfe ob die Bilder vorhanden sind

### Problem: Timer wird nicht angezeigt
**Lösung**: 
1. Öffne F12 (Browser-Konsole)
2. Prüfe auf JavaScript-Fehler
3. Stelle sicher, dass alle HTML/CSS/JS Dateien vorhanden sind

## Konfiguration anpassen

Alle Einstellungen können in `mtj_gps_tracker/config.lua` angepasst werden:

### Laufzeiten ändern
```lua
Config.TrackerTypes = {
    {
        item = 'gps_tracker_basic',
        duration = 300,  -- <-- Hier ändern (in Sekunden)
        -- ...
    }
}
```

### Preise ändern
```lua
Config.TrackerTypes = {
    {
        item = 'gps_tracker_basic',
        price = 2500,  -- <-- Hier ändern
        -- ...
    }
}
```

### Neue Tracker-Typen hinzufügen
```lua
Config.TrackerTypes = {
    -- ... bestehende Tracker ...
    {
        item = 'gps_tracker_ultra',
        label = 'GPS-Tracker Ultra',
        duration = 3600,  -- 60 Minuten
        price = 25000,
        description = '60 Min. Laufzeit - Ultimative Überwachung',
        icon = '🚀'
    }
}
```

Vergiss nicht, das neue Item auch zu ox_inventory hinzuzufügen!

## Support

Bei Problemen:
1. Prüfe die F8-Konsole auf Fehler
2. Prüfe die Server-Konsole auf Fehler
3. Stelle sicher, dass alle Abhängigkeiten installiert sind
4. Prüfe die ox_inventory Items-Konfiguration

## Abhängigkeiten

Erforderlich:
- ✅ ESX Legacy 1.12 oder neuer
- ✅ ox_lib (neueste Version)
- ✅ ox_target (neueste Version)
- ✅ ox_inventory (neueste Version)

## Performance

Das Script ist optimiert für:
- ⚡ Minimale Server-Last
- ⚡ Effiziente Client-Side-Verarbeitung
- ⚡ Keine permanenten Threads bei inaktiven Trackern
- ⚡ Automatische Cleanup nach Ablauf

## Sicherheit

- ✅ Alle Items werden server-seitig validiert
- ✅ Keine Client-Side-Item-Manipulation möglich
- ✅ ox_inventory native Integration
- ✅ ESX-Callbacks für sichere Kommunikation

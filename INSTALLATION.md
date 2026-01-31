# GPS-Tracker Installation & Setup Guide

## Schritt-für-Schritt Installation

### 1. Ressource installieren

1. Benenne den Ordner `GPS Tracker` um zu `mtj_gps_tracker`
2. Kopiere den Ordner nach `resources/[esx]/mtj_gps_tracker`

### 2. Items zu ox_inventory hinzufügen

Öffne die Datei `ox_inventory/data/items.lua` und füge folgende Items hinzu:

```lua
-- GPS Tracker Items
['gps_tracker_basic'] = {
    label = 'GPS-Tracker Basic',
    weight = 150,
    stack = true,
    close = true,
    description = 'Ein einfacher GPS-Tracker mit 5 Minuten Laufzeit. Perfekt für schnelle Verfolgungen.',
    client = {
        image = 'gps_tracker.png',
    }
},

['gps_tracker_standard'] = {
    label = 'GPS-Tracker Standard',
    weight = 200,
    stack = true,
    close = true,
    description = 'Ein solider GPS-Tracker mit 10 Minuten Laufzeit. Der bewährte Standard.',
    client = {
        image = 'gps_tracker.png',
    }
},

['gps_tracker_advanced'] = {
    label = 'GPS-Tracker Advanced',
    weight = 250,
    stack = true,
    close = true,
    description = 'Ein verbesserter GPS-Tracker mit 15 Minuten Laufzeit. Für längere Verfolgungen.',
    client = {
        image = 'gps_tracker.png',
    }
},

['gps_tracker_premium'] = {
    label = 'GPS-Tracker Premium',
    weight = 300,
    stack = true,
    close = true,
    description = 'Ein Premium GPS-Tracker mit 30 Minuten Laufzeit. Top-Qualität für professionelle Überwachung.',
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

### 4. Shop einrichten (Optional aber empfohlen)

#### Option A: ox_inventory Shop

Öffne `ox_inventory/data/shops.lua` und füge hinzu:

```lua
["gps_shop"] = {
    name = "GPS & Elektronik",
    blip = {
        id = 521, 
        colour = 3, 
        scale = 0.8
    },
    inventory = {
        { name = 'gps_tracker_basic', price = 2500 },
        { name = 'gps_tracker_standard', price = 5000 },
        { name = 'gps_tracker_advanced', price = 8000 },
        { name = 'gps_tracker_premium', price = 15000 },
        { name = 'gps_remover', price = 3000 }
    },
    locations = {
        vec3(-656.95, -858.03, 24.5)  -- Beispiel-Position
    },
    targets = {
        { 
            loc = vec3(-656.95, -858.03, 24.5), 
            length = 0.5, 
            width = 0.5, 
            heading = 0.0, 
            minZ = 24.0, 
            maxZ = 25.0, 
            distance = 2.5 
        }
    }
}
```

#### Option B: Eigenes Shop-System

Nutze die Preise aus `config.lua`:
- GPS-Tracker Basic: 2.500€
- GPS-Tracker Standard: 5.000€
- GPS-Tracker Advanced: 8.000€
- GPS-Tracker Premium: 15.000€
- GPS Remover: 3.000€

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
   /giveitem [dein_name] gps_tracker_basic 5
   /giveitem [dein_name] gps_tracker_standard 3
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

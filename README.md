# GPS-Sender / GPS-Tracker System für ESX Legacy FiveM RP

Ein professionelles **illegales** GPS-Tracker-System für ESX Legacy mit realistischen Laufzeiten und Schwarzmarkt-Preisen.

## Features

✅ **3 Tracker-Typen** mit realistischen Laufzeiten:
- ⏱️ **1 Stunde** - 60 Minuten Echtzeit (10.000€)
- 📅 **24 Stunden** - 1 Tag Echtzeit (25.000€)
- 💎 **Permanent** - 7 Tage Dauerüberwachung (50.000€)

✅ **Interaktives UI** mit Timer-Anzeige und RP-Texten  
✅ **ox_target** Integration für intuitive Bedienung  
✅ **ox_lib** Menüsystem zur Tracker-Auswahl  
✅ **ox_inventory** vollständig kompatibel  
✅ **ESX Legacy 1.12+** optimiert  
✅ **GPS Remover Tool** zum Entfernen von Trackern  
✅ **Admin-Befehle** zum Force-Remove  
✅ **Schwarzmarkt-System** mit höheren Preisen für illegale Überwachung

## Installation

### 1. Ressource installieren
```bash
# Kopiere den "GPS Tracker" Ordner nach resources/[esx]/mtj_gps_tracker
```

### 2. Items zu ox_inventory hinzufügen
Öffne `ox_inventory/data/items.lua` und füge die Items aus `reference/items.lua` hinzu:
- `gps_tracker_1h` - 1 Stunde Tracker
- `gps_tracker_24h` - 24 Stunden Tracker
- `gps_tracker_permanent` - Permanent Tracker
- `gps_remover` - GPS Remover Tool

### 3. Shop einrichten (Optional)
Füge die GPS-Tracker zu deinem Shop-System hinzu. Beispielkonfiguration findest du in `reference/shop.lua`.

**Hinweis:** Für ein illegales System sollten die Tracker im Schwarzmarkt verkauft werden!

Für ox_inventory shops:
- Öffne `ox_inventory/data/shops.lua`
- Füge den GPS-Shop aus `reference/shop.lua` hinzu

### 4. Server.cfg anpassen
```lua
ensure ox_lib
ensure ox_target
ensure ox_inventory
ensure es_extended
ensure mtj_gps_tracker
```

### 5. Ressource starten
```bash
restart mtj_gps_tracker
```

## Nutzung

### Tracker anbringen
1. Gehe zu einem Fahrzeug
2. Öffne das ox_target Menü (Standard: Alt)
3. Wähle "GPS-Tracker anbringen"
4. Wähle den gewünschten Tracker-Typ aus dem Menü
5. Warte 10 Sekunden während der Animation
6. Der Tracker ist aktiv!

### Tracker entfernen
1. Benötigt: **GPS Remover Tool** im Inventar
2. Gehe zum Fahrzeug mit Tracker
3. Öffne das ox_target Menü
4. Wähle "GPS-Tracker entfernen"
5. Warte 10 Sekunden während der Animation

### Tracker scannen
1. Gehe zum verdächtigen Fahrzeug
2. Öffne das ox_target Menü
3. Wähle "GPS-Tracker scannen"
4. Das System zeigt an, ob ein Tracker vorhanden ist
5. Bei Fund wird der Tracker automatisch entfernt

## Konfiguration

Alle Einstellungen findest du in `config.lua`:

```lua
Config.TrackerTypes = {
    {
        item = 'gps_tracker_1h',
        label = 'GPS-Tracker 1 Stunde',
        duration = 3600,  -- 1 Stunde (60 Minuten)
        price = 10000,
        description = '1 Std. Echtzeit - Kurzzeitüberwachung',
        icon = '⏱️'
    },
    {
        item = 'gps_tracker_24h',
        label = 'GPS-Tracker 24 Stunden',
        duration = 86400,  -- 24 Stunden (1 Tag)
        price = 25000,
        description = '1 Tag Echtzeit - Ganztägige Überwachung',
        icon = '📅'
    },
    {
        item = 'gps_tracker_permanent',
        label = 'GPS-Tracker Permanent',
        duration = 604800,  -- 7 Tage (praktisch permanent)
        price = 50000,
        description = 'Dauer-Tracking - Langzeit-Überwachung',
        icon = '💎'
    }
    -- ... weitere Tracker-Typen
}
```

### Tracker-Typen anpassen
Du kannst eigene Tracker-Typen hinzufügen oder bestehende anpassen:
- `item`: Item-Name im Inventar
- `label`: Anzeigename im Menü
- `duration`: Laufzeit in Sekunden
- `price`: Preis beim Kauf (für Shop-Integration)
- `description`: Beschreibung im Menü
- `icon`: Emoji-Icon für die Anzeige

## Admin Befehle

### Force Remove (via Event)
```lua
TriggerServerEvent('gps:forceRemoveTracker', netId)
```

## Abhängigkeiten

- ✅ ESX Legacy 1.12+
- ✅ ox_lib
- ✅ ox_target
- ✅ ox_inventory

## Support & Anpassungen

Dieses Script ist vollständig konfigurierbar und kann an deine Server-Bedürfnisse angepasst werden.

### Mögliche Erweiterungen:
- 🔧 Integration mit bestehenden Job-Systemen
- 🔧 Weitere Tracker-Typen mit speziellen Fähigkeiten
- 🔧 Blip-Farben je nach Tracker-Typ
- 🔧 Benachrichtigungen bei Tracker-Entdeckung
- 🔧 Statistiken & Logging

## Credits

- **Author**: MTJ2024
- **Version**: 2.0.0
- **Framework**: ESX Legacy
- **UI**: Custom HTML/CSS/JS

## Changelog

### Version 2.0.0
- ✅ Mehrere Tracker-Typen implementiert (Basic, Standard, Advanced, Premium)
- ✅ Unterschiedliche Laufzeiten (5, 10, 15, 30 Minuten)
- ✅ Preissystem für verschiedene Tracker
- ✅ ox_lib Menüsystem zur Tracker-Auswahl
- ✅ Konfigurationsdatei für einfache Anpassungen
- ✅ Shop-Integration vorbereitet
- ✅ Umfangreiche Dokumentation

### Version 1.0.0
- ✅ Basis GPS-Tracker System
- ✅ ox_target Integration
- ✅ UI mit Timer-Anzeige


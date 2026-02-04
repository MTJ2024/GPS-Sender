# v2.1.2 - Item Requirement Fix

## Problem
GPS-Tracker Aktionen (Anbringen, Entfernen, Scannen) konnten OHNE die entsprechenden Items im Inventar ausgeführt werden. Die ox_target Optionen waren immer sichtbar, egal ob man die Items hatte oder nicht.

## Lösung
Alle drei Aktionen erfordern jetzt die entsprechenden Items:

### 1. GPS-Tracker anbringen
**Vorher:** Menü erschien immer, Fehlermeldung erst beim Klick
**Jetzt:** Menü erscheint NUR wenn Spieler mindestens einen GPS-Tracker hat

**Erforderlich:** `gps_tracker_1h` ODER `gps_tracker_24h` ODER `gps_tracker_permanent`

### 2. GPS-Tracker entfernen
**Vorher:** Menü erschien immer wenn Tracker am Fahrzeug war
**Jetzt:** Menü erscheint NUR wenn Spieler GPS Remover Tool hat

**Erforderlich:** `gps_remover`

### 3. GPS-Tracker scannen
**Vorher:** Immer verfügbar (kostenlos)
**Jetzt:** Erfordert GPS Remover Tool

**Erforderlich:** `gps_remover`

**Begründung:** Scannen nutzt das gleiche Werkzeug wie Entfernen. Macht mehr Sinn für ein illegales System.

## Technische Änderungen

### server.lua
Neue Server-Callbacks hinzugefügt:
- `mtj_gps:hasAnyTracker` - Prüft ob Spieler irgendeinen GPS-Tracker hat
- `mtj_gps:hasRemover` - Prüft ob Spieler GPS Remover Tool hat

### client.lua
1. **Inventar-Cache System:**
   - Cache wird alle 2 Sekunden aktualisiert
   - Vermeidet Performance-Probleme durch zu viele Callbacks
   - Speichert `hasTracker` und `hasRemover` Status

2. **canInteract Funktionen aktualisiert:**
   - Anbringen: `not trackerTimers[netId] and inventoryCache.hasTracker`
   - Entfernen: `trackerTimers[netId] and inventoryCache.hasRemover`
   - Scannen: `inventoryCache.hasRemover`

## Breaking Change?
**JA** - Scannen ist nicht mehr kostenlos!

Wenn du das alte Verhalten (kostenloses Scannen) behalten willst, ändere in client.lua:
```lua
-- Zeile 244
canInteract = function(entity)
    return true  -- Immer verfügbar
end
```

## Migration
Keine Migration nötig. Script funktioniert sofort nach Update.

Spieler müssen jetzt die richtigen Items haben:
- Zum Anbringen: GPS-Tracker
- Zum Entfernen: GPS Remover
- Zum Scannen: GPS Remover

# Reference Files / Referenz-Dateien

Diese Dateien sind **keine ausführbaren Scripts** für das GPS-Tracker-System. Sie sind **Vorlagen und Referenzen**, die du in andere Ressourcen kopieren musst.

## 📁 Enthaltene Dateien

### `items.lua`
**Zweck:** Item-Definitionen für ox_inventory

**Verwendung:**
1. Öffne `ox_inventory/data/items.lua` auf deinem Server
2. Kopiere die Item-Definitionen aus dieser Datei
3. Füge sie in die items.lua von ox_inventory ein

**Enthält:**
- `gps_tracker_basic` - Basic GPS-Tracker
- `gps_tracker_standard` - Standard GPS-Tracker
- `gps_tracker_advanced` - Advanced GPS-Tracker
- `gps_tracker_premium` - Premium GPS-Tracker
- `gps_remover` - GPS Remover Tool

### `shop.lua`
**Zweck:** Shop-Konfiguration für GPS-Tracker Verkauf

**Verwendung:**
1. Öffne `ox_inventory/data/shops.lua` auf deinem Server
2. Kopiere die Shop-Konfiguration aus dieser Datei
3. Füge sie in die shops.lua von ox_inventory ein
4. Passe die Positionen nach Bedarf an

**Enthält:**
- Shop-Name und Blip-Konfiguration
- Alle GPS-Tracker mit Preisen
- Beispiel-Positionen für Shops
- ox_target Integration

## ⚠️ Wichtig

**Diese Dateien werden NICHT vom GPS-Tracker Script geladen!**

Sie sind reine Vorlagen zur manuellen Integration in andere Systeme:
- ❌ Nicht im fxmanifest.lua enthalten
- ❌ Werden nicht automatisch geladen
- ✅ Müssen manuell in ox_inventory kopiert werden
- ✅ Können angepasst werden ohne das GPS-Tracker Script zu ändern

## 📖 Weitere Informationen

Siehe die Hauptdokumentation:
- `../../../README.md` - Übersicht und Features
- `../../../INSTALLATION.md` - Schritt-für-Schritt Anleitung
- `../../../QUICK_REFERENCE.md` - Schnellreferenz für Nutzer

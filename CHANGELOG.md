# Changelog

Alle wichtigen Änderungen an diesem Projekt werden in dieser Datei dokumentiert.

## [2.0.0] - 2026-01-31

### ✨ Neue Features
- **Mehrere Tracker-Typen**: Basic, Standard, Advanced, Premium mit unterschiedlichen Laufzeiten
- **Preissystem**: Gestaffelte Preise von 2.500€ bis 15.000€
- **Auswahl-Menü**: ox_lib Context-Menu zur Tracker-Auswahl beim Anbringen
- **Konfigurationssystem**: Zentrale `config.lua` für einfache Anpassungen
- **Shop-Integration**: Vorbereitet für ox_inventory Shops
- **Item-System**: Separate Items für jeden Tracker-Typ
- **Server-Callbacks**: Prüfung verfügbarer Tracker vor Menü-Anzeige

### 🔧 Verbesserungen
- Server-seitige Validierung aller Tracker-Typen
- Dynamische Menü-Generierung basierend auf Inventar
- Anzeige der Tracker-Anzahl im Auswahl-Menü
- Verbesserte RP-Texte mit Tracker-Typ-Namen
- Optimierte Datenstruktur (trackedVehicles als Objekt statt einzelnem Wert)

### 📚 Dokumentation
- Umfangreiches README mit Feature-Übersicht
- Detaillierte INSTALLATION.md mit Schritt-für-Schritt-Anleitung
- QUICK_REFERENCE.md für schnelle Benutzer-Hilfe
- items.lua mit allen Item-Definitionen
- shop.lua mit Shop-Konfiguration
- items.sql als Referenz

### 🎨 Konfiguration
```lua
4 Tracker-Typen:
- Basic: 5 Min (300s) - 2.500€
- Standard: 10 Min (600s) - 5.000€
- Advanced: 15 Min (900s) - 8.000€
- Premium: 30 Min (1800s) - 15.000€
```

### 🔄 Migrations-Hinweise
**Von v1.0.0 zu v2.0.0:**

1. **Item-Namen geändert!**
   - Alt: `gps_tracker` (allgemein)
   - Neu: `gps_tracker_basic`, `gps_tracker_standard`, etc.

2. **Config hinzugefügt:**
   - Neue Datei `config.lua` muss geladen werden
   - Alte `TRACK_DURATION` Variable entfernt

3. **Server-Events erweitert:**
   - `mtj_gps:attachTracker` benötigt jetzt 2 Parameter: (netId, trackerItem)
   - Neues Callback: `mtj_gps:getAvailableTrackers`

4. **Datenstruktur:**
   - `trackedVehicles[netId]` ist jetzt ein Objekt mit {source, trackerType, duration}

**Kompatibilität:**
- ❌ Alte gespeicherte Tracker werden nicht übernommen
- ✅ Alte Remover-Items bleiben kompatibel
- ✅ Alle Events rückwärts-kompatibel (außer attachTracker)

---

## [1.0.0] - Initial Release

### ✨ Features
- Basis GPS-Tracker System
- Single Tracker-Typ (10 Minuten Laufzeit)
- ox_target Integration
- UI mit Timer-Anzeige
- GPS Remover Tool
- Admin Force-Remove
- RP-Animationen
- Custom UI mit HTML/CSS/JS

### 🎯 Funktionalität
- Tracker anbringen (10 Min Laufzeit)
- Tracker entfernen (mit GPS Remover)
- Tracker scannen
- Live-Timer Anzeige
- Blip auf Minimap
- Automatischer Ablauf nach Zeit

### 📦 Abhängigkeiten
- ESX Legacy 1.12+
- ox_lib
- ox_target
- ox_inventory

---

## Versionsschema

Dieses Projekt folgt [Semantic Versioning](https://semver.org/):
- **MAJOR** (1.x.x → 2.x.x): Inkompatible API-Änderungen
- **MINOR** (x.1.x → x.2.x): Neue Features, abwärtskompatibel
- **PATCH** (x.x.1 → x.x.2): Bugfixes, abwärtskompatibel

## Geplante Features (Roadmap)

### v2.1.0 (Geplant)
- [ ] Erweiterte Blip-Farben pro Tracker-Typ
- [ ] Statistiken-System (Anzahl angebrachter Tracker)
- [ ] Benachrichtigung wenn Tracker entdeckt wird
- [ ] Sound-Effekte für Timer-Ablauf
- [ ] Konfigurierbarer Scanner (Erfolgsrate, Kosten)

### v2.2.0 (Geplant)
- [ ] Job-Integration (Polizei, Detektiv)
- [ ] Fraktions-Tracker (nur für bestimmte Jobs)
- [ ] Tracker-Historie im UI
- [ ] Export-Funktionen für andere Scripts
- [ ] Webhook-Integration (Discord Logs)

### v3.0.0 (Vision)
- [ ] Multi-Tracking (mehrere Fahrzeuge gleichzeitig)
- [ ] Erweiterte Scanner mit Reichweiten-System
- [ ] Spezial-Tracker (unsichtbar, gedrosselt, etc.)
- [ ] Mobile App Integration (Telefon-Script)
- [ ] Komplettes Admin-Panel

---

## Unterstützung

Bei Fragen oder Problemen:
1. Lies die Dokumentation (README.md, INSTALLATION.md)
2. Prüfe die F8-Konsole auf Fehler
3. Prüfe Server-Logs
4. Erstelle ein Issue mit detaillierter Fehlerbeschreibung

## Credits

**Entwickler:** MTJ2024  
**Framework:** ESX Legacy  
**Libraries:** ox_lib, ox_target, ox_inventory  
**Community:** FiveM Deutschland RP Community

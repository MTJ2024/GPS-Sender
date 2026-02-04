# Changelog

Alle wichtigen Änderungen an diesem Projekt werden in dieser Datei dokumentiert.

## [2.1.1] - 2026-02-04

### 🐛 Critical Bugfixes
- **KRITISCH:** Syntax-Fehler in client.lua behoben (trailing "-" entfernt)
- **KRITISCH:** ox_target Initialisierung komplett überarbeitet
- Script konnte nicht geladen werden wegen Syntax-Fehler
- ox_target wurde aufgerufen bevor es verfügbar war

### 🔧 Änderungen
- ox_target Export jetzt in CreateThread wrapper
- Wartet auf ox_target Verfügbarkeit vor Registrierung
- Erfolgs-Logging hinzugefügt für Debugging
- Bessere Fehlerbehandlung

### 📚 Dokumentation
- TROUBLESHOOTING.md hinzugefügt
- Komplette Diagnose-Schritte
- Häufige Probleme und Lösungen

### 💡 Behobene Probleme
- "GPS geht nicht, target komplett außer Betrieb" → **BEHOBEN**
- Script lädt jetzt korrekt
- ox_target Menü erscheint wie erwartet

---

## [2.1.0] - 2026-01-31

### 🔄 Breaking Changes
- **Komplett neue Tracker-Typen**: Wechsel von 4 zu 3 Tracker-Typen mit realistischen Laufzeiten
- **Item-Namen geändert**: Alte Items (basic, standard, advanced, premium) entfernt
- **Neue Items**: gps_tracker_1h, gps_tracker_24h, gps_tracker_permanent
- **Preise stark erhöht**: Anpassung für illegales Schwarzmarkt-System

### ✨ Neue Features
- **Illegales System**: GPS-Tracker als Schwarzmarkt-Ware mit höheren Preisen
- **Realistische Laufzeiten**: 1 Stunde, 24 Stunden, 7 Tage (permanent)
- **Schwarzmarkt-Integration**: Shop-Konfiguration für illegalen Handel
- **Langzeit-Überwachung**: Bis zu 7 Tage Dauertracking möglich

### 🔧 Änderungen

#### Tracker-Typen
**Entfernt:**
- ❌ GPS-Tracker Basic (5 Min, 2.500€)
- ❌ GPS-Tracker Standard (10 Min, 5.000€)
- ❌ GPS-Tracker Advanced (15 Min, 8.000€)
- ❌ GPS-Tracker Premium (30 Min, 15.000€)

**Hinzugefügt:**
- ✅ GPS-Tracker 1 Stunde (60 Min, 10.000€)
- ✅ GPS-Tracker 24 Stunden (1 Tag, 25.000€)
- ✅ GPS-Tracker Permanent (7 Tage, 50.000€)

#### Preise
- GPS Remover: 3.000€ → 5.000€ (erhöht)
- Alle Tracker deutlich teurer (Schwarzmarkt-Aufschlag)

### 📚 Dokumentation
- Alle Dokumentation auf neues System aktualisiert
- MIGRATION_GUIDE.md für Übergang von v2.0.0 zu v2.1.0
- README, INSTALLATION, QUICK_REFERENCE komplett überarbeitet
- Schwarzmarkt-Thematik in allen Texten integriert

### 💡 Begründung
- **Realismus**: 5-30 Minuten sind unrealistisch für echte Überwachung
- **RP-Qualität**: Illegales System bietet mehr RP-Möglichkeiten
- **Wirtschaft**: Höhere Preise verhindern Spam und verbessern Balance
- **Spielerfahrung**: Klare Unterschiede zwischen Tracker-Typen

---

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
- `reference/items.lua` mit allen Item-Definitionen
- `reference/shop.lua` mit Shop-Konfiguration
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

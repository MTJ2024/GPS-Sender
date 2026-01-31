# GPS-Tracker Quick Reference

## 🎯 Übersicht

### Verfügbare Tracker-Typen

| Typ | Icon | Laufzeit | Preis | Verwendung |
|-----|------|----------|-------|------------|
| **Basic** | ⏱️ | 5 Min | 2.500€ | Schnelle Jobs, Kurzverfolgungen |
| **Standard** | 📍 | 10 Min | 5.000€ | Standard-Überwachung, ausgewogen |
| **Advanced** | 🎯 | 15 Min | 8.000€ | Längere Verfolgungen, bessere Qualität |
| **Premium** | 💎 | 30 Min | 15.000€ | Profi-Jobs, maximale Laufzeit |

## 🎮 Steuerung & Bedienung

### Tracker anbringen
1. **Nähere dich** einem Fahrzeug
2. **Drücke Alt** (ox_target Standard)
3. **Wähle** "GPS-Tracker anbringen"
4. **Wähle Tracker-Typ** aus dem Menü
5. **Warte** 10 Sekunden (Animation)
6. ✅ **Tracker ist aktiv!**

**Benötigt:** Mindestens 1x GPS-Tracker (beliebiger Typ) im Inventar

### Tracker entfernen
1. **Nähere dich** dem Fahrzeug mit Tracker
2. **Drücke Alt** (ox_target)
3. **Wähle** "GPS-Tracker entfernen"
4. **Warte** 10 Sekunden (Animation)
5. ✅ **Tracker entfernt!**

**Benötigt:** 1x GPS Remover Tool im Inventar

### Tracker scannen
1. **Nähere dich** einem verdächtigen Fahrzeug
2. **Drücke Alt** (ox_target)
3. **Wähle** "GPS-Tracker scannen"
4. **Warte** 5 Sekunden (Scan-Animation)
5. ℹ️ **Ergebnis:** Tracker gefunden/nicht gefunden
6. ✅ **Bei Fund:** Tracker wird automatisch entfernt

**Benötigt:** Nichts (kostenlose Aktion)

## 📊 UI Elemente

### Timer-Anzeige (links am Bildschirm)
- **Rote Anzeige** = Tracker aktiv
- **Countdown** = Verbleibende Zeit
- **Pulsierend** = Live-Signal
- **Verschwindet** = Zeit abgelaufen

### Blip auf Karte
- **Symbol:** 📍 GPS-Tracker
- **Farbe:** Rot
- **Aktualisierung:** Live
- **Verschwindet:** Nach Zeitablauf oder Entfernung

## 💡 Tipps & Tricks

### Für Tracker-Nutzer
✅ **Wähle den richtigen Typ:** 
   - Kurze Verfolgung? → Basic
   - Längere Mission? → Advanced/Premium

✅ **Verstecke dich während Installation:** 
   - 10 Sekunden Animation = Anfällig für Entdeckung

✅ **Überwache das Ziel:**
   - Der Timer läuft immer runter
   - Bei 0:00 ist Signal weg

### Für Verfolgte
✅ **Regelmäßig scannen:**
   - Scan ist kostenlos
   - Schützt vor Überwachung

✅ **GPS Remover dabei haben:**
   - Sofortige Entfernung möglich
   - Kostet 3.000€ im Shop

✅ **Auf Timer achten:**
   - Wenn Timer läuft → Du wirst getrackt!

## 🛒 Einkaufen

### Items kaufen
Suche den **GPS & Elektronik Shop** auf der Karte:
- 🗺️ Blip: Kleines Elektronik-Symbol
- 📍 Position: Meist in der Stadt

### Preise
- GPS-Tracker Basic: **2.500€**
- GPS-Tracker Standard: **5.000€**
- GPS-Tracker Advanced: **8.000€**
- GPS-Tracker Premium: **15.000€**
- GPS Remover Tool: **3.000€**

## ⚠️ Wichtige Hinweise

### Einschränkungen
- ❌ **Nur 1 Tracker pro Fahrzeug**
- ❌ **Tracker nicht stapelbar** (1 Fahrzeug = 1 Tracker)
- ⏱️ **Zeitlimit** kann nicht verlängert werden
- 🔋 **Keine Aufladung** möglich

### Verlust
- ❌ **Bei Anbringen:** Item wird verbraucht
- ❌ **Bei Entfernen:** GPS Remover wird verbraucht
- ✅ **Bei Scan:** Kostenlos, kein Item-Verlust

## 🎭 RP-Aspekte

### Realismus
- **10 Sekunden Installation** = Realistische Zeitspanne
- **Animationen** = Sichtbare RP-Aktion
- **Verstecken** = Taktisches Element
- **Verschiedene Qualitäten** = Wirtschaftlicher Aspekt

### Interaktion
- 🤝 Arbeite mit anderen zusammen
- 👁️ Beobachte Fahrzeuge vor Installation
- 🏃 Fliehe wenn entdeckt
- 💬 RP mit gefundenen Trackern

## 🔧 Fehlerbehebung

### "Keine GPS-Tracker im Inventar"
→ Kaufe Tracker im Shop oder nutze `/giveitem`

### "Menü öffnet sich nicht"
→ Prüfe ox_lib Installation: `restart ox_lib`

### "Timer wird nicht angezeigt"
→ F8 Konsole prüfen, UI-Dateien checken

### "Tracker verschwindet sofort"
→ Prüfe Server-Logs, Config-Datei validieren

## 📞 Admin Befehle

### Items geben (zum Testen)
```
/giveitem [name] gps_tracker_basic [anzahl]
/giveitem [name] gps_tracker_standard [anzahl]
/giveitem [name] gps_tracker_advanced [anzahl]
/giveitem [name] gps_tracker_premium [anzahl]
/giveitem [name] gps_remover [anzahl]
```

### Beispiel
```
/giveitem max_mustermann gps_tracker_standard 3
```

## 🎯 Szenarien

### Szenario 1: Schnelle Verfolgung
**Situation:** Auto-Dieb klaut Fahrzeug
**Lösung:** GPS-Tracker Basic (5 Min) → Schnell & günstig

### Szenario 2: Gang-Überwachung
**Situation:** Verdächtige Gang-Aktivität
**Lösung:** GPS-Tracker Premium (30 Min) → Lange Beobachtung

### Szenario 3: Schutz vor Tracking
**Situation:** Du vermutest Tracker am Auto
**Lösung:** "Scannen" nutzen → Kostenlose Prüfung

### Szenario 4: Profi-Job
**Situation:** Wertvoller Transport
**Lösung:** GPS-Tracker Advanced (15 Min) + Backup-Tracker

## 📈 Strategie-Tipps

### Für Verfolger
1. **Wähle Qualität über Quantität**
2. **Installiere unauffällig**
3. **Halte Distanz zum Ziel**
4. **Backup-Tracker bereithalten**

### Für Verfolgte
1. **Regelmäßig scannen**
2. **GPS Remover griffbereit**
3. **Fahrzeug wechseln wenn getrackt**
4. **Sichere Parkplätze nutzen**

---

**Version:** 2.0.0  
**Author:** MTJ2024  
**Framework:** ESX Legacy 1.12+

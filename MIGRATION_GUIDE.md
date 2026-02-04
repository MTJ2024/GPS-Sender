# GPS Tracker System - Update auf Illegales System

## Änderungen vom alten zum neuen System

### Alte Konfiguration (v2.0.0)
**Konzept:** Legales Tracker-System mit kurzen Laufzeiten

| Item | Laufzeit | Preis | Konzept |
|------|----------|-------|---------|
| gps_tracker_basic | 5 Min | 2.500€ | Schnelle Jobs |
| gps_tracker_standard | 10 Min | 5.000€ | Standard |
| gps_tracker_advanced | 15 Min | 8.000€ | Längere Verfolgung |
| gps_tracker_premium | 30 Min | 15.000€ | Premium |
| gps_remover | - | 3.000€ | Entfernung |

**Problem:** Unrealistische Laufzeiten für echte Überwachung

---

### Neue Konfiguration (v2.1.0)
**Konzept:** Illegales Schwarzmarkt-System mit realistischen Laufzeiten

| Item | Laufzeit | Preis | Konzept |
|------|----------|-------|---------|
| gps_tracker_1h | 1 Stunde (60 Min) | 10.000€ | Kurzzeitüberwachung |
| gps_tracker_24h | 24 Stunden (1 Tag) | 25.000€ | Ganztägige Observation |
| gps_tracker_permanent | 7 Tage (168h) | 50.000€ | Langzeit-Überwachung |
| gps_remover | - | 5.000€ | Entfernung (teurer) |

**Vorteile:**
- ✅ Realistische Laufzeiten für echte RP-Szenarien
- ✅ Höhere Preise passend für illegales System
- ✅ Schwarzmarkt-Thematik
- ✅ Besseres Preis-Leistungs-Verhältnis
- ✅ Klare Unterscheidung der Tracker-Typen

---

## Technische Details

### Laufzeiten in Sekunden
```lua
-- Alt:
Basic:    300 Sekunden (5 Minuten)
Standard: 600 Sekunden (10 Minuten)
Advanced: 900 Sekunden (15 Minuten)
Premium:  1800 Sekunden (30 Minuten)

-- Neu:
1h:        3600 Sekunden (60 Minuten / 1 Stunde)
24h:       86400 Sekunden (1440 Minuten / 24 Stunden / 1 Tag)
Permanent: 604800 Sekunden (10080 Minuten / 168 Stunden / 7 Tage)
```

### Preis-Steigerung
```
Alt → Neu:
Basic (2.5k)    → 1h (10k)         = 4x teurer
Standard (5k)   → 24h (25k)        = 5x teurer
Advanced (8k)   → Permanent (50k)  = 6.25x teurer
Premium (15k)   → [entfernt]
Remover (3k)    → Remover (5k)     = 1.67x teurer
```

**Begründung der höheren Preise:**
- Illegales System → Schwarzmarkt-Aufschlag
- Längere Laufzeiten → Höherer Wert
- Bessere Balance für RP-Wirtschaft
- Verhindert Spam/Missbrauch

---

## Migration für bestehende Server

### 1. Items aktualisieren
**Alte Items entfernen:**
```lua
-- In ox_inventory/data/items.lua LÖSCHEN:
['gps_tracker_basic'] = { ... }
['gps_tracker_standard'] = { ... }
['gps_tracker_advanced'] = { ... }
['gps_tracker_premium'] = { ... }
```

**Neue Items hinzufügen:**
```lua
-- In ox_inventory/data/items.lua HINZUFÜGEN:
['gps_tracker_1h'] = { ... }
['gps_tracker_24h'] = { ... }
['gps_tracker_permanent'] = { ... }
```

### 2. Bestehende Inventare
**Spieler-Inventare bereinigen:**
```sql
-- Optional: Alte Items aus Spieler-Inventaren entfernen
-- ACHTUNG: Backup erstellen vor Ausführung!
-- Dies entfernt alte Tracker aus allen Inventaren
```

**Alternative:** Umtausch-System
- Spieler können alte Tracker gegen neue tauschen
- 1:1 Tausch oder mit Aufpreis
- Zeitlich begrenzte Aktion

### 3. Shop-Konfiguration
**Alt:**
```lua
["gps_shop"] = {
    name = "GPS & Elektronik",
    -- ...
}
```

**Neu:**
```lua
["gps_blackmarket"] = {
    name = "Schwarzmarkt - GPS Tracker",
    blip = { colour = 1 },  -- Rot statt Blau
    -- ...
}
```

---

## RP-Integration

### Schwarzmarkt-Konzept
- **Location:** Versteckte/abgelegene Orte
- **Zugang:** Nur für bestimmte Spieler/Gangs
- **Blip:** Rot markiert (illegal)
- **NPC:** Zwielichtiger Händler

### RP-Szenarien

#### Szenario 1: Kurze Observation
**Situation:** Verdächtiges Fahrzeug kurz beobachten
**Lösung:** GPS-Tracker 1h (10k€)
**RP:** "Ich brauch' was für 'ne schnelle Nummer..."

#### Szenario 2: Ganztägige Überwachung
**Situation:** Ziel den ganzen Tag verfolgen
**Lösung:** GPS-Tracker 24h (25k€)
**RP:** "Das Teil muss den ganzen Tag durchhalten!"

#### Szenario 3: Langzeit-Observation
**Situation:** Wichtiges Ziel über mehrere Tage
**Lösung:** GPS-Tracker Permanent (50k€)
**RP:** "Ich brauch' das Beste was du hast, Geld spielt keine Rolle!"

---

## Vorteile des neuen Systems

### Für Spieler
- ✅ Realistische Laufzeiten
- ✅ Klare Preisunterschiede
- ✅ Mehr taktische Entscheidungen
- ✅ Besseres Preis-Leistungs-Verhältnis

### Für Server-Owner
- ✅ Illegales System = mehr RP-Möglichkeiten
- ✅ Höhere Preise = bessere Wirtschafts-Balance
- ✅ Schwarzmarkt-Integration möglich
- ✅ Weniger Spam durch höhere Preise

### Für RP-Qualität
- ✅ Realistische Zeitrahmen
- ✅ Schwarzmarkt-Thematik
- ✅ Teurere Items = wertvollere RP-Entscheidungen
- ✅ Langfristige Überwachung möglich

---

## Konfigurierbarkeit

Alle Werte können in `config.lua` angepasst werden:

```lua
Config.TrackerTypes = {
    {
        item = 'gps_tracker_1h',
        duration = 3600,    -- ← Anpassbar
        price = 10000,      -- ← Anpassbar
        -- ...
    }
}
```

**Empfohlene Anpassungen:**
- Preise je nach Server-Wirtschaft
- Laufzeiten je nach RP-Intensität
- Icons und Beschreibungen
- Shop-Locations

---

## Zusammenfassung

Das GPS-Tracker-System wurde von einem **legalen System mit kurzen Laufzeiten** zu einem **illegalen Schwarzmarkt-System mit realistischen Laufzeiten** umgebaut.

**Hauptänderungen:**
- 🔄 4 Tracker-Typen → 3 Tracker-Typen
- ⏱️ 5-30 Min → 1h-7 Tage
- 💰 2.5k-15k€ → 10k-50k€
- 🏪 Normaler Shop → Schwarzmarkt
- 📝 Alle Dokumentation aktualisiert

**Status:** ✅ Produktionsbereit
**Version:** 2.1.0
**Breaking Changes:** Ja (Item-Namen geändert)

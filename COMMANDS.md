# GPS-Tracker Befehle & Interaktionen

## 📋 Übersicht aller Befehle

### 🎮 Spieler-Interaktionen (ox_target)

Um GPS-Tracker anzubringen oder zu entfernen, nutzt du **ox_target** (Standard: `Alt`-Taste).

#### 1️⃣ GPS-Tracker anbringen

**Aktion:** Gehe zu einem Fahrzeug und drücke `Alt`

**Menü-Option:** `GPS-Tracker anbringen`

**Voraussetzungen:**
- Mindestens 1 GPS-Tracker im Inventar haben
- Am Fahrzeug ist noch kein Tracker angebracht

**Ablauf:**
1. Fahrzeug mit `Alt` anvisieren
2. "GPS-Tracker anbringen" wählen
3. Tracker-Typ aus Menü auswählen:
   - ⏱️ GPS-Tracker 1 Stunde
   - 📅 GPS-Tracker 24 Stunden
   - 💎 GPS-Tracker Permanent
4. 10 Sekunden Animation abwarten
5. Tracker ist aktiv!

**Ergebnis:**
- Tracker wird vom Inventar entfernt
- GPS-Blip erscheint auf der Karte
- Timer startet (sichtbar links am Bildschirm)

---

#### 2️⃣ GPS-Tracker entfernen

**Aktion:** Gehe zu einem Fahrzeug mit Tracker und drücke `Alt`

**Menü-Option:** `GPS-Tracker entfernen`

**Voraussetzungen:**
- GPS Remover Tool im Inventar haben
- Am Fahrzeug ist ein Tracker angebracht

**Ablauf:**
1. Fahrzeug mit Tracker anvisieren (`Alt`)
2. "GPS-Tracker entfernen" wählen
3. 10 Sekunden Animation abwarten
4. Tracker ist entfernt!

**Ergebnis:**
- GPS Remover Tool wird vom Inventar entfernt
- Tracker-Blip verschwindet
- Timer stoppt

---

#### 3️⃣ GPS-Tracker scannen

**Aktion:** Gehe zu einem Fahrzeug und drücke `Alt`

**Menü-Option:** `GPS-Tracker scannen`

**Voraussetzungen:**
- Keine! (Kostenlose Aktion)

**Ablauf:**
1. Fahrzeug anvisieren (`Alt`)
2. "GPS-Tracker scannen" wählen
3. 5 Sekunden Scan-Animation abwarten
4. Ergebnis wird angezeigt

**Ergebnis:**
- **Tracker gefunden:** Wird automatisch entfernt
- **Kein Tracker:** Meldung "Kein Tracker gefunden"

---

### 👨‍💼 Admin-Befehle

#### Items geben

```
/giveitem [spielername] [item] [anzahl]
```

**Verfügbare Items:**
- `gps_tracker_1h` - GPS-Tracker 1 Stunde
- `gps_tracker_24h` - GPS-Tracker 24 Stunden
- `gps_tracker_permanent` - GPS-Tracker Permanent
- `gps_remover` - GPS Remover Tool

**Beispiele:**
```
/giveitem max_mustermann gps_tracker_1h 3
/giveitem john_doe gps_tracker_24h 2
/giveitem jane_smith gps_tracker_permanent 1
/giveitem bob_builder gps_remover 5
```

---

## 🔧 Technische Events (für Entwickler)

### Client → Server Events

**Tracker anbringen:**
```lua
TriggerServerEvent('mtj_gps:attachTracker', netId, trackerItem)
```
- `netId` - Network ID des Fahrzeugs
- `trackerItem` - Item-Name (z.B. 'gps_tracker_1h')

**Tracker entfernen:**
```lua
TriggerServerEvent('mtj_gps:removeTracker', netId)
```
- `netId` - Network ID des Fahrzeugs

---

### Server → Client Events

**Tracker aktivieren:**
```lua
TriggerClientEvent('mtj_gps:trackVehicle', source, netId, duration)
```
- `source` - Spieler ID
- `netId` - Network ID des Fahrzeugs
- `duration` - Laufzeit in Sekunden

**Tracker deaktivieren:**
```lua
TriggerClientEvent('mtj_gps:removeBlip', source, netId)
```
- `source` - Spieler ID
- `netId` - Network ID des Fahrzeugs

**Admin Force-Remove:**
```lua
TriggerServerEvent('gps:forceRemoveTracker', netId)
```
- `netId` - Network ID des Fahrzeugs

---

## 📊 Item-Übersicht

| Item Name | Label | Laufzeit | Preis | Gewicht |
|-----------|-------|----------|-------|---------|
| gps_tracker_1h | GPS-Tracker 1 Stunde | 60 Min | 10.000€ | 200g |
| gps_tracker_24h | GPS-Tracker 24 Stunden | 1 Tag | 250.000€ | 250g |
| gps_tracker_permanent | GPS-Tracker Permanent | 7 Tage | 50.000€ | 300g |
| gps_remover | GPS Remover Tool | - | 5.000€ | 180g |

---

## 🎯 Schnellreferenz

### Als Verfolger (Tracker anbringen)
1. Tracker im Inventar haben
2. Zum Zielfahrzeug gehen
3. `Alt` drücken
4. "GPS-Tracker anbringen" → Typ wählen
5. 10 Sekunden warten
6. ✅ Tracking aktiv!

### Als Verfolgter (Tracker entfernen)
1. GPS Remover Tool im Inventar haben
2. Zum eigenen Fahrzeug gehen
3. `Alt` drücken
4. "GPS-Tracker entfernen"
5. 10 Sekunden warten
6. ✅ Tracker entfernt!

### Tracker suchen (ohne Tool)
1. Zu verdächtigem Fahrzeug gehen
2. `Alt` drücken
3. "GPS-Tracker scannen"
4. 5 Sekunden warten
5. ✅ Wenn gefunden: automatisch entfernt!

---

## ⚙️ Konfiguration

Alle Laufzeiten und Einstellungen sind in `config.lua` anpassbar:

```lua
Config.TrackerTypes = {
    {
        item = 'gps_tracker_1h',
        duration = 3600,  -- 1 Stunde in Sekunden
        price = 10000,
        -- ...
    }
}
```

---

## 💡 Tipps

- **Scannen ist kostenlos** - Nutze es regelmäßig!
- **GPS Remover ist einmalig** - Pro Entfernung wird 1 Tool verbraucht
- **Tracker sind permanent bis Ablauf** - Können nur mit Remover oder Scan entfernt werden
- **Timer ist sichtbar** - Du siehst links am Bildschirm wie lange der Tracker noch aktiv ist

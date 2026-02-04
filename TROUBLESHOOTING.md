# GPS Tracker Troubleshooting

## ❌ Problem: "GPS geht nicht, target komplett außer Betrieb"

### Häufigste Ursachen:

#### 1. ox_target ist nicht gestartet
**Lösung:**
```
ensure ox_target
restart mtj_gps_tracker
```

Prüfe in der F8 Console:
- Suche nach: `[MTJ GPS] ox_target erfolgreich initialisiert!`
- Falls nicht vorhanden: ox_target ist nicht gestartet

#### 2. Falsche Resource-Reihenfolge in server.cfg
**Korrekte Reihenfolge:**
```cfg
ensure ox_lib
ensure ox_target
ensure ox_inventory
ensure es_extended
ensure mtj_gps_tracker
```

#### 3. Syntax-Fehler in client.lua
**Behoben in v2.1.1:**
- Entfernt: Trailing "-" am Ende der Datei
- Hinzugefügt: ox_target Verfügbarkeitsprüfung

#### 4. ox_lib nicht geladen
**Prüfen:**
```
restart ox_lib
restart mtj_gps_tracker
```

---

## 🔍 Diagnose-Schritte

### 1. Prüfe ob Resource läuft
```
restart mtj_gps_tracker
```

In F8 Console schauen nach:
- `[MTJ GPS] ox_target erfolgreich initialisiert!` ✅
- Fehlermeldungen in Rot ❌

### 2. Prüfe Dependencies
```
ensure ox_lib
ensure ox_target
ensure ox_inventory
```

### 3. Prüfe Server Console
Schaue nach Fehlern wie:
- `SCRIPT ERROR`
- `attempt to call a nil value`
- `ox_target`

### 4. Teste ox_target allgemein
Gehe zu einem anderen Fahrzeug:
- Drücke `Alt`
- Siehst du andere ox_target Optionen?
- Falls NEIN: ox_target ist das Problem, nicht GPS-Tracker

---

## ✅ Fixes in v2.1.1

### Was wurde behoben:

1. **Syntax-Fehler entfernt**
   - Trailing `-` am Ende von client.lua entfernt
   - Verhinderte dass Lua-Datei geladen wurde

2. **ox_target Initialisierung verbessert**
   - Wartet jetzt bis ox_target verfügbar ist
   - CreateThread wrapper hinzugefügt
   - Bessere Fehlerbehandlung

3. **Logging hinzugefügt**
   - Erfolgs-Nachricht: `[MTJ GPS] ox_target erfolgreich initialisiert!`
   - Sichtbar in F8 Console

---

## 🔧 Manuelle Fixes

### Falls Problem weiter besteht:

#### Fix 1: Resource neu installieren
```bash
# Lösche alte Version
rm -rf resources/[esx]/mtj_gps_tracker

# Kopiere neue Version
# Kopiere mtj_gps_tracker Ordner nach resources/[esx]/

# Restart
restart mtj_gps_tracker
```

#### Fix 2: Cache leeren
```bash
# Server stoppen
# Lösche cache Ordner
# Server starten
restart mtj_gps_tracker
```

#### Fix 3: Dependencies prüfen
Stelle sicher diese Resources laufen:
- ✅ ox_lib
- ✅ ox_target
- ✅ ox_inventory
- ✅ es_extended (ESX Legacy 1.12+)

---

## 📋 Checkliste

Wenn GPS-Tracker nicht funktioniert:

- [ ] ox_target läuft (`ensure ox_target`)
- [ ] ox_lib läuft (`ensure ox_lib`)
- [ ] mtj_gps_tracker gestartet (`ensure mtj_gps_tracker`)
- [ ] Richtige Reihenfolge in server.cfg
- [ ] F8 Console zeigt: "ox_target erfolgreich initialisiert!"
- [ ] Items in ox_inventory/data/items.lua hinzugefügt
- [ ] Items in Datenbank (items_db.sql ausgeführt)
- [ ] Resource-Ordner heißt `mtj_gps_tracker` (keine Leerzeichen!)

---

## 🆘 Support

Wenn nichts hilft:

1. Poste F8 Console Output
2. Poste Server Console Output
3. Prüfe `server.cfg` Resource-Reihenfolge
4. Prüfe ob ox_target bei anderen Scripts funktioniert

---

## 📊 Versions-Info

- **v2.1.1** - Fix: ox_target Initialisierung + Syntax-Fehler
- **v2.1.0** - Neue Tracker-Typen (1h/24h/permanent)
- **v2.0.0** - Multi-Tracker System

### Upgrade auf v2.1.1

1. Ersetze `client.lua` mit neuer Version
2. `restart mtj_gps_tracker`
3. Prüfe F8 Console auf Erfolgs-Nachricht

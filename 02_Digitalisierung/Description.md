# Digitalisierung
Mit dem Begriff der Digitalisierung wird der Prozess des Erfassens von Informationen über physische Objekte in Formate gemeint, die sich zu einer Verarbeitung oder Speicherung in elektronischen Datenverarbeitungssystemen eignen.

In Bezug auf die digitalen Geisteswissenschaften meint sind hier insbesondere folgende Digitalisierungsbereiche gemeint:
- Textdigitalisierumng
- Bilddigitalisierung
- Audiodigitalisierung
- Objektdigitalisierung (Archäologie, BIM u.v.m.)

Das Endprodukt der Digitalisierung ist das Digitalisat. Das bedeutet: Ein analoger Gegenstand wird in digitale Werte überführt. In diesem Kontext fällt häufig der Begriff des "digitalen Zwillings". Dabei handelt es sich aber eher um ein digitales Geschwisterkind, da es sich bei dem Digitalisat nie um eine 1:1 Kopie des Originals handelt.

## Erfassung & Erschließung
Im Rahmen der Digitalisierung wird das Digitalisat erfasst. Diese Erfassung ist ein technischer Prozess, welcher der Aufbereitung und Qualitätssicherung dient.
Mit dem Begriff der Erschließung wird der Prozess der Strukturierung und Beschreibung des Materials/der Daten umschrieben, um das Digitalisat auffindbar, zugänglich und nachnutzbar zu machen. Hierbei haben die FAIR- (Findable, Accessible, Interoberable und Re-Useable) und CARE- (Collectiv Benefit, Auhtority to Control, Responsibility, Ethics) Prinzpien eine besondere Bedeutung.
Im Rahmen des Erschließungsprozesses entstehen sogenannte Metadaten.

    „Die Erzeugung von Metadaten, welche erst die Auffindbarkeit der Objekte gewährleisten und eine kontextualisierende Präsentation ihrer digitalen Images erlauben, ist zentraler Bestandteil der Digitalisierung.“ (DFG 2013, 25)

Es werden im Allgemeinen 4 Typen von Metadaten unterschieden: technische, deskriptive, strukturelle und administrative Metadaten.

## Technische Metadaten
- werden verwendet, um die Qualität des Objektes zu beurteilen

## Deskriptive Metadaten
- werden vorranging zum Auffinden eines bestimmten Objektes herangezogen

## Strukturelle Metadaten
- werden verwendet, um das aufgefundene Objekt in seinem Aufbau zu erfassen

## Administrative Metadaten
- werden verwendet, um etwa Nutzungsrechte zu dokumentieren


# Datenbereinigung

## Python-Bibliothek Pandas

Die Python-Bibliothek Pandas kann nicht nur für die Analyse von Daten genutzt werden, sondern auch für eine teilautomatisierte Datenbereinigung, um fehlerhafte, unvollständige oder inkonsistente Daten zu korrigieren.

---

### 1. **Laden der Daten**

```python
import pandas as pd

df = pd.read_csv("daten.csv")  
```

---

### 2. **Fehlende Werte behandeln**

#### Fehlende Werte anzeigen:
```python
print(df.isnull().sum())  # Zeigt die Anzahl fehlender Werte pro Spalte
```

#### Fehlende Werte entfernen:
```python
df = df.dropna()  # Entfernt alle Zeilen mit fehlenden Werten
```

#### Fehlende Werte ersetzen:
```python
df["Alter"].fillna(df["Alter"].mean(), inplace=True)  # Ersetzt fehlende Werte mit dem Durchschnitt
```

---

### 3. **Doppelte Werte entfernen**

```python
df = df.drop_duplicates()
```

Falls du nur bestimmte Spalten berücksichtigen möchtest:
```python
df = df.drop_duplicates(subset=["Name", "Alter"])
```

---

### 4. **Inkonsistente Werte korrigieren**

#### Inkonsistente Groß-/Kleinschreibung:
```python
df["Name"] = df["Name"].str.lower()  # Alles in Kleinbuchstaben umwandeln
```

---

### 5. **Spalten umbenennen und entfernen**

#### Spalten umbenennen:
```python
df = df.rename(columns={"alte_spalte": "neue_spalte"})
```

#### Unnötige Spalten löschen:
```python
df = df.drop(columns=["UnnötigeSpalte"])
```

---

### 6. ** Inhalte mit Regular Expressions (Regex) ersetzen (auch ohne Pandas möglich mit Python-Modul re)

df['Text'] = df['Text'].str.replace(r'\bae\b', 'ä', regex=True)

Weitere Informationen zu regulären Ausdrücken können bspw. [hier](https://de.wikipedia.org/wiki/Regul%C3%A4rer_Ausdruck) gefunden werden.

Siehe hierfür Python-Datei: [Re-Modul.py](02_Digitalisierung/Re-Modul.py) und [regex_pandas.py](02_Digitalisierung/regex_pandas.py)



### 7. **Speichern der bereinigten Daten**
```python
df.to_csv("bereinigte_daten.csv")
```



## OpenRefine



# Datenextraktion


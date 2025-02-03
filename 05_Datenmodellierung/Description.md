# Datenmodellierung

Datenmodelle sind Modelle. Ein Modell kann nie die Wirklichkeit in all ihrer Komplexität abbilden. Ein Modell ist weder das Original noch eine Kopie des Originals. Ein Modell dient einem spezifischen Verwendungszweck. 

## Was sind Daten?
Daten sind Zeichen, die Informationen darstellen. Sie sind elektroniach gespeicherte Informationseinheiten und entstehen u.a. durch Aufzeichnungen, Beobachtungen, Messungen, statistische Verfahren. (siehe: [DWDS](https://www.dwds.de/wb/Daten))

### Strukturierte Daten
Strukturierte Daten sind Daten, die ein standardisiertes Format haben und es damit sowohl Mensch als auch Maschine ermöglichen, den Inhalt zu verarbeiten. In der Regel sind strukturierte Daten tabellarisch mit Zeilen und Spalten klar definiert. 

### Unstrukturierte Daten
Unstrukturierte Daten sind Daten, die nicht nach einem vorgegebenen Datenmodell oder -schema gespeichert werden. Unstrukturierte Daten sind beispielsweise Texte, interaktive Medien, Videos, Audiodateien u.v.m. Sie können sowohl vom Menschen als auch von Maschinen erzeugt werden. Im Allgemeinen ist es schwierig, sie mit herkömmlichen Strategien des Datenmanagements zu speicher oder zu analysieren.



## Datenmodellierung
Datenmodelle haben verschiedene Funktionen:
1. Sie ermöglichen komplexe maschinelle Operationen auf den Daten
2. Sie dienen als Grundlage der Kommunikation über die Daten
3. Sie sichern eine höhere Qualität der Daten, indem sie Bedingungen formulieren, denen Daten bei der Eingabe entsprechen müssen
4. Sie ermöglichen den Austausch oder das Zusammenführen von Daten, wenn sie allgemeinen Standards folgen und tragen auf diese Weise zur Umsetzung der FAIR-Kriterien bei.

![Datenmodell](https://upload.wikimedia.org/wikipedia/commons/d/d4/DatMod_v_semMod_zur_DBK.svg)

### Konzeptuelles Datenbankmodell


### Logisches Datenbankmodell

### Physisches Datenbankmodell

### Checkliste zur Erstellung eines Datenbankmodells

- [ ] Identifizieren Sie in Ihren Quellen Informationen, die eindeutig beschrieben werden können. 
- [ ] Erstellen Sie eine Reihe von beschrifteten Kategorien, die klar und eindeutig sind.
- [ ] Entscheiden Sie, welche Kategorien numerisch, durch Wahr/Falsch-Werte oder durch beschreibende Begriffe angegeben werden. 
- [ ] Schätzen Sie ab, wie schwierig es ist, die Konsistenz Ihrer Einträge beizubehalten. Standardisieren Sie das Format für jeden Datentyp (Daten, Orte und Namen).
- [ ] Beschränken Sie den Wortschatz für Beschreibungen, außer in den Kommentaren.
- [ ] Lesen Sie die Kategorien, die Sie festgelegt haben, um zu sehen, was das Datenmodell aus den Originalquellen übernimmt. 
- [ ] Suchen Sie nach Annahmen über Kategorien, die möglicherweise eine Voreingenommenheit enthalten. 
- [ ] Überprüfen Sie Ihr Datenmodell auf Vollständigkeit und Genauigkeit. 

### Normalisierung

= Entwurfsansatz für relationale Datenbanken
- Ziel: Redundanzen/Inkosistenzen vermeiden
- Erste Normalform (1NF): Alle Attribute enthalten unteilbare (atomare) Werte UND es gibt keine wiederholten Gruppen oder Arrays in den Attributen
- Zweite Normalform (2NF): Die 1NF muss hergestellt sein UND es dürfen keine partiellen Abhängigkeiten bestehen
- Dritte Normalform (3NF):Die 2NF muss hergestellt sein UND es dürfen keine transitiven Abhängigkeiten bestehen

#### Konkret am Beispiel:
**0NF**

|Name|Standort|Baujahr|Erbauer|Material|
|----|--------|-------|-------|--------|
|Brandenburger Tor|Berlin|1791|Carl Gotthrad Langhans|Stein, Eisen|
|Kölner Dom	Köln|1248|Meister Gerhard, weitere|Stein, Glas|
|Frauenkirche|Dresden|1726|George Bähr|Sandstein|

**1NF**

|DenkmalID|Name|Standort|Baujahr|Erbauer|Material|
|---------|----|--------|-------|-------|--------|
|1|Brandenburger Tor|Berlin|1791|Carl Gotthard Langhans|Stein|
|1|Brandenburger Tor|Berlin|1791|Carl Gotthard Langhans|Eisen|
|2|Kölner Dom|Köln|1248|Meister Gerhard	|Stein|
|2|Kölner Dom|Köln|1248|weitere|Stein|
|2|Kölner Dom|Köln|1248|weitere|Glas|
|3|Frauenkirche|Dresden|1726|George Bähr|Sandstein|


**2NF**

**Denkmal-Tabelle**

|DenkmalID|Name|Standort|Baujahr|
|---------|----|--------|-------|
|1|Brandenburger Tor|Berlin|1791|
|2|Kölner Dom|Köln|1248|
|3|Frauenkirche|Dresden|1726|


**Erbauer-Tabelle**

|ErbauerID|Name|
|---------|----|
|1| Carl Gotthard Langhans|
|2| MeisterGerhard|
|3| weitere|
|4| Georg Bähr|

[+ Material-Tabelle, Zuordnungstabelle zwischen Denkmal und Erbauer und Zuordnungstabelle zwischen Denkmal und Material] 

**Ziel:** Jetzt hängt jede Tabelle nur noch von ihrem Primärschlüssel ab, und es gibt keine partiellen Abhängigkeiten mehr. Die Tabellen sind in der zweiten Normalform.


**3NF**
= ist unserem Beispiel bereits erreicht

**Beispiel für transitive Abhängigkeit**

|DenkmalID|Name|Standort|Baujahr|Region|
|---------|----|--------|-------|------|
|1|Brandenburger Tor|Berlin|1791|Berlin|
|2|Kölner Dom|Köln|1248|NRW|
|3|Frauenkirche|Dresden|1726|Sachsen|

In diesem Fall haben wir eine indirekte Abhängigkeit zwischen DenkmalID und Region:
- Der Primärschlüssel DenkmalID identifiziert eindeutig ein Denkmal.
- Das Attribut Standort (also Stadt) ist direkt abhängig von DenkmalID, weil jedes Denkmal in einer bestimmten Stadt steht.
- Region ist jedoch indirekt (also transitiv) abhängig von DenkmalID, da Region eigentlich nur von Stadt abhängt und nicht direkt von DenkmalID.
- Lösung wäre: Standorttabelle mit Standort-ID|Stadt|Region, wodurch die Abhängigkeit aufgelöst wird.



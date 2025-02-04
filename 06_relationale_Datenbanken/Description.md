# Relationale Datenbanken

„In einer relationalen Datenbank stehen Datenfelder und Tabellen miteinander in Beziehung und können mithilfe von Anweisungen ausgewertet werden.“[^1]

## Allgemeines
Wenn das konzeptuelle Datenbankmodell – also das erstellte Entity-Relationship-Modell – nun in ein logisches Datenbankschema überführt werden soll und es sich hierbei um eine relationale Datenbank handeln soll, bedeutet das im ersten Schritt, dass für jeden Entitätstyp eine Tabelle angelegt wird, bei der der Name der Tabelle dem Entitätstyp entspricht und die Spaltenbezeichnungen den Attributen der jeweiligen Entität.

Die einzelnen Datensätze werden in einer relationalen Datenbank über **Primärschlüssel** eindeutig gekennzeichnet. Ein Primärschlüssel kann ein Attribut oder eine Attributkombination sein, durch den jeder Datensatz in einer Tabelle eindeutig identifiziert wird. 
Häufig handelt es sich jedoch um zusätzlich hinzugefügte fortlaufende Zahlen, die nur einmal vergeben werden. 
Ein solcher Schlüssel kann in einer anderen Tabelle als **Fremdschlüssel** verwendet werden, um eine Beziehung zwischen zwei Tabellen herzustellen.
Ein Fremdschlüssel ist demnach ein Attribut oder eine Attributkombination, der in einer Tabelle auf den Primärschlüssel einer anderen Tabelle verweist.

## Beziehungen

### 1:1 Beziehung
Wenn einer Entität genau eine andere Entität zugeordnet werden kann, spricht man von einer 1:1-Beziehung.

### 1:n Beziehung
Wenn eine Entität mit beliebig vielen anderen Entitäten eines anderen Entitätstyps in Beziehung stehen kann, spricht man von einer 1:n-Beziehung.

### n:m Beziehung
Wenn beliebig viele Entitäten in Beziehung zueinander stehen, spricht man von einer n:m-Beziehung. Hierzu wird zumeist eine dritte Tabelle erzeugt, die die Beziehunhen zwischen den beiden Entitätstypen vermittelt. Darin werden dann die Primärschlüssel beider Entitätstypen eingetragen.

## Normalisierung
Ziel einer Normalisierung ist die Verringerung von Redundanzen und Inkosistenzen in einer relationalen Datenbank. Man unterscheidet erste, zweite und dritte Normalform.

**Erste Normalform (1NF):** Alle Attribute enthalten unteilbare (atomare) Werte UND es gibt keine wiederholten Gruppen oder Arrays in den Attributen

**Zweite Normalform (2NF):** Die 1NF muss hergestellt sein UND es dürfen keine partiellen Abhängigkeiten bestehen

**Dritte Normalform (3NF):**Die 2NF muss hergestellt sein UND es dürfen keine transitiven Abhängigkeiten bestehen


## SQL / SQLite

**SQLite** ist eine relationale Datenbanksysteme. SQLite ist im Vergleich zu anderen SQL-Datenbanken ein sehr leichtgewichtiges Datenbanksystem und ist insbesondere im Prototyping-Bereich weit verbreitet. SQLite ist zudem eine Datenbanklösung, welche die meisten SQL-Befehle unterstützt und ist zudem Open Source und lizenzfrei nutzbar.

**SQL** ist eine Datenbanksprache, die zur Definition von Datenstrukturen in einer relationalen Datenbank genutzt wird. Sie dient der Bearbeitung und Abfrage von Datenbeständen und ist eine standardisierte Sprache für einen anwendungsunabhängigen Einsatz.

SQL verfügt über verschiedende Sprachelemente, die sich in fünf Kategorien unterteilen lassen:
    - Data Query Language
    - Data Manipulation Language
    - Data Definition Language
    - Data Control Language
    - Transaction Control Language

### Data Query Language
- Befehle zur Abfrage von Informationen
- Zweck: Daten aus einer oder mehreren Tabellen extrahieren und ausgeben
- Hauptbefehl: SELECT

### Data Manipulation Language
- Befehle zur Datenmanipulation
- Zweck: Daten einfügen, ändern, löschen
- Hauptbefehle: INSERT, UPDATE, DELETE

### Data Definition Language
- Befehle zur Definition des Datenbankschemas
- Zweck: Erzeugen, Ändern, Löschen von Datenbanktabellen, Definition von Primärschlüsseln und Fremdschlüsseln
- Hauptbefehle: CREATE, ALTER, DROP, TRUNCATE

### Data Control Language
- Befehle für den Zugriff auf Datenbankobjekte
- Zweck: Rechte und Berechtigungen in der DB verwalten
- Hauptbefehle: GRANT, REVOKE

### Transaction Control Language
- Befehle dienen zur Steuerung und Verwaltung vin Transaktionen in der DB
- Zweck: Steuerung der Integrität von Transaktionen
- Hauptbefehle: COMMIT, ROLLBACK, SAVEPOINT

## ACID-Prinzip
Eine Transaktion, also eine Veränderung in einer relationalen Datenbank, erfüllt idealerweise vier Bedingungen, die mit dem Akronym ACID beschrieben werden.

**Atomicity:** Eine Transaktion ist entweder vollständig oder gar nicht ausgeführt

**Consistency:** Die Datenbank bleibt nach einer Transaktion in einem konsistenten Zustand.

**Isolation:** Gleichzeitige Transaktionen beeinflussen sich nicht gegenseitig.

**Durability:** Änderungen durch bestätigte Transaktionen bleiben auch bei einem Systemausfall bestehen.



## SQLite-Datenbank im Einsatz

### Tabellen erstellen

```
CREATE TABLE personen (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT NOT NULL,
    alter INTEGER,
    stadt TEXT
);
```

#### Datentypen definieren
Bei der Erstellung einer Tabelle in der Datenbank werden auch die Datentypen festgelegt (s.o.). Möglich sind hier beispielsweise folgende Datentypen:

- **INT:** ›Integer‹ steht für Ganzzahlen von –2<sup>31</sup> bis 2<sup>31</sup> –1. 
- **FLOAT:** Dieser Datentyp steht zur Verfügung, wenn Fließkommazahlen benötigt werden, z. B.1,25. 
- **DATE:** Hierbei handelt es sich um ein Datumsformat, das auf den Tag genau angegeben wird. 
- **VARCHAR:** Steht für ›character‹, also eine bestimmte Anzahl von Buchstaben. Die maximale Länge wird in Klammern dahinter festgelegt. Im Gegensatz zu CHAR, bei dem der maximale Speicherplatz reserviert wird, werden nur so viele Bytes verbraucht, wie Zeichen gespeichert werden.
- **TEXT:** Ähnlich wie VARCHAR kann hier eine Buchstabenfolge von maximal 65535 Zeichen gespeichert werden.

Die Angabe von **NOT NULL** bedeutet, dass der Wert nicht leer sein darf.
Der Zusatz **AUTO_INCREMENT** zum Befehl bedeutet, dass beim Anlegen des Datensatzes automatisch die ID um eins erhöht wird.

Wenn kein Primärschlüssel bereits beim Erstellen der Tabelle vergeben wurde, kann einer Tabelle über den **ALTER-Befehl** in jedem Feld der Tabelle ein Primärschlüssel nachträglich zugewiesen werden.

Bspw.:

```
ALTER TABLE 'personen' ADD PRIMARY KEY('id');
```

**Beziehungen erstellen** 
XxXXXXXXXX


### Daten einfügen
Wenn die Tabellen erstellt und die Beziehungen hergestellt sind, müssen noch die Daten hinzugefügt werden. Hierzu benötigt man u.a. die Befehle:

- **INSERT:**
- **UPDATE:**
- **DELETE:**


```
INSERT INTO personen (name, alter, stadt) VALUES ('Max', 30, 'Berlin');
INSERT INTO personen (name, alter, stadt) VALUES ('Anna', 25, 'Hamburg');
```


### Daten abfragen

```
SELECT * FROM personen;
```





[^1]: Harald Klinke: Datenbanken, S. 111, in: Jannidis et al.: Digital Humanities
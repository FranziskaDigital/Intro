# Relationale Datenbanken

„In einer relationalen Datenbank stehen Datenfelder und Tabellen miteinander in Beziehung und können mithilfe von Anweisungen ausgewertet werden.“[^1]

## Allgemeines
Wenn das konzeptuelle Datenbankmodell – also das erstellte Entity-Relationship-Modell – nun in ein logisches Datenbankschema überführt werden soll und es sich hierbei um eine relationale Datenbank handeln soll, bedeutet das im ersten Schritt, dass für jeden Entitätstyp eine Tabelle angelegt wird, bei der der Name der Tabelle dem Entitätstyp entspricht und die Spaltenbezeichnungen den Attributen der jeweiligen Entität.

Die einzelnen Datensätze werden in einer relationalen Datenbank über **Primärschlüssel** eindeutig gekennzeichnet. Ein Primärschlüssel kann ein Attribut oder eine Attributkombination sein, durch den jeder Datensatz in einer Tabelle eindeutig identifiziert wird. 
Häufig handelt es sich jedoch um zusätzlich hinzugefügte fortlaufende Zahlen, die nur einmal vergeben werden. 
Ein solcher Schlüssel kann in einer anderen Tabelle als **Fremdschlüssel** verwendet werden, um eine Beziehung zwischen zwei Tabellen herzustellen.
Ein Fremdschlüssel ist demnach ein Attribut oder eine Attributkombination, der in einer Tabelle auf den Primärschlüssel einer anderen Tabelle verweist.

Relationale Datenbanken sind besonders sinnvoll, wenn große Mengen an strukturierten und miteinander verknüpften Daten effizient verwaltet werden müssen. Sie bieten durch das relationale Modell eine hohe Datenintegrität und Konsistenz, insbesondere durch die Einhaltung des **ACID-Prinzips** (Atomicity, Consistency, Isolation, Durability).

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

**Dritte Normalform (3NF):** Die 2NF muss hergestellt sein UND es dürfen keine transitiven Abhängigkeiten bestehen


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

- **INT** ›Integer‹ steht für Ganzzahlen von –2<sup>31</sup> bis 2<sup>31</sup> –1. 
- **FLOAT** Dieser Datentyp steht zur Verfügung, wenn Fließkommazahlen benötigt werden, z. B.1,25. 
- **DATE** Hierbei handelt es sich um ein Datumsformat, das auf den Tag genau angegeben wird. 
- **VARCHAR** Steht für ›character‹, also eine bestimmte Anzahl von Buchstaben. Die maximale Länge wird in Klammern dahinter festgelegt. Im Gegensatz zu CHAR, bei dem der maximale Speicherplatz reserviert wird, werden nur so viele Bytes verbraucht, wie Zeichen gespeichert werden.
- **TEXT** Ähnlich wie VARCHAR kann hier eine Buchstabenfolge von maximal 65535 Zeichen gespeichert werden.

Die Angabe von **NOT NULL** bedeutet, dass der Wert nicht leer sein darf.
Der Zusatz **AUTO_INCREMENT** zum Befehl bedeutet, dass beim Anlegen des Datensatzes automatisch die ID um eins erhöht wird.

Wenn kein Primärschlüssel bereits beim Erstellen der Tabelle vergeben wurde, kann in einer SQL-Datenbank wie beispielsweise MySQL oder PostgreSQL, einer Tabelle über den **ALTER-Befehl** in jedem Feld der Tabelle ein Primärschlüssel nachträglich zugewiesen werden. In SQLite wird der ALTER-Befehl nur begrenzt unterstützt. Vollständigkeitshabler sei hier dennoch gezeigt, wie der ALTER-Befehl in anderen SQL-Datenbanksystemen verwendet werden könnte.

Bspw.:

```
ALTER TABLE 'personen' ADD PRIMARY KEY('id');
```

**Beziehungen erstellen** 

In **MySQL- oder PostgreSQL-Datenbanken** können Beziehungen ebenfalls mit dem ALTER-Befehl erzeugt werden. Dies erfolgt dann nach diesem Schema:

```
ALTER TABLE InventarStraße 
ADD CONSTRAINT fk_inventar FOREIGN KEY (InvID) REFERENCES Inventare (InvID) ON DELETE CASCADE ON UPDATE CASCADE,
ADD CONSTRAINT fk_strasse FOREIGN KEY (StrID) REFERENCES Straßen (StrID) ON DELETE CASCADE ON UPDATE CASCADE;
```

In **SQLite** erfolgt das Erstellen der Beziehungen hingegen über die Fremdschlüssel ohne den ALTER-Befehl.

In unserem Beispiel haben wir die Tabelle Inventare und die Tabelle Straßen, beide verfügen über Primärschlüssel.

Die Beziehung zwischen den beiden Tabellen ist eine n:m-Beziehung.
Die Tabelle InventarStraße bringt diese Beziehung zum Asudruck, indem sie zwei Fremdschlüssel enthält.

Orte sind mit Straßen verknüpft (n:1-Beziehung). 
Ein Objekt (Objekte) befindet sich an einem bestimmten Ort (Orte), weshalb die OrtID in Objekte hier ein Fremdschlüssel ist, der auf Orte(OrtID) verweist.

```
CREATE TABLE Inventare (
    InvID INTEGER PRIMARY KEY AUTOINCREMENT,
    Autor TEXT NOT NULL, 
    Titel TEXT NOT NULL,
    Verlag TEXT,
    Erscheinungsjahr INTEGER,
    Band TEXT,
    Umfang TEXT
);

-- Tabelle "Straßen" angelegt
CREATE TABLE Straßen (
    StrID INTEGER PRIMARY KEY AUTOINCREMENT,
    Name TEXT NOT NULL,
    Altname TEXT,
    SeiteVon INTEGER,
    SeiteBis INTEGER
);

-- InventarStraße angelegt
CREATE TABLE InventarStraße (
    InvID INTEGER NOT NULL,
    StrID INTEGER NOT NULL,
    PRIMARY KEY (InvID, StrID),
    FOREIGN KEY (InvID) REFERENCES Inventare (InvID) ON DELETE CASCADE,
    FOREIGN KEY (StrID) REFERENCES Straßen (StrID) ON DELETE CASCADE
);


CREATE TABLE Orte (
    OrtID INTEGER PRIMARY KEY AUTOINCREMENT,  -- Primärschlüssel
    StrID INTEGER NOT NULL,                   -- Fremdschlüssel auf Straßen.StrID
    Hausnummer TEXT NOT NULL,                 -- Hausnummer (z. B. '12', '12a')
    FOREIGN KEY (StrID) REFERENCES Straßen(StrID) 
        ON DELETE CASCADE                     -- Löschen der Straße entfernt auch den Ort
        ON UPDATE CASCADE                     -- Änderungen werden weitergegeben
);

CREATE TABLE Objekte (
    ObjID INTEGER PRIMARY KEY AUTOINCREMENT,  -- Primärschlüssel
    Name TEXT NOT NULL,                       -- Objektname
    Material TEXT,                            -- Material des Objekts
    Datierung TEXT,                           -- Datierung des Objekts
    Provenienz TEXT,                          -- Herkunft des Objekts
    OrtID INTEGER NOT NULL,                   -- Fremdschlüssel auf Orte.OrtID
    FOREIGN KEY (OrtID) REFERENCES Orte(OrtID) 
        ON DELETE CASCADE                     -- Löschen eines Ortes entfernt auch die Objekte
        ON UPDATE CASCADE                     -- Änderungen werden weitergegeben
);

```

Eine Grafische Darstellung der Beziehungen:

             +------------------+
             |   Inventare      |
             |------------------|
             | InvID (PK)       |
             | Autor            |
             | Titel            |
             | Verlag           |
             | Erscheinungsjahr  |
             | Band             |
             | Umfang           |
             +------------------+
                     |
                     |  (Viele-zu-Viele)
                     v
      +--------------------------------+
      |          InventarStraße        |
      |--------------------------------|
      | InvID (PK, FK) -> Inventare   |
      | StrID (PK, FK) -> Straßen     |
      +--------------------------------+
                     |
                     v
             +------------------+
             |     Straßen      |
             |------------------|
             | StrID (PK)       |
             | Name             |
             | Altname          |
             | SeiteVon         |
             | SeiteBis         |
             +------------------+
                     |
                     |  (Viele-zu-Eins)
                     v
             +------------------+
             |      Orte        |
             |------------------|
             | OrtID (PK)       |
             | StrID (FK) -> Straßen |
             | Hausnummer        |
             +------------------+
                     |
                     |  (Viele-zu-Eins)
                     v
             +------------------+
             |    Objekte       |
             |------------------|
             | ObjID (PK)       |
             | Name             |
             | Material         |
             | Datierung        |
             | Provenienz       |
             | OrtID (FK) -> Orte |
             +------------------+


### Daten einfügen
Wenn die Tabellen erstellt und die Beziehungen hergestellt sind, müssen noch die Daten hinzugefügt werden. Hierzu benötigt man u.a. die Befehle:

- **INSERT** fügt der Tabelle eine neue Zeile hinzu
- **UPDATE** verändert eine bestimmte Zeile in einer Tabelle
- **DELETE** löscht eine Zeile in einer Tabelle


**Einen Wert eintragen**
```
INSERT INTO Straßen (Name, Altname, SeiteVon, SeiteBis) 
VALUES 
    ('Acker', NULL, 9, 9);
```

**Viele Werte eintragen**

```
INSERT INTO Straßen (Name, Altname, SeiteVon, SeiteBis) 
VALUES 
    ('Acker', NULL, 9, 9),
    ('Altenauergasse', NULL, 9, 9),
    ('Augustinerstrasse', NULL, 10, 12),
    ('Augustinergässchen', NULL, 12, 12),
    ('Ballplatz', NULL, 13, 15),
    ('Balthasarmalergasse', NULL, 15, 15),
    ('Bauerngasse', NULL, 15, 16),
    ('Bauhofstrasse', NULL, 16, 16),
    ('Betzelgasse', NULL, 17, 19),
    ('Bilhildisstrasse', NULL, 19, 20),
    ('Birnbaumgasse', NULL, 20, 21),
    ('Bischofsplatz', NULL, 21, 22),
    ('Grosse Bleiche', NULL, 22, 26),
    ('Bleiche, mittlere', NULL, 26, 27),
    ('Bleiche, hintere', NULL, 28, 28),
    ('Bockshöfchen', NULL, 28, 28),
    ('Brand', NULL, 28, 30);
```

Wenn man einen Fehler in einer Zeile korrigieren möchte, nutzt man hierfür den UPDATE-Befehl. Beispielsweise möchte ich den Straßennamen Acker in Ackerwand umändern, dann wäre der Befehl hierfür:

```
UPDATE 'Straßen' SET 'Name'=Ackerwand WHERE 'StrID'=1;
```

### Daten abfragen
Wenn nun alle Daten in die Tabellen eingetragen wurden, möchten wir den Inhalt auch abfragen und auswerten können. Bei einer solchen Abfrage an das System werden zunächst die gewünschten Spalten und Relationen selektiert. Wird zudem ein Suchkriterium übergeben, können bestimmte Datensätze ausgewählt werden.

Die Befehle für Datenbankabfragen in einer SQL-Datenbamk lauten daher:

**SELECT** Welche Spalten sollen ausgewählt werden?
**FROM** In welcher Tabelle befindet sich die Spalte bzw. der gesuchte Datensatz?
**WHERE** Welche weiteren Bedingungen müssen erfüllt sein, um die Abfrage sinnvoll beantworten zu können?

Alle Daten in einer Tabelle:

```
SELECT * FROM personen;
```


Wenn ich die Anzahl der Objekte pro Straße ermitteln möchte:

```
SELECT 
    Straßen.Name AS Straßenname,
    COUNT(Objekte.ObjID) AS Objektanzahl
FROM 
    Straßen
LEFT JOIN                   -- Verbindet die Tabelle Straßen mit der Tabelle Orte. Dadurch werden alle Straßen auch dann berücksichtigt, wenn es für sie keinen zugehörigen Ort gibt.
    Orte ON Straßen.StrID = Orte.StrID
LEFT JOIN                   -- Verbindet die bereit verknüpfte Tabelle Orte mit Objekte. Dadurch werden alle Orte auch dann berücksichtigt, wenn sie keine Objekte enthalten.
    Objekte ON Orte.OrtID = Objekte.OrtID
GROUP BY 
    Straßen.StrID;
```

LEFT JOIN sorgt dafür, dass auch Straßen ohne Objekte in der Liste erscheinen. Ohne diese zwei LEFT JOIN-Operationen würden Straßen, die keine Orte oder Objekte haben, in der Ausgabe fehlen.
GROUP BY Straßen.StrID gruppiert die Daten nach Straßen.


JOIN-Befehle ermöglichen unterschiedliche Arten, Tabellen miteinander zu verknüpfen
INNER JOIN: gibt nur Datensätze zurück, die in beiden Tabellen übereinstimmen; Syntax:
SELECT * FROM Tabelle1 INNER JOIN Tabelle2 ON Tabelle1.Spalte = Tabelle2.Spalte;

LEFT JOIN: gibt alle Datensätze der linken Tabelle und die übereinstimmenden Datensätze der rechten Tabelle zurück; Syntax:
SELECT * FROM Tabelle1 LEFT JOIN Tabelle2 ON Tabelle1.Spalte = Tabelle2.Spalte;



**Hinweis:** Für weitere Infos und Abfragen, siehe: SQLite-DB Datenbank.db und Inventare.sql.


[^1]: Harald Klinke: Datenbanken, S. 111, in: Fotis Jannidis et al.: Digital Humanities. Eine Einführung, Stuttgart 2017.
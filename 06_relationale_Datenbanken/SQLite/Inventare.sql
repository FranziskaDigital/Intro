-- SQLite Inventare angelegt

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

----

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
    ('Brand', NULL, 28, 30),
    ('Brandgässchen', NULL, 30, 30),
    ('Cästrich', NULL, 30, 30),
    ('Carmelitenplatz', NULL, 31, 32),
    ('Carmelitenstrasse', NULL, 32, 32),
    ('Christophstrasse', NULL, 32, 32),
    ('Christophsgasse, hintere', NULL, 33, 33),
    ('Citadelle', NULL, 33, 33),
    ('Clarastrasse', NULL, 33, 34),
    ('Deutschhausgässchen', NULL, 34, 34),
    ('Deutschhausplatz', NULL, 34, 34),
    ('Domstrasse', NULL, 34, 34),
    ('Dreikronenstrasse', NULL, 34, 34),
    ('Emmeransstrasse', NULL, 35, 40),
    ('Kleine Emmeransgasse', NULL, 40, 40),
    ('Emmerich-Josephstrasse', NULL, 41, 41),
    ('Erbacherhofgasse', NULL, 41, 41),
    ('Fischtorstrasse', NULL, 41, 42),
    ('Flachsmarkt', NULL, 42, 42),
    ('Flachsmarktstrasse', NULL, 42, 43),
    ('Hintere Flachsmarktstrasse', NULL, 43, 43),
    ('Fledergässchen', NULL, 43, 43),
    ('Franziskanerstrasse', NULL, 43, 44),
    ('Fürstenbergerhofgasse', NULL, 44, 44),
    ('Fuststrasse', NULL, 44, 44),
    ('Gärtnergasse', NULL, 45, 45),
    ('Gaugasse', NULL, 45, 45),
    ('Goldenbrunnengasse', NULL, 45, 45),
    ('Graben', NULL, 46, 47),
    ('Grebenstrasse', NULL, 47, 48),
    ('Gutenbergsplatz', NULL, 48, 48),
    ('Gymnasiumsstrasse', NULL, 49, 49),
    ('Hänleinsgässchen', NULL, 49, 49),
    ('Heidelbergerfassgasse', NULL, 49, 49),
    ('Heiliggrabgasse', NULL, 49, 50),
    ('Heringsbrunnengasse', NULL, 50, 50),
    ('Himmelgasse', NULL, 51, 52),
    ('Höfchen', NULL, 52, 53),
    ('Holzhofstrasse', NULL, 53, 53),
    ('Holzstrasse', NULL, 53, 54),
    ('Jakobsbergerstrasse', NULL, 54, 54),
    ('Ingelheimer Aue', NULL, 54, 55),
    ('Inselstrasse', NULL, 55, 55),
    ('Johannisstrasse', NULL, 55, 55);

SELECT * FROM Straßen

---


INSERT INTO Inventare (Autor, Titel, Verlag, Erscheinungsjahr, Band, Umfang)
VALUES ('Ernst Neeb', 'Verzeichnis der Kunstdenkmäler der Stadt Mainz', 'Mainz: Prickarts', 1905, '1. Teil', '127 Seiten');

SELECT * FROM Inventare

---

SELECT name FROM sqlite_master WHERE type = 'table';
PRAGMA foreign_keys = ON;
DROP TABLE IF EXISTS InventarStraße;

CREATE TABLE InventarStraße (
    InvID INTEGER NOT NULL,
    StrID INTEGER NOT NULL,
    PRIMARY KEY (InvID, StrID),
    FOREIGN KEY (InvID) REFERENCES Inventare (InvID) ON DELETE CASCADE,
    FOREIGN KEY (StrID) REFERENCES Straßen (StrID) ON DELETE CASCADE
);

---

INSERT INTO Orte (StrID, Hausnummer)
VALUES 
    (1, '1'),
    (1, '12'),
    (2, '3'),
    (3, '1'),
    (3, '23'),
    (3, '25'),
    (3, '26'),
    (3, '32'),
    (3, '34 u. 40'),
    (3, '44'),
    (3, '50'),
    (3, '54'),
    (3, '58'),
    (3, '60'),
    (3, '67'),
    (3, '73'),
    (3, '75'),
    (4, '2'),
    (4, '6'),
    (5, '1'),
    (5, '2'),
    (5, '3'),
    (5, '7'),
    (6, '1'),
    (7, '3'),
    (7, '5'),
    (7, '7'),
    (7, '9'),
    (7, '11'),
    (8, '1'),
    (8, '3–5'),
    (8, '7'),
    (9, '1'),
    (9, '2'),
    (9, '3'),
    (9, '6'),
    (9, '10–24'),
    (9, '11'),
    (9, '21'),
    (9, '25'),
    (9, '26'),
    (9, '28'),
    (10, '13'),
    (10, '17'),
    (11, '3'),
    (11, '4'),
    (11, '5'),
    (11, '7'),
    (11, '8–10'),
    (12, '1'),
    (12, '2'),
    (12, '8'),
    (12, '12'),
    (13, '1'),
    (13, '4'),
    (13, '7'),
    (13, '10'),
    (13, '15'),
    (13, '27 u. 27 1/10'),
    (13, '29'),
    (13, '36'),
    (13, '40'),
    (13, '47'),
    (13, '48'),
    (13, '49–51'),
    (13, '53'),
    (13, '60/62'),
    (14, '9'),
    (14, '31'),
    (14, '34'),
    (14, '35'),
    (14, '40'),
    (14, '65 u. 67'),
    (15, '2'),
    (15, '16'),
    (15, '18'),
    (15, '28'),
    (15, '47'),
    (15, '67/69'),
    (16, '1 1/10'),
    (17, '1'),
    (17, '2'),
    (17, '3'),
    (17, '5'),
    (17, '7'),
    (17, '9'),
    (17, '13'),
    (17, '25'),
    (18, '14'),
    (19, '5'),
    (19, '12'),
    (19, '37'),
    (19, '51'),
    (20, '2'),
    (20, '3'),
    (20, '4'),
    (21, '5'),
    (21, '7'), 
    (21, '9'),
    (22, '2 u. 2 1/10'),
    (22, '6/8'),
    (22, '11'),
    (23, '1'),
    (23, '2 u. 4'),
    (23, '3'),
    (25, '4'),
    (25, '5'),
    (25, '7'),
    (25, '9'),
    (25, '11'),
    (25, '13'),
    (25, '15'),
    (25, '22'),
    (25, '27'),
    (26, '2'),
    (27, '12'),
    (28, '2'),
    (29, '2'),
    (30, '3'),
    (30, '8'),
    (30, '9'),
    (30, '12 u. 12 1/10'),
    (30, '15, 17, 19'),
    (30, '18–20'),
    (30, '21'),
    (30, '22'),
    (30, '23'),
    (30, '24'),
    (30, '27'),
    (30, '29'),
    (30, '30'),
    (30, '31'),
    (30, '32'),
    (30, '37'),
    (30, '41'),
    (31, '2'),
    (32, '13'),
    (33, '1'),
    (33, '3'),
    (34, '1'),
    (34, '2'),
    (34, '9'),
    (35, '14'),
    (36, '1'),
    (36, '9'),
    (36, '13'),
    (37, '1'),
    (37, '2'),
    (38, '8'),
    (39, '2 1/10'),
    (39, '3'),
    (40, '27'),
    (40, '29'),
    (41, '1'),
    (41, '7'),
    (41, '11'),
    (42, '1'),
    (43, '6'),
    (43, '10'),
    (43, '26'),
    (43, '31'),
    (43, '32'),
    (43, '36'),
    (43, '55'),
    (44, '6'),
    (44, '10'),
    (45, '1'),
    (45, '3'),
    (45, '5'),
    (45, '7'),
    (45, '8'),
    (46, '8'),
    (46, '15'),
    (46, '20'),
    (46, '21'),
    (46, '24'),
    (46, '26'),
    (47, '1'),
    (48, '3'),
    (48, '9'),
    (49, '5'),
    (50, '2 1/10');

---


INSERT INTO Objekte (Name, Material, Datierung, Provenienz, OrtID) 
VALUES
    ('Statue Muttergottes mit dem Christuskind', 'Holz, ursp. versilbert und vergoldet', '1. H. 18. Jh.', 'stammt aus der Kirche Ober-Olm', 1),
    ('Pietà', NULL, 'vermutlich 1749', NULL, 2),
    ('Barockportal', NULL, 'ca. 1720', NULL, 3),
    ('Spätgothische Hauspforte', 'Holz', NULL, NULL, 4),
    ('Adlerapotheke', 'Holz', 'ca. 17. Jh.', NULL, 5),
    ('Wirtshausarm', 'Schmiedeeisen', '2. H. 18. Jh.', NULL, 6),
    ('Standbild der hl. Margareta mit dem Drachen', 'Stein', '2. H. 18. Jh.', NULL, 7),
    ('Zum Brauenfels', 'Fachwerkbau', '2. H. 17. Jh.', NULL, 8),
    ('Ehemaliges Augustinerkloster mit Kirche', NULL, NULL, NULL, 9),
    ('Lauben', NULL, 'Ende des 18. Jh.', NULL, 10),
    ('Lauben, Sponheimer Hof', NULL, '1. H. 18. Jh.', NULL, 11),
    ('Spätgotische Arkaden, Sponheimer Hof', NULL, NULL, NULL, 12),
    ('Lauben', NULL, '1. H. 18. Jh.', NULL, 13),
    ('Standbild Muttergottes mit dem Christuskind', NULL, '1. H. 18. Jh.', NULL, 14),
    ('Barockfassade, Zum Fuchs', NULL, '1. Viertel 18. Jh.', 'abgerissen Dezember 1903, Wiederverwendung geplant', 15),
    ('Zierliche Fassade im Stile Louis XVI.', NULL, NULL, NULL, 16),
    ('Fachwerkbau, Zum Spiegelberg', 'Holz und Stein', '1. H. 17. Jh.', NULL, 17),
    ('Einfach geschnitzte Haustüre in Louis XVI.', 'Holz', 'um 1750', NULL, 18),
    ('Zum schönen Brunnen, Zunftwappen', NULL, NULL, NULL, 19),
    ('Königsteiner später Dalberger Hof, spätgothischer Wohnbau',NULL, '15. bis 19. Jh.', NULL, 20),
    ('Zum Kölnischen Hof', NULL, 'um 1800', NULL, 21),
    ('Fechenbach-Laudenbacher Hof', NULL, '1. Viertel 18. Jh.', NULL, 22),
    ('Zum Goldenen Ochsen', NULL, NULL, NULL, 23),
    ('Jungfrau Maria', NULL, 'Mitte 18. Jh.', NULL, 24);




--- Abfragen

SELECT * FROM Objekte

---
SELECT * FROM Orte

---
SELECT 
    Orte.OrtID, 
    Straßen.Name AS Straßenname,
    Orte.Hausnummer
FROM 
    Orte
JOIN 
    Straßen 
ON 
    Orte.StrID = Straßen.StrID;

--- Anzahl der Objekte pro Straße
SELECT 
    Straßen.Name AS Straßenname,
    COUNT(Objekte.ObjID) AS Objektanzahl
FROM 
    Straßen
LEFT JOIN 
    Orte ON Straßen.StrID = Orte.StrID
LEFT JOIN 
    Objekte ON Orte.OrtID = Objekte.OrtID
GROUP BY 
    Straßen.StrID;












--- Orte ohne zugehörige Objekte

SELECT 
    Orte.OrtID,
    Straßen.Name AS Straßenname,
    Orte.Hausnummer
FROM 
    Orte
LEFT JOIN 
    Objekte ON Orte.OrtID = Objekte.OrtID
JOIN 
    Straßen ON Orte.StrID = Straßen.StrID
WHERE 
    Objekte.ObjID IS NULL;


--- Objekte eines bestimmten Materials in einer 
-- bestimmten Straße

SELECT 
    Objekte.ObjID,
    Objekte.Name AS Objektname,
    Objekte.Material,
    Straßen.Name AS Straßenname,
    Orte.Hausnummer
FROM 
    Objekte
JOIN 
    Orte ON Objekte.OrtID = Orte.OrtID
JOIN 
    Straßen ON Orte.StrID = Straßen.StrID
WHERE 
    Objekte.Material = 'Holz' 
    AND Straßen.Name = 'Augustinerstrasse';


--- Alle Objekte und die dazugehörigen Orte und Straßen

SELECT 
    Objekte.ObjID,
    Objekte.Name AS Objektname,
    Objekte.Material,
    Objekte.Datierung,
    Objekte.Provenienz,
    Orte.Hausnummer,
    Straßen.Name AS Straßenname
FROM 
    Objekte
JOIN 
    Orte ON Objekte.OrtID = Orte.OrtID
JOIN 
    Straßen ON Orte.StrID = Straßen.StrID;

--- Alle Straßen mit den darauf befindlichen Orten

SELECT 
    Straßen.StrID,
    Straßen.Name AS Straßenname,
    Orte.Hausnummer
FROM 
    Straßen
LEFT JOIN 
    Orte ON Straßen.StrID = Orte.StrID;

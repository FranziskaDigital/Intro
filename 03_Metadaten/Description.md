# Metadaten

Metadaten sind strukturierte Daten, die Informationen über spezifische Daten enthalten. Sie beschreiben damit andere Daten bzw. Datensätze.

Metadaten werden im Allgemeinen in administrative, deskriptive, strukturelle und technische Metadaten unterschieden.


## Metadaten-Schemata
Zur Speicherung und Übertragung von Metadaten haben sich eine Reihe von Metadaten-Schemata etabliert, die sich in unterschiedliche  – auch von Menschen lesbare – Formate übertragen lassen. Die Nutzung von Metadaten-Schemata soll die Interoperabilität von Metadaten erhöhen bzw. gewährleisten.

### Dublin Core
Ist ein internationaler Standard zur Beschreibung von digitalen und realen Dokumenten sowie anderen Objekten. Das Dublin Core Metadata Element Set besteht dabei im Kern lediglich aus 15 Elementen, die in verschiedenen Formaten (RDF/XML, OpenDocument, HTML) ausgedrückt werdenkönnen. Dublin Core wird von der Dublin Core Metadata Initiative entwickelt.
Siehe Beispieldatei: 03_Metadaten/DublinCore.xml

### Exif
Das Exchangeable Image File Format ist ein Standardformat für das Abspeichern von Metadaten in digitalen Bildern. In den Exif-Daten einer Bilddatei werden technische Informationen zur Aufnahme, unter anderem Kameramodell, Zeitpunkt der Aufnahme und Kameraeinstellungen, gespeichert. 
Der Exif-Standard gibt u.a. Auskunft über:

    - Datum und Uhrzeit
    - Orientierung (Bilddrehung um 90, 180 bzw. 270°)
    - Brennweite
    - Belichtungszeit
    - Blendenzahl
    - Belichtungsprogramm
    - Belichtungsindex (ISO-Wert)
    - Geographische Koordinaten (diese Daten können durch Geotagging hinzugefügt werden) und Höhe über dem Meeresspiegel
    - Vorschaubild („Thumbnail“)
    - Kameratyp


### METS
Metadata Encoding and Transmission Standard) ist ein Standard zur XMLbasierten Kodierung von deskriptiven, administrativen und strukturellen Metadaten von Objekten innerhalb einer digitalen Bibliothek. METS wirkt dabei als ein Container, bei dem in einzelnen Abschnitten andere Formate (z. B. Dublin Core, MODS, MARC) untergebracht werdenkönnen. Der METS-Standard wird von der Library of Congress gepflegt und das zugehörige Datenschema von der Digital Library Federation, einem nordamerikanischen Bibliotheksverbund weiterentwickelt.
Siehe Beispieldatei: 03_Metadaten/METS_1756131104.xml

### MODS
Metadata Object Description Schema ist ein XML-Format für bibliografische (deskriptive) Metadaten. Es gilt als Kompromiss zwischen der Komplexität des Bibliothekskatalogsformats MARC (Machine Readable Cataloging) und der Einfachheit von Dublin Core.MODS wird von der Library of Congress entwickelt.


| Aspekt               | METS                                     | MODS                            |
| -------------------- | ---------------------------------------- | ------------------------------- |
| Technologie          | XML                                      | XML                             |
| Primäre Anwendung    | Struktur und Metadaten digitaler Objekte | Bibliografische Metadaten       |
| Verhältnis zu Markup | Verwaltung von Metadaten und Dateien     | Bibliografische Katalogisierung |
| Flexibilität         | Integration anderer Standards            | Vereinfachung von MARC          |
| Zielgruppe           | Digitale Bibliotheken und Archive        | Bibliotheken und Katalogsysteme |

## Datenstandards, Thesauri und Klassifikationssysteme

CCO
AAT
UDS
CERIF
MARC

# Nicht-relationale Datenbanken
Nicht-relationale Datenbanken (NoSQL-Datenbanken) sind Datenbanksysteme, die nicht das relationale Modell verwenden, das auf Tabellen mit Zeilen und Spalten basiert. Sie benötigen keine festgelegten Tabellenschemata und verzichten zumeist auf den JOIN-Befehl. Eine Datenbankmodellierung ist jedoch auch hier notwendig.

## Allgemeines
Es gibt unterschiedliche NoSQL-Datenmodelle bzw. Arten von NoSQL-Datenbanksystemen. Zum Beispiel:
- **Key-Value-Datenbanken:** Schlüssel-Werte-Datenbanken basieren auf dem Schlüssel-Werte-Datenmodell. Sie gehören zu den einfachsten NoSQL-Datenbanksystemen
- **Objektdatenbanken:** Ist eine Art von Datenbank, die alle Daten als Objekte speichert. Ein Objekt ist eine Instanz einer Klasse. Ein Objekt entählt sowohl Daten (Attribute) als auch Funktionen und/oder Operationen, die auf diesen Daten ausgeführt werden können.
- **Dokumentenorientierte Datenbanken:** Hier werden die Daten in Form von Dokumenten (einer Datenstruktur) gespeichert. Diese Datenstruktur wird in einem flexiblen Format gespeichert (häufig: JSON).  Die darin liegenden Daten müssen keinem festen Schema folgen.
- **Graphdatenbanken:** Speichern Daten als Knoten und Kanten sowie Eigenschaften und sind darauf ausgelegt, Beziehungen auf sehr effiziente Weise analysieren und visualisieren zu können.

NoSQL-Datenbanken sind immer dann sinnvoll, wenn die Datenstruktur sehr heterogen/dynamisch ist, eine hohe Performance und/oder Skalierbarkeit erforderlich ist und komplexe Beziehungen zwischen den Daten (bspw. bei Graphen) verarbeitet werden müssen.

## Key-Value-Paare
Eine Art von NoSQL-Datenbanken, die auf einem sehr einfachen Konzept basiert sind die Key-Value-Datenbanken: sie speichern Daten als Schlüssel-Wert-Paare
- **Simples Datenmodell:** Daten werden als Schlüssel (Key) und den zugehörigen Werten (Values) gespeichert; jedes Element wird über seinen eindeutigen Schlüssel identifiziert
- **Flexibilität:** Sind in der Regel weniger strukturiert als relationale Datenbanken und erfordern kein vordefiniertes Schema. Bedeutet aber unter Umständen auch: komplexe Abfragen/Operationen, die Beziehungen zwischen Daten erfordern, können weniger effizient sein
- Gut geeignet für **Anwendungsfälle**, die schnelle Lese- und Schreibzugriffe auf eine große Anzahl von Schlüssel-Wert-Paaren erfordern und wo Flexibilität in der Datenmodellierung wichtiger ist als komplexe Abfragen und Transaktionen

## Dokumentenorientierte Datenbanken
Eine Art von NoSQL-Datenbank, die Daten in Dokumenten speichert. Die Dokumente enthalten strukturierte oder semi-strukturierte Daten.
- **Flexibilität:** Es braucht kein festes Schema innerhalb eines Dokuments. Jedes Feld kann unterschiedlich definiert sein.
- Gut geeignet für **Anwendungsfälle** im Bereich der Content-Management-Systeme oder für Benutzerdaten in Web-Apps, jedoch weniger geeignet für stark verknüpfte Daten.

## Graphdatenbanken
Eine weitere Art von NoSQL-Datenbank, die darauf spezialisiert ist, Daten als Graphen zu speichern und zu verarbeiten.
- **Datenmodellierung als Graph**: Modell aus Knoten und Kanten, die miteinander verbunden sind. Eignet sich zur Darstellung von Beziehungen
- **Beziehungen**: Graph-DBs sind auf die eﬃziente Verarbeitung von Beziehungen zwischen Entitäten spezialisiert. Sie ermöglichen komplexe Abfragen, um
Beziehungen zwischen verschiedenen Datenpunkten zu analysieren
- **Einsatzbereiche**: Gut für Anwendungsfälle, in denen Beziehungen und Netzwerke zwischen Datenpunkten entscheidend sind, wie beispielsweise soziale Netzwerke, Netzwerkanalysen, Wissensgraphen

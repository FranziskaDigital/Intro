# Beispiel Datenbereiningung mit regex

import pandas as pd

# Schritt 1: Datei ohne explizites Trennzeichen einlesen
with open('02_Digitalisierung/Mainz_Kunstverzeichnis_Privatbesitz.txt', 'r', encoding='utf-8') as file:
    lines = file.readlines()

# Schritt 2: Zeilen in ein DataFrame laden und Fehler korrigieren
df = pd.DataFrame(lines, columns=['Text']) # Falls jede Zeile separat als eine Einheit verarbeitet werden soll, dann ist die Umwandlung in einen DataFrame sinnvoll. 
# Falls nicht, reicht auch:
# with open("02_Digitalisierung/Mainz_Kunstverzeichnis_Privatbesitz.txt", "r", encoding="utf-8") as file:
    # Text = file.read()


# Beispielhafte Ersetzungen für OCR-Fehler
df['Text'] = df['Text'].str.replace(r'\bae\b', 'ä', regex=True)
df['Text'] = df['Text'].str.replace(r'\boe\b', 'ö', regex=True)
df['Text'] = df['Text'].str.replace(r'\bue\b', 'ü', regex=True)
df['Text'] = df['Text'].str.replace(r'\bB\b', 'ß', regex=True)

df["Text"] = df["Text"].str.replace(r"¬", "-", regex=True)


# Weitere spezifische Ersetzungen nach Bedarf hinzufügen

# Schritt 3: Bereinigte Daten speichern
with open('02_Digitalisierung/Mainz_Inventar_cleaned.txt', 'w', encoding='utf-8') as file:
    file.writelines(df['Text'].tolist())

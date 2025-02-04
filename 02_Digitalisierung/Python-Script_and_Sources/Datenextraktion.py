# Datenextraktion mit re und Pandas

import re
import pandas as pd

# Datei einlesen
with open("02_Digitalisierung/Mainz_Inventar_cleaned.txt", "r", encoding="utf-8") as file:
    text = file.read()

# Regex-Muster für 3 Wörter vor und nach "Haus"
pattern = r"(\b\w+\b\s+\b\w+\b\s+\b\w+\b)\s+\b[Hh]aus\b\s+(\b\w+\b\s+\b\w+\b\s+\b\w+\b)"

# Alle Treffer finden
matches = re.findall(pattern, text)

# In eine Pandas-Tabelle umwandeln
df = pd.DataFrame(matches, columns=["3 Wörter vor", "3 Wörter nach"])
df.insert(1, "Haus", "Haus")  # Die Spalte für "Haus" einfügen

# Tabelle ausgeben
print(df)

# Falls du die Daten speichern möchtest
df.to_csv("02_Digitalisierung/extrahierte_häuser_mainz.csv", index=False)

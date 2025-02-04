# regex mit Python-Modul re

import re

# Datei einlesen
with open("02_Digitalisierung/Mainz_Kunstverzeichnis_Privatbesitz.txt", "r", encoding="utf-8") as file:
    text = file.read()  # Liest den gesamten Text in einer Variable ein


# Entfernt alle Sonderzeichen (außer Buchstaben und Zahlen)
text = re.sub(r"[^a-zA-Z0-9\s]", "", text)

# Alle überflüssigen Leerzeichen entfernen
text = " ".join(text.split()) 

# Zeilenumbrüche durch Leerzeichen ersetzen
text = text.replace("\n", " ")  

# Den bereinigten Text in die Datei schreiben
with open("02_Digitalisierung/Mainz_Inventar_cleaned_Modul_re.txt", "w", encoding="utf-8") as file:
    file.write(text)  



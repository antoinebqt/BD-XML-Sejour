import json
import xml.etree.ElementTree as ET

# Ouverture et lecture du fichier XML
tree = ET.parse("../sejour.xml")
root = tree.getroot()

# Initialisation du dictionnaire de sortie
sortie = {}

# Parcours des éléments du fichier XML
for element in root.iter():
    if element.tag == "Colonie" or element.tag == "Groupe" or element.tag == "Accueil":
        nom_groupe = element.tag + " " + element.find("Nom").text
        jeunes = []
        for jeune in element.findall(".//Jeune"):
            jeunes.append({
                "Nom": jeune.find("Nom").text,
                "Prenom": jeune.find("Prenom").text,
                "Age": jeune.find("Age").text
            })
        sortie[nom_groupe] = jeunes

# Écriture du résultat dans un fichier JSON
with open("../outputs/bonus.json", "w") as fichier_sortie:
    json.dump(sortie, fichier_sortie, indent=2)


#!/bin/bash

# Vérifier le nombre d'arguments
if [ $# -ne 3 ]; then
    echo "Usage: $0 <dossier> <ancienne_chaine> <nouvelle_chaine>"
    exit 1
fi

dossier="$1"
ancienne_chaine="$2"
nouvelle_chaine="$3"

# Vérifier si le dossier existe
if [ ! -d "$dossier" ]; then
    echo "Le dossier '$dossier' n'existe pas."
    exit 1
fi

# Parcourir les fichiers .vmt dans le dossier donné
for fichier in "$dossier"/*.vmt; do
    if [ -f "$fichier" ]; then
        echo "Traitement de $fichier..."
        sed -i "s:$ancienne_chaine:$nouvelle_chaine:g" "$fichier"
    fi
done

echo "Terminé !"

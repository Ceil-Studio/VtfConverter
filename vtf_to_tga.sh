#!/bin/bash

# Vérification si Wine est installé
if ! command -v wine &>/dev/null; then
  echo "Wine n'est pas installé ou n'est pas accessible dans le chemin."
  exit 1
fi

# Vérification si le dossier est fourni en argument
if [ -z "$1" ]; then
  echo "Veuillez fournir le chemin du dossier contenant les images en argument."
  exit 1
fi

# Vérification si le dossier existe
if [ ! -d "$1" ]; then
  echo "Le dossier spécifié n'existe pas."
  exit 1
fi

HERE=$(pwd)

# Se déplacer dans le dossier spécifié
cd "$1" || exit 1

echo "format dxt1-5"
read formatt



# Boucle pour parcourir les fichiers d'image et exécuter la commande Wine pour chacun
#for image_file in *.png; do
#  wine $HERE/vtflib/bin/x64/VTFCmd.exe -file "$image_file" -format "$formatt"
#done
find -type f -name "*.tga" -exec wine "$HERE/vtflib/bin/x64/VTFCmd.exe" -file {} -format "$formatt" \;

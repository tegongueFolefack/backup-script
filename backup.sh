#!/bin/bash

# Vérifie si le nombre d'arguments est correct
if [[ $# != 2 ]]
then
  echo "backup.sh target_directory_name destination_directory_name"
  exit
fi

# Vérifie si les répertoires existent
if [[ ! -d $1 ]] || [[ ! -d $2 ]]
then
  echo "Invalid directory path provided"
  exit
fi

# Initialisation des variables
targetDirectory=$1
destinationDirectory=$2
currentTS=$(date +%Y%m%d%H%M%S)
backupFileName="backup_$currentTS.tar.gz"
origAbsPath=$(realpath $targetDirectory)
destDirAbsPath=$(realpath $destinationDirectory)

# Fichiers à sauvegarder
yesterdayTS=$(date -d "yesterday" +%Y%m%d)

declare -a toBackup

# Trouver les fichiers à sauvegarder
for file in $(find $targetDirectory -type f)
do
  if [[ $(stat -c %Y "$file") -gt $yesterdayTS ]]
  then
    toBackup+=("$file")
  fi
done

# Créer le fichier de sauvegarde
tar -czf "$destDirAbsPath/$backupFileName" "${toBackup[@]}"

echo "Backup created successfully: $destDirAbsPath/$backupFileName"

# Script de Sauvegarde (Backup Script)

Ce projet consiste en un script Bash automatisé pour effectuer des sauvegardes de fichiers. Le script prend un répertoire source et un répertoire de destination en tant qu'arguments et crée une archive des fichiers modifiés récemment dans le répertoire source. Cette archive est ensuite déplacée dans le répertoire de destination.

## Prérequis

Avant de commencer, assurez-vous d'avoir les éléments suivants :

- Un système Unix (Linux ou macOS) avec Bash installé.
- Les répertoires source et destination valides.
- Les permissions d'exécution pour le script.

## Étapes de Réalisation du Projet

### 1. **Vérification des Arguments**

Le script commence par vérifier que deux arguments sont fournis lors de l'exécution :

- Le premier argument est le répertoire source (répertoire à sauvegarder).
- Le second argument est le répertoire de destination (répertoire où la sauvegarde sera stockée).

Si ces arguments sont manquants, un message d'erreur est affiché et le script s'arrête.

### 2. **Validation des Répertoires**

Une fois les arguments fournis, le script vérifie si les deux répertoires existent et sont valides.

- Si l'un des répertoires est invalide ou inexistant, un message d'erreur est affiché et le script s'arrête.

### 3. **Définition des Variables**

Le script définit plusieurs variables utiles pour la création de la sauvegarde :

- **Répertoire source** : Le répertoire à partir duquel les fichiers seront sauvegardés.
- **Répertoire de destination** : Le répertoire où la sauvegarde sera déplacée après sa création.
- **Nom du fichier de sauvegarde** : Un nom de fichier unique basé sur la date et l'heure actuelles.
- **Timestamp** : Un horodatage de la sauvegarde pour garantir que chaque sauvegarde soit unique.

### 4. **Création de l'Archive de Sauvegarde**

Le script accède au répertoire source et crée une archive (généralement un fichier `.tar.gz`) contenant les fichiers modifiés récemment.

### 5. **Déplacement de la Sauvegarde**

Une fois l'archive créée, le script déplace cette archive dans le répertoire de destination spécifié.

### 6. **Gestion des Fichiers à Sauvegarder**

Le script sélectionne les fichiers à sauvegarder en fonction de leur date de modification. Par exemple, les fichiers modifiés depuis la dernière sauvegarde ou ceux qui répondent à d'autres critères définis dans le script.

### 7. **Exécution du Script**

Le script peut être exécuté en ligne de commande avec la syntaxe suivante :

```bash
./backup.sh /chemin/vers/le/répertoire/source /chemin/vers/le/répertoire/destination

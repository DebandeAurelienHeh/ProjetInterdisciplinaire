#!/bin/bash

# Définir les noms des sauvegardes avec un horodatage
date=$(date +"%Y-%m-%d_%H-%M-%S")
backup_dir="/backups"
www_backup_file="$backup_dir/www_backup_$date.tar.gz"
mysql_backup_file="$backup_dir/mysql_backup_$date.tar.gz"

# Fonction pour vérifier les droits
check_permissions() {
    if [ "$EUID" -ne 0 ]; then
        echo "Veuillez exécuter ce script en tant que root ou avec sudo."
        exit 1
    fi
}

# Fonction pour créer une sauvegarde
create_backup() {
    src_dir=$1
    dest_file=$2
    exclude_dirs=$3

    echo "Création de la sauvegarde de $src_dir dans $dest_file..."
    
    tar --warning=no-file-changed \
        $exclude_dirs \
        -czf "$dest_file" -C "$src_dir" .
    
    if [ $? -eq 0 ]; then
        echo "Sauvegarde de $src_dir terminée avec succès dans $dest_file."
    else
        echo "Erreur lors de la sauvegarde de $src_dir dans $dest_file."
        exit 1
    fi
}

# Fonction pour nettoyer les anciennes sauvegardes
cleanup_old_backups() {
    find "$backup_dir" -name "*_backup_*.tar.gz" -mtime +7 -delete
    echo "Nettoyage des sauvegardes de plus de 7 jours effectué."
}

# Vérification des permissions
check_permissions

# Création du répertoire de sauvegarde s'il n'existe pas
mkdir -p "$backup_dir"

# Sauvegarde de /var/www
create_backup "/var/www" "$www_backup_file" "--exclude=/var/www/tmp --exclude=/var/www/cache"

# Sauvegarde de /var/lib/mysql
create_backup "/var/lib/mysql" "$mysql_backup_file" ""



#!/bin/bash

# Définition des couleurs
BLUE='\033[1;34m'
CYAN='\033[1;36m'
NC='\033[0m' # No Color
YELLOW='\033[1;33m'
GREEN='\033[0;32m'

# Fonction pour collecter les données sur l'utilisation du disque
collect_disk_performance() {

    # Taux de lecture/écriture
    disk_io=$(iostat -d -x 1 1 | awk '/^sda/ {print "Taux de lecture: " $6 " KB/s, Taux d'\''écriture: " $7 " KB/s"}')

    # Utilisation de l'espace disque
    disk_usage=$(df -h --output=pcent / | sed 1d)

    # Espace disque total
    disk_total=$(df -h --output=size / | sed 1d)

    # Espace disque disponible
    disk_available=$(df -h --output=avail / | sed 1d)

    # Espace disque utilisé
    disk_used=$(df -h --output=used / | sed 1d)

    # Affichage des données avec des couleurs et des décorations
#    echo -e "${YELLOW}                   ******************************************************************${NC}"
    echo -e "${BLUE}                     		   Performance de l'espace disque dur   ${NC}"
    echo -e "${YELLOW}                   ******************************************************************${NC}"
    echo -e "${GREEN}                     *        Utilisation de l'espace disque (%):${NC} ${YELLOW}$disk_usage${NC}"
    echo -e "${GREEN}                     *        Espace disque total:${NC} ${YELLOW}$disk_total${NC}"
    echo -e "${GREEN}                     *        Espace disque disponible:${NC} ${YELLOW}$disk_available${NC}"
    echo -e "${GREEN}                     *        Espace disque utilisé:${NC} ${YELLOW}$disk_used${NC}"
    echo -e "${GREEN}                     *        $disk_io${NC}"
#    echo -e "${YELLOW}                   ******************************************************************${NC}"
}




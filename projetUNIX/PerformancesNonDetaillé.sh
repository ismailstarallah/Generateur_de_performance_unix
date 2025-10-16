#!/bin/bash

# Définition des couleurs
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color
BLUE='\033[1;34m'


Performance_non_d(){
# Obtenir la date et l'heure actuelles
date_time=$(date "+%Y-%m-%d %H:%M:%S")

# Obtenir l'utilisation du CPU (en %)
cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')

# Obtenir l'utilisation de la mémoire (en %)
memory_usage=$(free | grep Mem | awk '{print $3/$2 * 100.0}')

# Obtenir l'utilisation du disque (en %)
disk_usage=$(df -h | awk '$NF=="/"{printf "%s", $5}' | sed 's/%//')

# Obtenir l'utilisation du réseau (en octets/s)
network_usage=$(sar -n DEV 1 1 | grep 'Average.*ens33' | awk '{print $5}')

#echo -e "${YELLOW}              *****************************************************************${NC}"
echo -e "${BLUE}                 		 Performance non détaillée                           ${NC}                           "
echo -e "${YELLOW}               *****************************************************************${NC}"
echo -e "${GREEN}                *          Date et heure actuelles :${NC} ${YELLOW}$date_time${NC}               "    
echo -e "${GREEN}                *          Utilisation du CPU (%):${NC} ${YELLOW}$cpu_usage${NC}               "
echo -e "${GREEN}                *          Utilisation de la mémoire (%):${NC} ${YELLOW}$memory_usage${NC}    "
echo -e "${GREEN}                *          Utilisation du disque (%):${NC} ${YELLOW}$disk_usage${NC}          "
echo -e "${GREEN}                *          Utilisation du réseau (octets/s):${NC} ${YELLOW}$network_usage${NC}   "
#echo -e "${YELLOW}               *****************************************************************${NC}"

}

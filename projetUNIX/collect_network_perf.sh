#!/bin/bash

# Définition des couleurs
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color
BLUE='\033[1;34m'

# Fonction pour collecter les données sur l'utilisation du réseau
collect_network_performance() {

# Adresse IP
ip_address=$(ip addr show | grep -oP '(?<=inet\s)\d+(\.\d+){3}' | head -n 1)

# Utilisation du réseau
network_usage=$(sar -n DEV 1 1 | grep 'Average.*ens33' | awk '{print $5}')

# Débit montant
upload_speed=$(sar -n DEV 1 1 | grep 'Average.*ens33' | awk '{print $6}')

# Débit descendant
download_speed=$(sar -n DEV 1 1 | grep 'Average.*ens33' | awk '{print $7}')

#echo -e "${YELLOW}                     *********************************************${NC}"
echo -e "${BLUE}                                  Performance de réseau                      ${NC}"
echo -e "${YELLOW}                      ************************  ******************${NC}"
echo -e "${GREEN}                       *  Adresse IP:${NC} ${YELLOW}$ip_address${NC}"
echo -e "${GREEN}                       *  Utilisation du réseau (kb/s):${NC} ${YELLOW}$network_usage${NC}"
echo -e "${GREEN}                       *  Débit montant (kb/s):${NC} ${YELLOW}$upload_speed${NC}"
echo -e "${GREEN}                       *  Débit descendant (kb/s):${NC} ${YELLOW}$download_speed${NC}"
echo -e "${YELLOW}                      ********************************************${NC}"

}



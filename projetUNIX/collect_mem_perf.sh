#!/bin/bash

# Définition des couleurs
BLUE='\033[1;34m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Fonction pour collecter les données sur l'utilisation de la mémoire
collect_memory_performance() {

    # Utilisation de la mémoire
    mem_usage=$(free | awk '/Mem/{printf "%.2f", $3/$2*100}')

    # Mémoire totale
    mem_total=$(free | awk '/Mem/{print $2}')

    # Mémoire disponible
    mem_available=$(free | awk '/Mem/{print $7}')

    # Mémoire utilisée
    mem_used=$(free | awk '/Mem/{print $3}')

    # Espace swap total
    swap_total=$(free | awk '/Swap/{print $2}')

    # Espace swap utilisé
    swap_used=$(free | awk '/Swap/{print $3}')

    # Espace swap disponible
    swap_available=$(free | awk '/Swap/{print $4}')

    # Affichage des données avec des couleurs
   
#    echo -e "${YELLOW}                    ****************************************************${NC}"
    echo -e "${BLUE}                                 Performance de l'espace mémoire   ${NC}"
    echo -e "${YELLOW}                    ****************************************************${NC}"
    echo -e "${GREEN}                     *        Utilisation de la mémoire (%):${NC} ${YELLOW}$mem_usage${NC}"
    echo -e "${GREEN}                     *        Mémoire totale (ko):${NC} ${YELLOW}$mem_total${NC}"
    echo -e "${GREEN}                     *        Mémoire disponible (ko):${NC} ${YELLOW}$mem_available${NC}"
    echo -e "${GREEN}                     *        Mémoire utilisée (ko):${NC} ${YELLOW}$mem_used${NC}"
    echo -e "${GREEN}                     *        Espace swap total (ko):${NC} ${YELLOW}$swap_total${NC}"
    echo -e "${GREEN}                     *        Espace swap utilisé (ko):${NC} ${YELLOW}$swap_used${NC}"
    echo -e "${GREEN}                     *        Espace swap disponible (ko):${NC} ${YELLOW}$swap_available${NC}"
# les informations sur la mémoire tampon
    echo -e "${GREEN}                     *        Mémoire tampon (Mo):${NC} ${YELLOW}$(free -m | awk '/Mem/{print $6}')${NC}"

# les informations sur la mémoire partagée
    echo -e "${GREEN}                     *        Mémoire partagée (ko):${NC} ${YELLOW}$(cat /proc/meminfo | awk '/Shmem:/{print $2}')${NC}"

#    echo -e "${YELLOW}                    ****************************************************${NC}"
}


#!/bin/bash

# Définition des couleurs
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color
BLUE='\033[1;34m'

# Fonction pour collecter les données sur l'utilisation du CPU
collect_cpu_performance() {

    # Utilisation du CPU
    cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')

    # Fréquence du CPU
    cpu_freq=$(cat /proc/cpuinfo | grep "cpu MHz" | awk '{print $4}' | head -n 1)

    # Nombre de cœurs physiques et logiques
    cpu_count_physical=$(lscpu | grep "Core(s) per socket" | awk '{print $4}')
    cpu_count_logical=$(lscpu | grep "CPU(s)" | awk '{print $2}'| head -n 1)

get_cpu_load=$(cat /proc/loadavg | awk '{print "1 min:", $1, ", 5 min:", $2, ", 15 min:", $3}')

    # Affichage des données avec des couleurs

#    echo -e "${YELLOW}              ****************************************************************************${NC}"
    echo -e "${BLUE}                     		  	Performance de CPU                          ${NC}                           "
    echo -e "${YELLOW}               ****************************************************************************${NC}"
    echo -e "${GREEN}                *          Utilisation du CPU (%):${NC} ${YELLOW}$cpu_usage${NC}               "    
    echo -e "${GREEN}                *          Fréquence du CPU (MHz):${NC} ${YELLOW}$cpu_freq${NC}                "
    echo -e "${GREEN}                *          Nombre de cœurs physiques:${NC} ${YELLOW}$cpu_count_physical${NC}   "
    echo -e "${GREEN}                *          Nombre de cœurs logiques:${NC} ${YELLOW}$cpu_count_logical${NC}   "
    echo -e "${GREEN}                *          Charge moyenne du CPU :${NC} ${YELLOW}$get_cpu_load${NC}   "
   # echo -e "${YELLOW}               ****************************************************************************${NC}"

}

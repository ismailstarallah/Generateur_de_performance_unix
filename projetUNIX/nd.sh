#!/bin/bash

echo ""
echo "   _____ _    _ ______  _____ _____          _____  _______ _    _ "
echo "  / ____| |  | |  ____|/ ____|  __ \   /\   |  __ \|__   __| |  | |"
echo " | (___ | |__| | |__  | (___ | |__) | /  \  | |__) |  | |  | |__| |"
echo "  \___ \|  __  |  __|  \___ \|  _  / / /\ \ |  ___/   | |  |  __  |"
echo "  ____) | |  | | |____ ____) | | \ \|/ ____ \| |       | |  | |  | |"
echo " |_____/|_|  |_|______|_____/|_|  \_\_/    \_\_|       |_|  |_|  |_|"
echo ""
echo "                                   ....Au revoir.... !"

# Définition des couleurs
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

date_time=$(date "+%Y-%m-%d %H:%M:%S")

# Obtenir l'utilisation du CPU (en %)
cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')

# Obtenir l'utilisation de la mémoire (en %)
memory_usage=$(free | grep Mem | awk '{print $3/$2 * 100.0}')

# Obtenir l'utilisation du disque (en %)
disk_usage=$(df -h | awk '$NF=="/"{printf "%s", $5}' | sed 's/%//')

# Obtenir l'utilisation du réseau (en octets/s)
network_usage=$(sar -n DEV 1 1 | grep 'Average.*eth0' | awk '{print $5}')

# Afficher les données avec des couleurs et des décorations
echo -e "${GREEN}Date et heure actuelles :${NC} $date_time"
echo -e "${YELLOW}Utilisation du CPU (en %) :${NC} $cpu_usage"
echo -e "${YELLOW}Utilisation de la mémoire (en %) :${NC} $memory_usage"
echo -e "${YELLOW}Utilisation du disque (en %) :${NC} $disk_usage"
echo -e "${YELLOW}Utilisation du réseau (en octets/s) :${NC} $network_usage"


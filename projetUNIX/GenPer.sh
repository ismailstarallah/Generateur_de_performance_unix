#!/bin/bash

clear;figlet "PERFGEN"
# Fonction pour afficher le menu
afficher_menu() {
    echo -e "   \e[1;34m***********************************\e[0m"
    echo -e "   \e[1;34m*\e[0m Generateur de Performances :    \e[1;34m*\e[0m"
    echo -e "   \e[1;34m*\e[0m---------------------------------\e[1;34m*\e[0m"
    echo -e "   \e[1;34m*\e[0m \e[1;33m1. Performance de CPU           \e[1;34m*\e[0m"
    echo -e "   \e[1;34m*\e[0m \e[1;33m2. Performance de Mémoire       \e[1;34m*\e[0m"
    echo -e "   \e[1;34m*\e[0m \e[1;33m3. Performance de Disque dur    \e[1;34m*\e[0m"
    echo -e "   \e[1;34m*\e[0m \e[1;33m4. Performance de Réseau        \e[1;34m*\e[0m"
    echo -e "   \e[1;34m*\e[0m \e[1;33m5. Donnés de Performance        \e[1;34m*\e[0m"
    echo -e "   \e[1;34m*\e[0m \e[1;33m6. Quitter                      \e[1;34m*\e[0m"
    echo -e "   \e[1;34m***********************************\e[0m"
}

# Fonction pour exécuter les scripts
executer_script() {
    case $1 in
        1) source ./collect_CPU_perf.sh; collect_cpu_performance ;;
        2) source ./collect_mem_perf.sh; collect_memory_performance;;
        3) source ./collect_disk_perf.sh; collect_disk_performance ;;
        4) source ./collect_network_perf.sh ;collect_network_performance;;
        5) source ./gestion_perf.sh ;;
        *) echo "   Option invalide." ;;
    esac
}

# Boucle principale du menu
while true; do
    afficher_menu
    read -p "   Choisissez une option : " choix
    case $choix in
        1|2|3|4|5) executer_script $choix ;;
        6) figlet "    ....Au revoir.... !" ; exit ;;
        *) echo "     Option invalide." ;;
    esac
done


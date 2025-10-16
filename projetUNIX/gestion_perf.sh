performance_file="./donneeperformance.txt"

#!/bin/bash
CYAN='\033[1;36m'
NC='\033[0m'

ycenter_text() {
    termwidth="$(tput cols)"
    padding="$(printf '%0.1s' ={1..500})"
    printf '%*.*s %s %*.*s\n' 0 "$(((termwidth-2-${#1})/2))" "$padding" "$1" 0 "$(((termwidth-1-${#1})/2))" "$padding"
}

# Fonction pour afficher une option avec un numéro coloré

center_text() {
    termwidth="$(tput cols)"
    padding="$(printf '%0.1s' ={1..500})"
    printf '%*.*s %s %*.*s\n' 0 "$(((termwidth-2-${#1})/2))" "$padding" "$1" 0 "$(((termwidth-1-${#1})/2))" "$padding"
}

menu_option() {
    printf "$(tput setaf 6)%s$(tput sgr0). %s\n" "$1" "$2"
}

# Définition des couleurs
title_color=$(tput setaf 4)    # Blue
option_color=$(tput setaf 2)   # Green
reset_color=$(tput sgr0)       # Reset to default color

# Affichage du titre du menu
center_text "${title_color}Choisissez comment vous voulez recevoir les données : ${reset_color}"
# Affichage des options du menu
menu_option  "${option_color}                                                             1-Affichage dans le terminal${reset_color}"
menu_option  "${option_color}                                                             2-Par mail${reset_color}"
menu_option  "${option_color}                                                             3-Redirection dans un fichier${reset_color}"

# Exemple de décoration pour le bas du menu
printf '%*s\n' "$(tput cols)" '' | tr ' ' -

# Lire le choix de l'utilisateur
read -p "${option_color}Votre choix : ${reset_color} " choix


# Traitement du choix...
	case $choix in
        1) read -p "${option_color}Pour afficher les performances en détail, veuillez saisir 1, sinon, saisissez 0 :  ${reset_color}" choixx
		 case $choixx in 
		1)
     		source ./collect_CPU_perf.sh; collect_cpu_performance
		echo -e "\033[36m================================================================================================================"
		echo -e "================================================================================================================\033[0m"
#	echo "================================================================================================================"
 #               echo "================================================================================================================"
		source ./collect_mem_perf.sh; collect_memory_performance
		echo -e "\033[36m================================================================================================================"
		echo -e "================================================================================================================\033[0m"
#		echo "================================================================================================================"
#		echo "================================================================================================================"
        	source ./collect_disk_perf.sh; collect_disk_performance
		echo -e "\033[36m================================================================================================================"
		echo -e "================================================================================================================\033[0m"
#echo "================================================================================================================"
#               echo "================================================================================================================"
        	source ./collect_network_perf.sh ;collect_network_performance;;
		0) source ./PerformancesNonDetaillé.sh;Performance_non_d;;
		*)
		echo "${option_color}Option invalide.${reset_color}" ;;
		    esac
		;;

	2) read -p "${option_color}Pour envoyer les performances en détail, veuillez saisir 1, sinon, saisissez 0 :  ${reset_color}" choixx
                read -p "${option_color}Veuillez saisir l'adresse e-mail à laquelle vous souhaitez recevoir le rapport : ${reset_color}" email

		if [ ! -f "$performance_file" ]; then
                        touch "$performance_file"
                fi
		> $performance_file

		case $choixx in
                1)
                source ./collect_CPU_perf.sh; collect_cpu_performance >> $performance_file
                echo "-----------------------------------------------------" >> $performance_file
		echo "-----------------------------------------------------" >> $performance_file
                echo "-----------------------------------------------------" >> $performance_file
		source ./collect_mem_perf.sh; collect_memory_performance >> $performance_file
                echo "-----------------------------------------------------" >> $performance_file
		echo "-----------------------------------------------------" >> $performance_file
                echo "-----------------------------------------------------" >> $performance_file
                source ./collect_disk_perf.sh; collect_disk_performance >> $performance_file
		echo "-----------------------------------------------------" >> $performance_file
		echo "-----------------------------------------------------" >> $performance_file
                echo "-----------------------------------------------------" >> $performance_file
                source ./collect_network_perf.sh ;collect_network_performance >> $performance_file

		echo "Vous trouverez ci-joint votre rapport ." | mail -s "Rapport de Performances en détail." -A $performance_file $email

		;;

		0)
			source ./PerformancesNonDetaillé.sh; Performance_non_d >> $performance_file
			echo "Vous trouverez ci-joint votre rapport de performances." | mail -s "Rapport de Performances non détaillé." -A $performance_file $email 

		;;
                *) echo "${option_color}Option invalide.${reset_color}" ;;
                    esac
                ;;
        3) read -p "${option_color}Pour redirecter les performances en détail, veuillez saisir 1, sinon, saisissez 0 : ${reset_color}" choixx

		 read -p "${option_color}----------Veuillez indiquer le chemin où vous souhaitez enregistrer ce fichier---------- : ${reset_color} " chemin
                if [ ! -f "$chemin" ]; then
                        touch "$chemin"
                fi
                > $chemin
		case $choixx in 
                1)

                source ./collect_CPU_perf.sh; collect_cpu_performance >> $chemin
		echo "=====================================================" >> $chemin
                echo "=====================================================" >> $chemin
                source ./collect_mem_perf.sh; collect_memory_performance >> $chemin
              	echo "=====================================================" >> $chemin
                echo "=====================================================" >> $chemin
                source ./collect_disk_perf.sh; collect_disk_performance >> $chemin
		echo "=====================================================" >> $chemin
                echo "=====================================================" >> $chemin
                source ./collect_network_perf.sh ;collect_network_performance >> $chemin
                echo "-----------------------------------------------------" >> $chemin

		 ;;

		0) source ./PerformancesNonDetaillé.sh; Performance_non_d >> $chemin;;

		*) echo "${option_color}Option invalide.${reset_color}" ;;
			esac
		;;
	*) echo "${option_color}Option invalide.${reset_color}" ;;
    esac

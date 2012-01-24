#!/bin/bash

clear

echo "#############################################################"
echo "###### TP1 - Exercice 2 - Nicolas KAROLAK - Groupe 3x2 ######"
echo "#############################################################"

# Si il n'y a qu'un seul paramètre passé en argument
if [ ${#} == "1" ]; then 
	# Si le paramètre est un dossier
	if [ -d ${1} ]; then
		echo -e "\n-------------------------------------------------------------\n"
		echo "Les 5 plus gros fichiers du répertoire $1 sont :"
		# Liste les 5 plus gros fichiers du répertoire en paramètre
		filesNameBig=$(ls -S $1 | head -n 5)
		# Pour chacun des fichiers listés on affiche son nom et sa taille
		for nameBig in ${filesNameBig}; do
			echo "- '${nameBig}' avec une taille de $(du -h ${1}/${nameBig} | cut -f 1)"
		done
		
		echo -e "\n-------------------------------------------------------------\n"

		echo "Les 5 plus anciens fichiers du répertoire $1 sont :"
		# Liste les 5 plus anciens fichiers du répertoire en paramètre
		filesNameOld=$(ls -t | tail -n 5)
		# Pour chacun des fichiers listés on affiche son nom et sa date
		for nameOld in $filesNameOld; do
			dateFichier=$(ls -l ${1}/${nameOld} | cut -d' ' -f 6) # Récupère date en YYYY/MM/DD
			dateFormatee=$(date -d ${dateFichier} '+%d/%m/%Y') # Formate la date en DD/MM/YYYY
			echo "- '${nameOld}' modifié le $dateFormatee"
		done
		
		echo -e "\n-------------------------------------------------------------\n"
	else
		echo -e "\n /!\\ Le paramètre saisit n'est pas un répertoire /!\\ \n"
	fi
else
	echo -e "\n /!\\ Veuillez saisir un seul paramètre /!\\ \n"
fi

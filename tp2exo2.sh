#!/bin/bash

# Fonction de parcours récursif de répertoire avec compte de fichiers
function fctParcours
{
	local numCount=0
	
	# Pour chaque élément listé du répertoire
	for file in `ls ${1}`; do
		# Retourne un code en fonction du type de « fichier »
		`./tp2exo1.sh ${1}/${file}`
		# Si l'élément est un dossier
		if [ $? -eq 2 ]; then
			# Rappel de la fonction
			fctParcours ${1}/${file}
		# Sinon, l'élément est un fichier « normal » ou « spécial »
		else
			# Compteur local
			((++numCount))
		fi
	done
	# Ajout du compte au tableau
	arrTree=('\n'${1}' ('$numCount' fichiers)' ${arrTree[*]})
}

oldIFS=$IFS
IFS=$'\n'

# Si un paramètre est passé en argument
if [ ${#} == 1 ] && [ -d ${1} ]; then
	# Suppression du « / » à la fin du répertoire en paramètre
	stDir=${1%/}
	# Appel de la fonction
	fctParcours ${stDir}
	# Affichage du résultat final
	echo -e ${arrTree[*]}'\n'
# Sinon, il n'y a aucun ou plusieurs arguements
else
	echo -e "\nLe paramètre saisit n'est pas un répertoire.\n"
fi

IFS=$oldIFS

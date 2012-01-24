#!/bin/bash

# Si un paramètre est passé en argument
if [ ${#} == 1 ] && [ -e ${1} ]; then
	# Si l'arguement est un fichier
	if [ -f ${1} ]; then
		exit 1
	# Si l'argument est un dossier
	elif [ -d ${1} ]; then
		exit 2
	# Sinon l'argument est « autre chose »
	else
		exit 3
	fi
# Sinon, il n'y a aucun ou plusieurs arguements
else
	exit 0
fi

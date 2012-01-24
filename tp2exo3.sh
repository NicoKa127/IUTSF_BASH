#!/bin/bash

# Fichiers et dossier sources
arrSrcBkp=('/home/nkarolak/test1' '/home/nkarolak/test2' '/home/nkarolak/hosts.sh' '/dev/zero')
# Dossier de destination
stDstBkp=${HOME}'/backup'
# Récupération de la date au bon format
stDate=`date +%Y/%m/%d`

# Si le dossier du jour existe
if [ -e ${stDstBkp}'/'${stDate} ]; then
	# On le supprime
	`rm -rf ${stDstBkp}/${stDate}`
	echo -e '\nIl existait déjà une sauvegarde pour ce jour, celle-ci a été supprimée.'
fi

# Fonction créatrice de l'arborescence des répertoires de sauvegarde
function fctCreateTree
{
	oldIFS=${IFS}
	IFS='/'
	
	local stDir stParentDir
	
	# Pour chaque élément du réperoire passé en paramètre
	for stDir in ${1}; do
		IFS=${oldIFS}
		# Si l'élément est défini
		if [ ${stDir} ]; then
			# Concaténation du répertoire parent et du répertoire « courant »
			stParentDir=${stParentDir}'/'${stDir}
			# Si le répertoire n'existe pas
			if [ ! -e ${stParentDir} ]; then
				# On le créer
				mkdir ${stParentDir}
			fi
		fi
	done
}

# Pour chaque élément du tableau des répertoires à sauvegarder
for stDir in ${arrSrcBkp[*]}; do
	# Si l'élément est un dossier
	if [ -d ${stDir} ]; then
		# Appel de la fonction de création d'arborescence
		fctCreateTree ${stDstBkp}'/'${stDate}${stDir}
		# Copie récursive du répertoire à sauvegarder
		cp -R ${stDir} ${stDstBkp}'/'${stDate}${stDir}
		echo -e '\nLe dossier « '${stDir}' » a bien été sauvegardé.'
	# Sinon s'il s'agit d'un fichier
	elif [ -f ${stDir} ]; then
		# Suppression du nom du fichier
		# (pour éviter de créer un répertoire du nom du fichier dans l'arborescnce)
		stFileDir=${stDir%/*}
		# Appel de la fonction de création d'arborescence
		fctCreateTree ${stDstBkp}'/'${stDate}${stFileDir}
		# Copie du fichier à sauvegarder
		cp ${stDir} ${stDstBkp}'/'${stDate}${stFileDir}
		echo -e '\nLe fichier « '${stDir}' » a bien été sauvegardé.'
	# Sinon, il s'agit d'un fichier ou dossier « spécial »
	else
		echo -e '\nErreur, « '${stDir}' » ne peut pas être sauvegardé.'
	fi
done

echo -e '\n'

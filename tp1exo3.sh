#!/bin/bash

clear

echo "#############################################################"
echo "###### TP1 - Exercice 3 - Nicolas KAROLAK - Groupe 3x2 ######"
echo "#############################################################"
echo -e "\n"

# Sasie de la valeur de ma borne supérieure
read -p "Saisissez la borne supérieure [100] : " borneSup
# Si aucune valeur saisie mettre la valeur à 100
if [ -z "${borneSup}" ]; then
	borneSup=100
fi
# Sinon si la valeur saisie est numérique
if [ "$(echo ${borneSup} | grep "^[ [:digit:] ]*$")" ]; then
	randomNum=$((RANDOM%${borneSup}+1)) # Génère un nombre aléatoire
	ctr=0
	# Tant que la réponse est erronée
	while (( choiceNum != randomNum )); do
		(( ctr++ ))
		echo -e "\n"
		read -p "Saisissez un nombre entre 1 et ${borneSup} : " choiceNum
		# Si la valeur saisie est numérique
		if [ "$(echo ${choiceNum} | grep "^[ [:digit:] ]*$")" ]; then
			if (( ${choiceNum} == ${randomNum} )); then # Correct
				echo -e "Bravo, le nombre mystère était ${randomNum} !!"
			elif (( ${choiceNum} > ${randomNum} )); then # Trop petit
				echo -e "Le nombre mystère est plus petit que ${choiceNum}."
			elif (( ${choiceNum} < ${randomNum} )); then # Trop grand
				echo -e "Le nombre mystère est plus grand que ${choiceNum}."
			fi
		else
			echo -e "/!\\ La valeur saisie n'est pas numérique /!\\"
		fi
	done
	echo -e "\nVous avez mis ${ctr} coups pour le trouver."
else
	echo -e "\n/!\\ La valeur saisie n'est pas numérique /!\\"
fi

echo -e "\n"

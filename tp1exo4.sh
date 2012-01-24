#!/bin/bash

clear

echo "#############################################################"
echo "###### TP1 - Exercice 4 - Nicolas KAROLAK - Groupe 3x2 ######"
echo "#############################################################"
echo -e "\n"

# Valeurs par défaut
d="C'est trop cool le BASH"
codeFG=
codeBG=
codeS=

# Tant qu'il y a un argument à la commande
while [ ${1} ]; do
	# Cas où le premier argument est...
	case ${1} in
		"-h" | "--help")
			# Affichage de l'aide
			echo "Fonctionnement de ./tp1exo04.sh"
			echo -e "\t-h ou --help : affichage de l'aide"
			echo -e "\t-d ou --demo : chaine de demonstration (la mettre entre \"...\" si elle contient des espaces)"
			echo -e "\t-fg ou --foreground-color : Couleur du texte"
			echo -e "\t-bg ou --background-color : Couleur du surlignage"
			echo -e "\t-s ou --style : Décoration du texte"
			echo -e "\t-v ou --verbose : Mode bavard\n"
			
			echo -e "\tCodes couleurs disponibles : (Bk)lack, (R)ed, (G)reen, (Y)ellow, (Be)lue, (P)urple, (C)yan, (L)ight grey"
			echo -e "\tCodes style disponibles : (R)egular, (B)old, (U)nderline\n"
			
			echo "Exemple :"
			echo -e "\t./tp1exo4.sh -d \"C'est trop cool le BASH\" -fg Bk -bg R -s R"
			shift 1 # Supprime le premier argument
		;;
		"-d" | "--demo")
			# Chaine de caractère à traiter
			d=${2} # Récupère le deuxième argument
			shift 2 # Supprime les deux premiers arguments
			
			paramd=1
		;;
		"-fg" | "--foreground-color")
			# Couleur du texte
			fg=${2} # Récupère le deuxième argument
			shift 2 # Supprime les deux premiers arguments
			case ${fg} in
				"Bk")
					codeFG=30 # Noir
				;;
				"R")
					codeFG=31 # Rouge
				;;
				"G")
					codeFG=32 # Vert
				;;
				"Y")
					codeFG=33 # Jaune
				;;
				"Be")
					codeFG=34 # Bleu
				;;
				"P")
					codeFG=35 # Violet
				;;
				"C")
					codeFG=36 # Bleu ciel
				;;
				"L")
					codeFG=37 # Gris
				;;
				*)
					# Erreur
					echo "Couleur de police inconnue, pour obtenir de l'aide tapez :"
					echo -e "\t./tp1exo4.sh -d \"C'est trop cool le BASH\" -h"
					break # Termine le programme
				;;
			esac
		;;
		"-bg" | "--background-color")
			# Couleur du surlignage
			bg=${2} # Récupère le deuxième argument
			shift 2 # Supprime les deux premiers arguments
			case ${bg} in
				"Bk")
					codeBG=40 # Noir
				;;
				"R")
					codeBG=41 # Rouge
				;;
				"G")
					codeBG=42 # Vert
				;;
				"Y")
					codeBG=43 # Jaune
				;;
				"Be")
					codeBG=44 # Bleu
				;;
				"P")
					codeBG=45 # Violet
				;;
				"C")
					codeBG=46# # Bleu ciel
				;;
				"L")
					codeBG=47 # Gris
				;;
				*)
					# Erreur
					echo "Couleur de fond inconnue, pour obtenir de l'aide tapez :"
					echo -e "\t./tp1exo4.sh -d \"C'est trop cool le BASH\" -h"
					echo -e "\n"
					break # Termine le programme
				;;
			esac
		;;
		"-s" | "--style")
			# Décoration du texte
			s=${2} # Récupère le deuxième argument
			shift 2 # Supprime les deux premiers arguments
			case ${s} in
				"R")
					codeS=0 # Normal
				;;
				"B")
					codeS=1 # Gras
				;;
				"U")
					codeS=4 # Souligné
				;;
				*)
					# Erreur
					echo "Style inconnu, pour obtenir de l'aide tapez :"
					echo -e "\t./tp1exo4.sh -d \"C'est trop cool le BASH\" -h"
					echo -e "\n"
					break # Termine le programme
				;;
			esac
		;;
		"-v" | "--verbose") # Mode bavard
			echo "Mode bavard activé"
			# Si une chaine de démonstration à été passée en paramètre
			if [ ${paramd} ]; then
				echo "Chaine de démonstration en paramètre : "${d}
			else
				echo "Pas de chaine de démonstration en paramètre"
			fi
			# Si une couleur de texte à été passée en paramètre
			if [ ${fg} ]; then
				echo "Couleur de texte en paramètre : "${fg}
			else
				echo "Pas de couleur de texte en paramètre"
			fi
			# Si une couleur de surlignage à été passée en paramètre
			if [ ${bg} ]; then
				echo "Couleur de surlignage en paramètre : "${bg}
			else
				echo "Pas de couleur de surlignage en paramètre"
			fi
			# Si un style à été passée en paramètre
			if [ ${s} ]; then
				echo "Style en paramètre : "${s}
			else
				echo "Pas de style en paramètre"
			fi
			echo -e "\n"
			shift 1 # Supprime le premier argument
		;;
		*)
			# Erreur
			echo "Erreur de saisie, pour obtenir de l'aide tapez :"
			echo -e "\t./tp1exo4.sh -d \"C'est trop cool le BASH\" -h"
			echo -e "\n"
			break # Termine le programme
		;;
	esac
done

# Pour changer les couleurs et le style
if [ ${codeS} ]; then # Si le style est défini
	echo -e -n "\e["${codeS}"m"
fi
if [ ${codeFG} ]; then # Si le foreground est défini
	echo -e -n "\e["${codeFG}"m"
fi
if [ ${codeBG} ]; then # Si le background est défini
	echo -e -n "\e["${codeBG}"m"
fi
echo ${d} # Affichage de la chaine de caractères
echo -e -n "\e[0m" # Pour réinitialiser les couleurs et le style

echo -e "\n"

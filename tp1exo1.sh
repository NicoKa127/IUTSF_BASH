#!/bin/bash

clear

echo "#############################################################"
echo "###### TP1 - Exercice 1 - Nicolas KAROLAK - Groupe 3x2 ######"
echo "#############################################################"

# Affiche le nom du script ainsi que le nombre d'arguments passé en paramètre
echo -e "\n-------------------------------------------------------------\n"
echo "Le nom du script est $0 et $# paramètres sont passés."
echo -e "\n-------------------------------------------------------------\n"

# Affiche les arguments 1, 3 et 10 passés en paramètre
echo "Paramètre 1 -> $1"
echo "Paramètre 3 -> $3"
echo "Paramètre 10 -> $10"
echo -e "\n-------------------------------------------------------------\n"

# Affiche le nombre des paramètres restant après un décalage de 3 positions
shift 3
echo "Après un décalage de 3, il reste maintenant $# paramètres."
echo -e "\n-------------------------------------------------------------\n"

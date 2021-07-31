#!/bin/bash

# Longitud variable que guarda el numeor de caracteres de la cadena
# echo -e permite añadir otros parametros "\n..." salto de linea
# echo -en output en la misma linea
# [${cadena:$i:1}] el :1 mostrar output caracter a caracter

longitud=${#1}

echo -e "\n Cadena contiene $1"
echo -e "\n Cadena tiene $longitud caracteres"
echo -e "\n"

for (( i=0; i<longitud; i++ )); do
	echo -en " [${1:$i:1}]"
done
	echo -e "\n"
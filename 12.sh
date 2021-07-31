#!/bin/bash
# Comprueba si existe un ficheeo el cual se le pasa como parametro
# Lo buscara solo en la ruta relativa donde fue ejecutado el script
# -a Comprueba si existe, -f si es un fichero, man test para mas opciones

if [ -a $1 ]; then

	if [ -f $1 ]; then
		echo "Si existe y es un archivo"
	if [ -r $1 ]; then
		echo "El archivo se puede leer"
	fi
	if [ -x $1 ]; then
		echo "El archivo se puede ejecutar"
	fi
	fi
else
	echo "No existe o no es un archivo"
fi
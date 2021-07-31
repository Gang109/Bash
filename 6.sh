#!bin/bash

# -d comprueba si existe y si es un directorio
# para mas opciones man bash
if [ -d $1 ]; then
	echo "El fichero existe"
else
	echo "El archivo no existe"
fi
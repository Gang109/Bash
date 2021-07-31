#!/bin/bash

if [ $1 -lt 0 ];
then
	echo "El usuario $1 no existe."
else
	echo "El usuario $1 existe."
fi
# pgrep -u NombreUsuario, para ver el PID del usuario
# sort -u, si se repite la entrada te la muestra una unica vez
PID=`pgrep -u "$1"`
conectados=`who | cut -d " " -f 1 - | grep "$1" | sort -u`
if ! [ $1 = $ conectados ] > /dev/null 2>&1
then
	echo "El usuario $1 no esta conectado."
	read -p "Quieres enviarle un correo a $1 [Y/N] " correo
	if [[ $correo == "y" || $correo == "Y" || $correo == "yes" || $correo == "YES" ]]
	then
		echo "Enviando correo a $1"
		mail $1
	else
		exit 1
	fi
else
	echo "El usuario $1 esta conectado. "
	read -p "Quieres echar a $1 [Y/N] " echar
	if [[ $echar == "y" || $echar == "Y" || $echar == "yes" || $echar == "YES" ]]
	then
		kill -9 $PID
	else
		exit 1
	fi
fi
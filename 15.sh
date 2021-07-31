#!/bin/bash

# -c2 parametro de ping numero de pings realizados
# if [ $? -eq 0 ]; si la salida del ultimo es exitosa sigue con el script

clear

echo " Los siguientes ordenadores estan conectados "

conta=1
total=0

while [ $conta -lt 255 ]; do
	
	ping 192.168.1.$conta -c2 > /dev/null
	if [ $? -eq 0 ]; then
		echo
		echo "Ordenador 192.168.1.$conta esta conectado."
		total=$[$total+1]
	fi
	conta=$[$conta+1]
done
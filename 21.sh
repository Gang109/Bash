#!/bin/bash

fecha=`date +%Y-%m-%d`

IFS=":"
while read ciclos
do
	for i in $ ciclos;
	do
		creados=`cat /etc/group | cut -d ":" -f1 | grep "$i"`
		if [ "$i" == "$creados" ]
		then
			echo "El grupo $i ya existe"
		else
			echo "Se ha creado el grupo $i"
			groupadd $i
		fi
		if [ -d ]
		then
			echo "Ya existe el directorio $i"
		else
			echo "Se creara el directorio $i"
			mkdir $i
		fi
	done
done < ciclos.txt


echo -n "Nombre: "
read nombre
echo -n "Primer apellido: "
read ape1
echo -n "Segundo apellido: "
read ape2
echo -n "Ciclo: "
read ciclo

usuario=`cat /etc/passwd | cut -d ":" -f1 | grep "$nombre"`
grupo=`cat /etc/group | cut -d ":" -f1 | grep "$ciclo"`

if [ "$nombre" == "$usuario" ]
then
	echo "El alumno esta dado de alta $nombre."
	if [ "$ciclo" == "$grupo" ]
	then
		echo "El alumno esta dado de alta en el ciclo $ciclo."
		echo "El alumno $nombre esta dado de alta en el ciclo $ciclo." >> errores$fecha
		echo $nombre $ape1 $ape2 $ciclo >> errores$fecha
	else
		echo "Se dara de alta al alumno $nombre en el ciclo $ciclo."
		inicial=`$nombre | cut -c1`
		usermod -a -G $ciclo $inicial$ape1$ape2
		echo $nombre $ape1 $ape2 $ciclo >> creados$fecha
	fi
else
	echo "Se dara de alta al alumno $nombre $ape1 $ape2 en el ciclo $ciclo."
	useradd $inicial$ape1$ape2 -d /$ciclo/$inicial$ape1$ape2
	inicial=`nombre | cut -c1`
	usermod -g $ciclo $inicial$ape1$ape2
	echo "nombre $ape1 $ape2 $ciclo >> creados$fecha
fi
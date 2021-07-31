#!/bin/bash

# cat datos.txt | cut -f2 -d$'\t', tab como delimitador
# tr "\t" " " < a.txt > b.txt eliminar tabulacion
# tr -s ' ' < a.txt > b.txt sustituir espacios por un unico espacio

tr "\t" " " < datos.txt > temp.txt
tr -s ' ' < temp.txt > datos.txt
rm -rf temp.txt

# Comprueba paso de parametros
parametros=2
if [ $# -eq $parametros ]
then
	# Si se introducen parametros llamamos la funcion con parametros
	conparametros
else
	# si no encuentra parametros llamamos menu
	menu
fi

# Esta funcion sera llamada desde el menu
function callmodulo {
	echo -n "Introduzca el codigo del modulo: "
	read optcod
	
while IFS=" " read ape1 ape2 nombre modulo nota anio
do
	if [ $optanio == $anio ] && [ $optcod == $modulo ]
	then
		echo "Alumnos del modulo $optcod durante el curso $optanio" >> /scripts/$1$2
		echo "===================================================" >> /scripts/$1$2
		echo "$nombre $ape1 $ap2 $modulo $nota $anio" /scripts/$1$2
	else
		echo "No fue prefesor durante el año $optanio. Fin de proceso" >> /scripts/$1$2
	fi
done < datos.txt

menu
}


# Si encuentra parametros seran pasados a esta funcion
conparametros () {
while IFS=' ' read ape1 ape2 nombre modulo nota anio
do
	if [ $1 == $anio ] && [ $2 == $modulo ] >/dev/null 2>&1
	then
		echo "Alumnos del modulo $optcod durante el curso $optanio" >> /scripts/$1$2
		echo "===================================================" >> /scripts/$1$2
		echo "$nombre $ape1 $ap2 $modulo $nota $anio" >> /scripts/$1$2
	else
		echo "No fue prefesor durante el año $optanio. Fin de proceso" >> /scripts/$1$2
	fi
done < datos.txt
 
}


menu {
while true
do
	echo
	echo " Menu"
	echo "****************"
	echo "CODIGO MODULO"
	echo "SIM    Sistemas informaticos"
	echo "IAIG   Implantacion de aplicaciones"
	echo "RDAL   Redes de area local"
	echo "SGBD   Bases de datos"
	echo "FDPR   Fundamentos de programacion"
	echo -n "Introduzca el año (0 Para salir): "
	read optanio
	case $optanio in
		"0" ) exit 1
		;;
		* ) callmodulo
		;;
	esac
done
}
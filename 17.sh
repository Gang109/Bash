#!/bin/bash

pausa()
{
	echo Pulse [Intro] para volver al menu principal
	read tecla >> /dev/null
	menu
}

general()
{
while true
do
	echo "Vamos a buscar los alumnos de $mod en el año $anio"
	alumnos=`cat notas.txt | grep "$anio" | grep "$mod"`
	echo $alumnos
	pause
done
}

salir()
{
	clear
	echo
	echo Hasta la vista $0
	echo
	exit 0
}


in2001()
{
while true
do
	clear
	echo
	anio=2001
	echo "========================"
	echo "Estamos en el año 2001"
	echo "========================"
	echo "a. RAl"
	echo "b. SIM"
	echo "c. FOL"
	echo "d. RET"
	echo "e. FPR"
	echo -n "Dime el modulo [a,b,c,d,e]? "
	read opcion2001
	if [ $opciones2001 == "a" ]
	then
		mod=ral
	elif [ $opciones2001 == "b" ]
	then
		mod=sim
	elif [ $opciones2001 == "c" ]
	then
		mod=fol
	elif [ $opciones2001 == "d" ]
	then
		mod=ret
	else
		mod=fpr
	fi
	case $opcion2001 in 
		a) general;;
		b) general;;
		c) general;;
		d) general;;
		e) general;;
	esac
done
}


in2002()
{
while true
do
	clear
	echo
	anio=2002
	echo "========================"
	echo "Estamos en el año 2002"
	echo "========================"
	echo "a. RAl"
	echo "b. SIM"
	echo "c. FOL"
	echo "d. RET"
	echo "e. FPR"
	echo -n "Dime el modulo [a,b,c,d,e]? "
	read opcion2002
	if [ $opciones2002 == "a" ]
	then
		mod=ral
	elif [ $opciones2002 == "b" ]
	then
		mod=sim
	elif [ $opciones2002 == "c" ]
	then
		mod=fol
	elif [ $opciones2002 == "d" ]
	then
		mod=ret
	else
		mod=fpr
	fi
	case $opcion2001 in 
		a) general;;
		b) general;;
		c) general;;
		d) general;;
		e) general;;
	esac
done
}


menu ()
{
while true
do
	clear
	echo
	echo "=========================="
	echo "		AÑOS		"
	echo "=========================="
	echo "1. 2001"
	echo "2. 2002"
	echo "3. Fin"
	echo -n "Dime el año [0,1,2,3]? "
	read opcion
	case $opcion in
		1) in2001;;
		2) in2002;;
		3) salir;;
	esac
done
}	

menu
#!/bin/bash

while true
do
	echo "Menu contable"
	echo "----------------"
	echo "0. Salir"
	echo "1. Introducir apuntes"
	echo "2. Ordenar apuntes"
	echo "3. Visualizar apuntes"
	echo "4. Imprimir apuntes"
	echo "5. Calcular total importe"
	echo "6. Subshell"
	echo
	echo -n "Seleccione opcion: "
	read opcion

	case $opcion in
	"0" ) exit
	;;
	"1" ) ./parte1
	;;
	"2" ) ./parte2
	;;
	"3" ) ./parte3
	;;
	"4" ) ./parte4
	;;
	"5" ) ./parte5
	;;
	"6" ) ./bin/bash
	;;
	esac
done

------------------------------------------------------------------------

Parte 1
#!/bin/bash

archivo=`date +%y%m%d`

while true
do
	echo -n "importe [0 para salir]: "; read importe
	if [ "$importe" == "0" ]; then
		exit 0
	fi
	echo -n "Concepto: "; read concepto
	echo -n "Fecha: "; read fecha
	echo "$importe:$concepto:$fecha" >> $archivo.apu
done

------------------------------------------------------------------------

Parte 2
#!/bin/bash

archivo=`date +%y%m%d`

if [ -f "$archivo.apu" ]
then
	sort $archivo.apu -t ":" -k2 > $archivo.apu.ord
else
	echo "No existe archivo de apuntes del dia"
	exit 1
fi

------------------------------------------------------------------------

Parte 3
#!/bin/bash

if ./parte2
then
	archivo=`date +%y%m%d`
	less $archivo.apu.ord
else
	echo "Error"
fi

------------------------------------------------------------------------

Parte 4
#!/bin/bash

if ./parte2
then
	archivo=`date +%y%m%d`
	if lp $archivo.apu.ord
	then
		echo "Se ha mandado el archivo a la cola de impresion"
	else
		echo "Error, no hay cola de impresion predeterminada"
	fi
else
	echo "Nada que imprimir"
fi

------------------------------------------------------------------------

Parte 5
#!/bin/bash
archivo=`date +%y%m%d`
if [ -f $archivo.apu ]; then
	IFS=":"
	total=0
	while read importe b c
	do
		let total=$total+$importe
	done < $archivo.apu
	echo "Suma: $total"
else
	echo "No hay apuntes del dia para calcular"
	exit 1
fi
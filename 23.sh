#!/bin/bash
total=0
anterior=""
nombre`cat /etc/passwd | cut -d ":" -f 1 | grep "$1"`
id=`cat /etc/passwd | cut -d ":" -f 3 | grep "$2"`
echo "====================" > "Informede$nombre$id"
echo "Informe de ventas" >> "Informede$nombre$id"
echo "Codigo empleado: " $id >> "Informede$nombre$id"
echo "Nombre empleado: " $nombre >> "Informede$nombre$id"
echo "--------------------" >> "Informede$nombre$id"
echo "Concepto		Importe" >> "Informede$nombre$id"
echo "---------------------" >> "Informede$nombre$id"

while IFS=":" read codigoemp concepto importe
do
	if [ "$codigoemp" = "$id" ]
	then
		if [ "$concepto" = "$anterior" ]
		then
			let total=$total+$importe
		else
			anterior=$concepto
			let total=$total+$importe
			echo "$concepto $importe" >> "Informede$nombre$id"
		fi
	fi
done < ventas.log
comision=`echo "scale=2;$total*0.05 | bc`
echo "Total		$total" >> "Informede$nombre$id"
echo "Comision		$comision" >> "Informede$nombre$id"
mail -a "Informede$nombre$id" -s "Informe" $1 < /dev/null
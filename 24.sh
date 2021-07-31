#!/bin/bash

anterior=" "
usuarios=0
echo "Usuario bytes"
cat actividad.log | sort -k1 > temp
while IFS=":" read nombre archivo accion size
do
	if [ $usuarios -eq 0 ]
	then
		echo "Primera interacion" $nombre
		let usuarios=$usuarios+1
		anterior=$nombre
	fi
	echo "Actual: " $nombre
	if [ $usuarios -gt 0 ]
	then
		if [ "$nombre" = "$anterior" ]
		then
			echo "El mismo" $nombre
			let total=$total+$size
			let usuarios=$usuarios+1
			echo "$Nombre $total"
		fi
		if [ "$nombre" != "$anterior" ]
		then
			echo "Distinto: " $nombre
			echo "$anterior $total"
			anterior=$nombre
			let total=$total+$size
			total=0
			let total=$total+$size
		fi
	fi
	let sumatotal=$sumatotal+$size
done < temp
echo "Gran total: $sumatotal"
echo "Usuarios $usuarios"
rm -rf temp
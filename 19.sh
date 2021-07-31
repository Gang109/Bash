#!/bin/bash

rm -rf total.log
rm -rf temp
clear
IFS=":"
tconcepto=0
total=0
anterior=" "

while read codemp nombreapellidos comision
do
	if [ $1 = $codemp ]
	then
		nombre=$nombreapellidos
		comi=$comision
	else
		echo
	fi
done < empleados

echo $nombre >> total.log
echo "CONCEPTO IMPORTE" >> total.log

cat ventas.log | sort -k2 > temp
while read codigoemp concepto importe
do
	if [ $1 = $codigoemp ]
	then
		let total=total+importe
		if [ $concepto = $anterior ]
		then
			let tconcepto=tconcepto+importe
		fi
		if [ $concepto != $anterior ]
		then
			tconcepto=0
			let tconcepto=tconcepto+importe
		fi
		anterior=$concepto
		echo "$concepto $tconcepto" >> total.log
	fi
done < temp

acobrar=`echo "scale=2;$total*0.05" | bc`
echo "------------------------------" >> total.log
echo "TOTAL(€)		$total >> total.log
echo "COMISION(%)	$comi >> total.log
echo "A COBRAR(€)	$acobrar >> total.log
#!/bin/bash

clear
total=0
rm -rf rescate.apu
# find / buscara desde el directorio raiz
# -type tipo de fichero que buscara -f archivo, -d directorio
# -name con comillas dobles

for i in `find / type f -name "*.apu"`
do
	echo "$i" >> /rescate.apu
done

echo "======================"
echo "INFORME DEL RESCATE"
echo "======================"
echo "FECHA CONCEPTO IMPORTE"
echo "----- -------- --------"
# -r read con recursividad
while read -r archivo;
do
	while IFS":" read importe concepto fecha
	do
		let total=total+importe
		echo "~fecha $concepto $importe"
	done < "$archivo"
done < rescate.apu
echo "-------------------------"
echo "TOTAL ...		$total"
echo "--------------------------"
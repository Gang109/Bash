#!/bin/bash

# cat el script abre directamente el fichero~
# IFS separador de campos, 2>/dev/null redireccionar todos los errores

rm -rf ventasmenor.txt;
rm -rf ventasmayor.txt;

cat ventas.txt | \

while IFS=":" read nombre ventas
do
	if [ $ventas -lt 500 2>/dev/null ]; then
		echo "$nombre $ventas" >> ventasmenor.txt
	else
		echo "$nombre "ventas" >> ventasmayor.txt
	fi
done
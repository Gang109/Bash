#!/bin/bash

rm -rf rescatenotas
rm -rf informenotas
rm -rf informenotas2
rm -rf notas
rm -rf modulos
rm -rf notas*
for i in `find / -name "*.notas"`
do
	echo $i >> rescatenotas
done

while read -r archivo
do
	while IFS=":" read ape2 ape1 nombre modulo notas
	do
		echo "$ape":$ape1:$nombre $modulo $notas" >> informenotas
	done < $archivo
done < rescatenotas
tr "," ":" < infomenotas > informenotas2
cat informenotas | grep "$modulo" | cut -d":" -f4 | sort -u >> modulos
while IFS=":" read modulo
	for i in $modulo
	do
		total=0
		for y in `cat informenotas2 | grep "$modulo" | cut -d":" -f5`
		do
			echo $y >> notas$modulo
		done
		alumnos=`cat informenotas2 | grep "$modulo" | cut -d":" -f4,5 | wc -l`
		while read notas
		do
			for x in notas
			do
				let total=$total+$x
				let media=$[$total/$alumnos]
			done
		done < notas$modulo
	done
	echo "Modulo: $modulo	Alumnos: $alumnos	Media: $media"
done < modulos
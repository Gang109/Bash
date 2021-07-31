#!/bin/bach

read -p "Introduce tu edad: " edad
echo 
if [ $edad -lt 18 ]; then
	echo "No puedes votar"
else
	echo "Puedes votar"
fi
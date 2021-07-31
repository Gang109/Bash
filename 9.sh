#!/bin/bash

# Comprueba si un numero es par o impar
if [ $((${1} % 2)) -eq 0 ]; then
	echo "El numero es par"
else
	echo "El numero es impar"
fi
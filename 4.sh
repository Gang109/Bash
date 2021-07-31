#!/bin/bash

parametros=2

if [ $# -eq $parametros ]; then

mkdir $1;

:>$2;

mv $2 $1

else
	echo "Error debes introducir dos parametros"
fi
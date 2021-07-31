#!/bin/bash

# -n 5 como maximo se pueden introducir 5 digitos
# -p para que guarde el valor en la variable al final de la linea, omitir $1

read -n 5 -p "Introduce tu codigo postal: " CP
echo
case $ CP in
	110*)
		echo "Madrid" ;;
	120*)
		echo "Cadiz" ;;
	*)
		echo "No completado" ;;
esac
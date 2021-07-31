#!/bin/bash

# Comprobar si existe el archivo extensiones
if [ -f extensiones ]
then
  echo "El archivo extensiones existe."
else
  echo "El archivo extensiones no existe."
fi

# Comprobar paso de parametros
if [ $# -eq 0 ]
then
  echo "No se ha recibido parametro."
fi

# Comprobar si existe el archivo que se le pasa
if [ -f $1 ]
then
  echo "El archivo $1 existe"
  echo "$1" > archivo
  # Numero indeterminado de puntos, le da la vuelta y se queda con el
primer campo
  encontrarextension=`cat archivo | rev | cut -d"." -f1 | rev`
  echo $encontrarextension > encontrarextension
else
  echo "El archivo $1 no existe"
fi

# Leer el archivo extensiones
while IFS=":" read extension aplicacion descripcion
  do
    # Leer la extension
    while read miextension
      do
      # Comparar la extension con las del archivo extensiones
      if [ "$extension" == "$miextension" ]
      then
        echo "La extension es $miextension, la descripcion del archivo es $descripcion"
        $aplicacion $1
        if [ $? -eq 0 ]
        then
          echo "No se puede ejecutar la aplicacion"
        fi
      else
        echo "No fue posible encontrar la extension." >> /dev/null
      fi
  done < encontrarextension
done < extensiones

rm -rf encontrarextension
rm -rf archivo
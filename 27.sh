#!/bin/bash

anterior=""
grantotalf=""
contaf=""
if [ $# -eq 0 ]
then
  echo "No se han recibido parametros"
  exit 1
fi

rm -rf "/tmp.$1"
rm -rf "provincia.$1"
rm -rf "provincia.$1.tmp"
rm -rf *temp*
rm -rf decadapartido
rm -rf sinordenar
rm -rf ordenados
if ! find /elecciones -name "$1*" > /dev/null
then
  echo
else
  find /elecciones -name "$1*" > "tmp.$1"
  while read archivo
  do
    while IFS=":" read partido votos
    do
      touch "provincia.$1"
      echo "$partido:$votos" >> "provincia.$1"
    done < $archivo
  done < tmp."$1"
  if [ -f provincia.$1 ]
  then
    echo "Hay datos de la provincia $1"
  else
    echo "No hay datos de la provincia $1"
    exit 1
  fi
  while IFS=":" read partido votos
  do
    if [ ! -f "$partido.temp.$1" ]
    then
      #lo creo
      echo "$partido:$votos" > "$partido.temp.$1"
      let conta=$conta+1
      contaf=$conta
      let grantotal=$grantotal+$votos
    else
      #añado
      echo "$partido:$votos" >> "$partido.temp.$1"
      let grantotal=$grantotal+$votos
      grantotalf=$grantotal
    fi
  done < "provincia.$1"

  ls | grep "temp" > decadapartido
  echo "Partido         votos"
  while read temporal
  do
    for i in $temporal
    do
    votos=""
      while IFS=":" read partido2 votos2
      do
        let total=$total+$votos2 > /dev/null
        partidos=$partido2
      done < "$i"
      touch sinordenar
      echo "$partidos $total" >> sinordenar
      sort -k 2n -r sinordenar > ordenados
      total=0
    done
  done < decadapartido
  cat ordenados
  echo "Total           $grantotalf"
fi
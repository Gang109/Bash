#!/bin/bash

# Crea un archivo con la extension que le pasamos
echo "Introduzca una extension para el archivo: "
read ext
touch "/scripts/miArchivo.${ext}"
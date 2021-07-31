#!/bin/bash
clear

echo "Hola, $USER"
echo

echo "La fecha de hoy es `date`, esta es la semana `date + "%V"`."
echo

echo "Estos son los usuarios actualemente conectados: "
w | cut -d " " -f 1 - | grep -v USER | sort -u
echo

echo "El sistema es `uname -s` sobre una arquitectura `uname -m`."
echo

echo "El tiempo de actividad desde inicio:"
uptime -s
echo
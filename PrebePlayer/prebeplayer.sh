#!/bin/bash
# Script de prueba de PrebeShell
echo "Bienvenido al PrebePlayer"

if [ $(dpkg -l | grep -c $1) -ne 0 ];					#Si el número de coicidencias es distinto de 0
	then
	echo 'Se ha encontrado el programa'					#Se encontró el programa
	exit 0
else
	echo 'No se ha encontrado el programa'				#Sino, no se encontró y...
	sudo apt-get install mpg123							#... lo instala
fi
exit
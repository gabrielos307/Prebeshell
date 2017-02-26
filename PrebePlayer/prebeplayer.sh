#!/bin/bash
# Script de prueba de PrebePlayer


if [ $(dpkg -l | grep -c mpg123) -ne 0 ];				#Si el número de coicidencias es distinto de 0
	then
	echo 'Se ha encontrado el programa'					#Se encontró el programa
	exit 0
else
	echo 'No se ha encontrado el programa'				#Sino, no se encontró y...
	#sudo apt-get install mpg123							#... lo instala
fi

echo -e "\e[1;36m\t|-_-_-_-_-_-_-_-_-_ BIENVENIDO AL PREBEPLAYER -_-_-_-_-_-_-_-_-_|\e[0m"

exit_value=0											#Valor inicial de una variable de salida para el ciclo siguiente

while [ $exit_value -ne 1 ]							#Ciclo en el que se tendrán las opciones de control del reproductor
do
	echo -e "\e[1;36m\t|-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-|\e[0m"
	echo -e "\e[1;36m\t|-_-                                                         -_-|\e[0m"
	echo -e "\e[1;36m\t|-_- 1) Reproducir lista de la carpeta actual                -_-|\e[0m"
	echo -e "\e[1;36m\t|-_- 2) Cambiar de carpeta                                   -_-|\e[0m"
	echo -e "\e[1;36m\t|-_- 3) Subir una carpeta                                    -_-|\e[0m"
	echo -e "\e[1;36m\t|-_- 4) Listar archivos y subcarpetas de la carpeta actual   -_-|\e[0m"
	echo -e "\e[1;36m\t|-_- 5) Mostrar las opciones del reproductor                 -_-|\e[0m"
	echo -e "\e[1;36m\t|-_- 6) Salir del reproductor                                -_-|\e[0m"
	echo -e "\e[1;36m\t|-_-                                                         -_-|\e[0m"
	echo -e "\e[1;36m\t|-_-_---------------Reproduciendo actualmente---------------_-_-|\e[0m"
	echo -e "\e[1;36m\t|-_-                                                         -_-|\e[0m"
	echo -e "\e[1;36m\t|-_-                                                         -_-|\e[0m"
	echo -e "\e[1;36m\t|-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-|\e[0m"
	echo -ne "\tOpción >> "
	read opt
	case $opt in
		1)
			echo -e "\e[1;32m\t Reproduciendo la lista... \e[0m"
		;;
		
		2)
			echo -e "\e[1;32m\t Cambiando de carpeta... \e[0m"
		;;
		3)
			echo -e "\e[1;32m\t Subiendo carpeta... \e[0m"
		;;
		4)
			echo -e "\e[1;32m\t Listando archivos... \e[0m"
		;;
		5)
			echo -e "\e[1;32m\t Cargando opciones del reproductor... \e[0m"
		;;
		6)
			echo -e "\e[1;32m\t Saliendo... \e[0m"
		;;
		*)
			echo -e "\e[1;32m\t No he encontrado la opción. ALV \e[0m"
		;;
	esac


	exit_value=0
done

exit
#!/bin/bash
# Script de prueba de PrebePlayer

clear
#while [ $(dpkg -l | grep -c mpg123) -eq 0 ]
while [[ -z $(ls -d /usr/bin/mpg123) ]]
do
	clear
	echo -e "\e[1;31m\t No se ha encontrado el programa mpg123 \e[0m"	#Sino, no se encontró y...
	echo -ne "\e[1;32m\t ¿Desea instalarlo? \e[0m"
	echo -e "\e[1;32m\t [Y/N] \e[0m"
	echo -ne "\t >> "
	read opt
	case $opt in
		y|Y)
			sudo apt-get install mpg123							#... lo instala
			echo -e "\e[1;32m\t INSTALACIÓN COMPLETADA \e[0m"
		;;
		n|N)
			echo -e "\e[1;32m\t Tal vez para la próxima. Hasta luego... \e[0m"
			sleep 2
			exit
		;;
		*)
			echo -e "\e[1;31m\t Opción no valida \e[0m"
			sleep 1
			clear
		;;
	esac
done
echo -e "\e[1;34m\t Abriendo PrebePlayer V1.0.0 \e[0m"
sleep 2


exit_value=0													#Valor inicial de una variable de salida para el ciclo siguiente

while [ $exit_value -ne 1 ]										#Ciclo en el que se tendrán las opciones de control del reproductor
do
	clear
	echo -e "\e[1;36m\t|-_-_-_-_-_-_-_-_-_ BIENVENIDO AL PREBEPLAYER -_-_-_-_-_-_-_-_-_|\e[0m"
	echo -e "\e[1;36m\t|-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-|\e[0m"
	echo -e "\e[1;36m\t|-_-                                                         -_-|\e[0m"
	echo -e "\e[1;36m\t|-_- 1) Reproducir lista de la carpeta actual                -_-|\e[0m"
	echo -e "\e[1;36m\t|-_- 2) Cambiar de carpeta                                   -_-|\e[0m"
	echo -e "\e[1;36m\t|-_- 3) Subir una carpeta                                    -_-|\e[0m"
	echo -e "\e[1;36m\t|-_- 4) Listar archivos y subcarpetas de la carpeta actual   -_-|\e[0m"
	echo -e "\e[1;36m\t|-_- 5) Mostrar las opciones del reproductor                 -_-|\e[0m"
	echo -e "\e[1;36m\t|-_- 6) Salir del reproductor                                -_-|\e[0m"
	echo -e "\e[1;36m\t|-_-                                                         -_-|\e[0m"
	echo -e "\e[1;36m\t|-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-_-|\e[0m"
	echo -e "\e[1;36m\t|-_-_------------------Reproduciendo ahora------------------_-_-|\e[0m"
	echo -e "\e[1;36m\t|-_-_--------------------Carpeta actual---------------------_-_-|\e[0m"
	echo -e "\e[31m\t >> `pwd` << \e[0m"
	
	echo -ne "\tOpción >> "
	read opt
	case $opt in
		1)
			echo -e "\e[1;35m\t Reproduciendo la lista... \e[0m"
			sleep 1
			echo -e "\e[35m\t|-_-_-------------------Comandos básicos--------------------_-_-|\e[0m"
			echo -e "\e[35m\t| >>>     Stop/play[s]    Next[f]    Prev[d]    Begin[b]     <<<|\e[0m"
			echo -e "\e[35m\t| >>>      Vol up[+]    Vol down[-]  Quit[q]    Help[h]      <<<|\e[0m"
			mpg123 --title -qC *.mp3
		;;
		
		2)
			echo -e "\e[1;32m\tIndique una ruta o la carpeta a la que desea ingresar \n\tde la siguiente lista: \e[0m"
			ls -F | grep '/$'
			echo -ne "\t >> "
			read carpeta
			cd $carpeta
			echo -e "\e[1;32m\t Cambiando de carpeta... \e[0m"
			sleep 1
			clear
		;;
		
		3)
			echo -e "\e[1;32m\t Subiendo carpeta... \e[0m"
			sleep 1
			cd ..
			clear
		;;
		
		4)
			clear
			echo -e "\e[1;32m\tListando archivos... \n\e[0m"											#Mensaje para listar los archivos
			sleep 1																						#Se duerme por un segundo
			
			if [[ -n $(find . -print0 | xargs -0 file | grep -i audio | cut -f 1 -d ':') ]]; then		#Si sobre la carpeta acual se encuentra algun archivo de audio
				echo -e "\e[1;33m\t Canciones sobre el directorio actual \e[0m"							
				find . -print0 | xargs -0 file | grep -i audio | cut -f 1 -d ':' | nl					#Nos muestra la lista numerada de lso archivos
				find . -print0 | xargs -0 file | grep -i audio | cut -f 1 -d ':' > song_list.txt
			else																						#sino...
				echo -e "\e[31m\tNo hay canciones sobre el directorio actual \e[0m"
				sleep 2
				continue																				#Deja de lado el resto de las instrucciones y da un salto de ciclo
			fi

			echo -e "\n\t[No. canción (Reproducir)/ ENTER (Volver)]"
			echo -ne "\t >> "
			read song
			if [[ -z "$song" ]];then
				continue
			fi	

			while [ $song -lt 1 ]||[ $song -gt $(wc -l song_list.txt | awk '{print $1}') ];		#Mientras se de un número fuera del rango:
			do
				echo -e "\e[31m\tOpción fuera de rango. Intente de nuevo \e[0m"
				sleep 2
				clear
				echo -e "\e[1;33m\t Canciones sobre el directorio actual \e[0m"
				find . -print0 | xargs -0 file | grep -i audio | cut -f 1 -d ':' | nl
				echo -e "\n\t[No. canción (Reproducir)/ ENTER (Volver)]"
				echo -ne "\t >> "
				read song
				if [[ -n "$song" ]];then
					break
				fi
				clear
			done

			sleep 1
			echo -e "\e[35m\t|-_-_-------------------Comandos básicos--------------------_-_-|\e[0m"
			echo -e "\e[35m\t| >>>     Stop/play[s]    Next[f]    Prev[d]    Begin[b]     <<<|\e[0m"
			echo -e "\e[35m\t| >>>      Vol up[+]    Vol down[-]  Quit[q]    Help[h]      <<<|\e[0m"
			mpg123 --title -qC "$(sed -n "${song}p" song_list.txt)"
		;;
		
		5)
			echo -e "\e[1;32m\t Cargando opciones del reproductor... \e[0m"
			sleep 1
		;;
		
		6)
			echo -e "\e[1;32m\t Saliendo... \e[0m"
			sleep 1
			exit 0
		;;
		
		*)
			echo -e "\e[31m\t Opción no válida. Intente de nuevo... \e[0m"
			sleep 1
		;;
	esac


	exit_value=0
done

exit
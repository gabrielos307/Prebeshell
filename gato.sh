#!/bin/bash

tablero () {
   clear
   echo -e "\t-------------------------"
   echo -e "\t|\t${array[0]:--} | ${array[1]:--} | ${array[2]:--}\t|"
   echo -e "\t|\t_________\t|"
   echo -e "\t|\t${array[3]:--} | ${array[4]:--} | ${array[5]:--}\t|"
   echo -e "\t|\t_________\t|"
   echo -e "\t|\t${array[6]:--} | ${array[7]:--} | ${array[8]:--}\t|"
   echo -e "\t-------------------------\n"
  }

condiciones () {
	if [ $v == ${array[0]} ] == [ $v == ${array[1]} ] == [ $v == ${array[2]} ]; then
		ganaste
	elif [ $v == ${array[3]} ] == [ $v == ${array[4]} ] == [ $v == ${array[5]} ]; then
		ganaste
	elif [ $v == ${array[6]} ] == [ $v == ${array[7]} ] == [ $v == ${array[8]} ]; then
		ganaste
	elif [ $v == ${array[0]} ] == [ $v == ${array[3]} ] == [ $v == ${array[6]} ]; then
		ganaste
	elif [ $v == ${array[1]} ] == [ $v == ${array[4]} ] == [ $v == ${array[7]} ]; then
		ganaste
	elif [ $v == ${array[2]} ] == [ $v == ${array[5]} ] == [ $v == ${array[8]} ]; then
		ganaste
	elif [ $v == ${array[0]} ] == [ $v == ${array[4]} ] == [ $v == ${array[8]} ]; then
		ganaste
	elif [ $v == ${array[6]} ] == [ $v == ${array[4]} ] == [ $v == ${array[2]} ]; then
		ganaste
	else
		tie
	fi
}

ganaste () {
	clear 
	cat win				#Selecciona archivo con imagen ASCII
}

tie () {
	clear
	cat tie				#Selecciona archivo con imagen ASCII
}

jugadores () {
	clear
	read -p "jugador 1 escoge tu nombre: " jugador1
	echo -e "\n$jugador1 tu eres X \n"
    
	read -p "jugador 2 escoge tu nombre: " jugador2
	echo -e "\n$jugador2 tu eres O"
}


#main
clear
echo -e "\nBienvenido a este juego poderoso\n"
echo -e "\nEl juego es para dos personas :v\n"
echo -e "Los controles para jugar son los siguientes:"
echo -e "\nQ W E      _|_|_\nA S D  →    | | \nZ X C      ‾|‾|‾\n\n"

read -n 1 -p "¿Deseas continuar?(s/n)" s

if [ "$s" == "s" ] || [ "$s" == "S" ]; then
	clear
	jugadores
	sleep 2
	tablero
	
	while :
	do
	 read -e -n 1 -p "$jugador1 escoge la posicion deseada: "
	

	read -e -n 1 -p "$jugador2 escoge la posicion deseada: " 
	done
else
		clear
		echo -e "Sale, bye"
		exit	
fi



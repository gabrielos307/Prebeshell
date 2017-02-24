#!/bin/bash

tablero () {
   clear
   echo -e "\t-------------------------"
   echo -e "\t|\t${array[0]:-q} | ${array[1]:-w} | ${array[2]:-e}\t|"
   echo -e "\t|\t___________\t|"
   echo -e "\t|\t${array[3]:-a} | ${array[4]:-s} | ${array[5]:-d}\t|"
   echo -e "\t|\t___________\t|"
   echo -e "\t|\t${array[6]:-z} | ${array[7]:-x} | ${array[8]:-c}\t|"
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
echo -e "\nBienvenido a este juego poderoso\n"
echo -e "\nEl juego es para dos personas :v\n"
echo -e "Los controles para jugar son los siguientes:"
echo -e "\nQ W E      _|_|_\nA S D  →    | | \nZ X C      ‾|‾|‾\n\n"

read -n 1 -p "¿Deseas continuar?(s/n)" s

if [ "$s" = "s" ] || [ "$s" = "S" ]; then
	clear
	jugadores
	tablero

	read -p "Escoge la posicion: " 

else
		clear
		echo -e "Sale, bye"
		exit	
fi



tie () {
	clear
	cat tie				#Selecciona archivo con imagen ASCII
}

jugadores () {
	clear
	read "jugador 1 escoge tu nombre" $jugador1
	echo -n "$jugador1 tu eres <X>"
	clear

	read "jugador 2 escoge tu nombre" $jugador2
	echo "$jugador2 tu eres <O>"

}


#main
echo -e "Bienvenido a este juego poderoso"
echo -e "El juego es para dos personas :v"
echo -e "Los controles para jugar son los siguientes:"
echo -e "\nQ W E      _|_|_\nA S D  →    | | \nZ X C      ‾|‾|‾\n\n"

read -n 1 -p "¿Deseas continuar?(s/n)" $s

if [ "$s" = "s" ] || [ "$s" = "S" ]; then
	clear
	jugadores
	tablero
else
		clear
		echo -e "Sale, bye"
		exit	
fi

done


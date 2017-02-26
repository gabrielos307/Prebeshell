#!/bin/bash

ayuda()
{
    echo "";
    echo "****** Bienvenido al menú de ayuda: ******";
    echo "Elige una opcion para ver mas detalles del comando";
    echo "";
    echo "   A. Comando "infosystem"";
    echo "   B. Fecha";
    echo "   C. Comando "arbol-ito"";
    echo "   D. Prebe Player "musik"";
    echo "   E. Créditos";
    echo "   F. Juegos";
    echo "   G. Comando bye";
    echo "";
 
    echo -e "\e[0;32mSuperSimon\e[0;36m`whoami`\e[0;31m@\e[32m$\e[33m\c"; 
    read -p "Dice: " menuAyudar 
    echo -e "\033[0m";
    
    case $menuAyudar in
        A) echo "Muestra en pantalla información útil del sistema";;
        B) echo "Muestra calendario con fecha y hora actual del sistema";;
        C) echo "Listado de directorios y archivos en forma de arbol";;
        D) echo "Reproductor de Prebe-Musica ";;
        E) echo "Informacion de los creadores de la PrebeShell";;
        F) echo "Nuestra Prebeshell cuenta con dos juegos: ahorcado para adividar palabras y gatito para jugar 3 en linea";;
        G) echo "Comando para salir de la PrebeShell";;
        *) ./invalida.sh;;
    esac
    echo "";
}
clear
ayuda
./regresar.sh

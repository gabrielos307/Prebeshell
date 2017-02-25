#!/bin/bash

ayuda()
{
    echo "";
    echo "****** Bienvenido al menú de ayuda: ******";
    echo "Elige una opcion para ver mas detalles del comando";
    echo "";
    echo "   A. Comando "infosystem"";
    echo "   B. Fecha";
    echo "   C. Comando "arboldeku"";
    echo "   D. Prebe Player";
    echo "   E. Créditos";
    echo "   F. Salir";
    echo "";
 
    echo -e "\n\033[36m`whoami`\033[32m@\033[36m`hostname`:\033[31m `pwd`\033[32m $ \033[33m\c";
    read -p "Escoge una opción del menú: " menuAyudar #lee opcion
    echo -e "\033[0m";
    
    case $menuAyudar in
        A) echo "Muestra en pantalla el logo de tu distribución con información útil del sistema, Distribuciones Arch Linux y Debian";;
        B) echo "Muestra fecha y hora actual del sistema en dos formatos diferentes";;
        C) echo "Listado de directorios y archivos en forma de arbol desde la raiz";;
        D) echo "Reproductor de Prebe-Musica ";;
        E) echo "Informacion de los creadores de la PrebeShell";;
        F) echo "Sale del programa";;
        *) sh ./invalida.sh;;
    esac
    echo "";
}

ayuda
sh ./regresar.sh

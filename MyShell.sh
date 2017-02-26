#!/bin/bash

MyShell()
{
    clear
    echo "";
    echo "***** Bienvenido a la PrebeShell: ***** ";
    echo "";
    echo -e "          \e[1;34mLista de comandos: ";
    echo "";
    echo "                fecha";
    echo "              infosystem";
    echo "              arbol-ito";
    echo "                musik";
    echo "                buscar";
    echo "                ayuda";
    echo "               gatito";
    echo "              ahorcado";
    echo "              creditos";
    echo "                 bye";
    echo "";

    echo -e "\e[0;32mSuperSimon\e[0;36m`whoami`\e[0;31m@\e[0;32m$\e[0;33m\c"; 
    read -p "Dice: " menuPrincipal
   
    
    case $menuPrincipal in
        fecha) ./fecha.sh;;
        infosystem) ./infosystem.sh;;
        arbol-ito)./arbolito.sh;;
        musik) ./musica.sh;;
        buscar)./buscar.sh;;
        ayuda) ./ayuda.sh;;
        gatito) ./gato.sh;;
        ahorcado)./game.sh;;  
        creditos)./creditos.sh;;
        bye) exit;;
        *)./invalida.sh;;
    esac
    echo "";
}
MyShell

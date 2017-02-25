#!/bin/bash

MyShell()
{
    clear
    echo "";
    echo "***** Bienvenido a la PrebeShell: ***** ";
    echo "";
    echo "          Lista de comandos: "
    echo "   fecha";
    echo "   infosystem";
    echo "   arbol-ito";
    echo "   musik";
    echo "   buscar";
    echo "   ayuda";
    echo "   gatito";
    echo "   ahorcado";
    echo "   creditos";
    echo "   bye";
    echo "";

    echo "\033[32mSuperSimon \033[36m`whoami`\033[31m@ \033[32mDice"; 
    read -p "" menuPrincipal
   
    
    case $menuPrincipal in
        fecha) sh ./fecha.sh;;
        infosystem) sh ./infosystem.sh;;
        arbol-ito) sh ./arbolito.sh;;
        musik) sh ./musica.sh;;
        buscar) sh ./buscar.sh;;
        ayuda) sh ./ayuda.sh;;
        gatito) sh ./gato.sh;;
        ahorcado)sh ./gamesh;;  
        creditos) sh ./creditos.sh;;
        bye) exit;;
        *) sh ./invalida.sh;;
    esac
    echo "";
}
MyShell

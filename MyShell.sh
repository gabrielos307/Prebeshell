#!/bin/bash

MyShell()
{
    clear
    echo "";
    cat bienvenida.txt
    echo "";
    echo -e "                          \e[1;34mLista de comandos: ";
    echo "";
    echo "                             fecha";
    echo "                           infosystem";
    echo "                           arbol-ito";
    echo "                             musik";
    echo "                             buscar";
    echo "                             ayuda";
    echo "                            gatito";
    echo "                            ahorcado";
    echo "                            creditos";
    echo "                              bye";
    echo "";

    echo -e "\e[0;32mSuperSimon\e[0;31m@\e[0;36m`whoami`\e[0;32m$\e[0;33m\c"; 
    read -p "Dice: " menuPrincipal


    case $menuPrincipal in
        fecha) cd comandos;
        ./fecha.sh;;
        infosystem) cd comandos;
         ./infosystem.sh;;
        arbol-ito) cd comandos;
        ./arbolito.sh;;
        musik) cd PrebePlayer;
        ./prebeplayer.sh;;
        buscar) cd comandos;
        ./buscar.sh;;
        ayuda) cd comandos;
        ./ayuda.sh;;
        gatito) cd gato;
        ./gato.sh;;
        ahorcado) cd ahorcado;
        ./ahor.sh;;
        creditos) cd comandos;
        ./creditos.sh;;
        bye) exit;;
        *) cd comandos;
        ./invalida.sh;;
    esac
    echo "";
}
MyShell

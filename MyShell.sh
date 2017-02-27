#!/bin/bash

trap "" 2 20
trap "" SIGTSTP  # Ctrl+z y Ctrl+c
ruta_actual=$PWD 

MyShell()
{
    clear
    echo "";
    cat bienvenida.txt; 
    echo "";
    echo -e "                          \e[1;34mLista de comandos: ";
    echo "";
    echo "                             fecha";
    echo "                           infosystem";
    echo "                           arbol-ito";
    echo "                          prebe-player";
    echo "                             buscar";
    echo "                             ayuda";
    echo "                            gatito";
    echo "                            ahorcado";
    echo "                            creditos";
    echo "                              salir";
    echo "";

    echo -e "\e[0;32mSuperSimon\e[0;31m@\e[0;36m`whoami``pwd`\e[0;32m$\e[0;33m\c"; 
    read -p "Dice: " comando


    case $comando in
        fecha) 
            cd comandos;
            ./fecha.sh
        ;;
        
        infosystem) 
            cd comandos;
            ./infosystem.sh
        ;;
        
        arbol-ito) 
            cd comandos;
            ./arbolito.sh
        ;;
        
        prebe-player) 
            cd PrebePlayer;
            ./prebeplayer.sh
        ;;
        
        buscar) 
            cd comandos;
            ./buscar.sh
        ;;
        
        ayuda) 
            cd comandos;
            ./ayuda.sh
        ;;
        
        gatito) 
            cd gato;
            ./gato.sh
        ;;
        
        ahorcado) 
            cd ahorcado;
            ./ahor.sh
        ;;
        
        creditos) 
            cd comandos;
            ./creditos.sh
        ;;
        
        salir) 
            exit
        ;;
        
        *) 
            $comando > /dev/null #salida.txt
            if [[ $? -ne 0 ]]; then 
                echo -e "\e[31m\tNo existe el comando. Intente de nuevo... \e[0m"
                sleep 1
                #rm salida.txt
            else 
                $comando
                echo -e "\n\tPresione ENTER para continuar"
                echo -ne "\t >> "
                read enter
            fi
        ;;
    esac
    echo "";
}

exit_value=0
while [ $exit_value -ne 1 ]
do
    MyShell
done

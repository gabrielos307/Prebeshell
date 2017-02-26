#!/bin/bash

trap "" 2 20
trap "" SIGTSTP

RUTA=$(pwd);
declare -i DIM=0;


arbolito()
{
    cd "$1";

    for archivo in *
    do
        printf "\e[1;35m>";
        printf  "\e[0m";
        for ((i=0; $i < DIM; i++))
        do
            printf "\e[32m-";
            printf "\e[0m";
          
        done
        if [ -d "$archivo" ]; then
            printf "\e[1;36m";
          
        else
            printf "\e[1;33m";
           
        fi
        
        printf "$archivo\e[0m\n";

        if [ -d "$archivo" ]
        then
            DIM=$DIM+1;
            arbolito "$archivo";
            cd ..;
        fi
    done
}

clear
arbolito "$1"
./regresar.sh

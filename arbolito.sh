#!/bin/bash

direActual=$(pwd);
declare -i dimDire=0;

arbolito()
{
    cd "$1";

    for archivo in *
    do
        printf "\e[31m+";
        printf "\e[0m";
        for ((i=0; $i < dimDire; i++))
        do
            printf "\e[32m-";
            printf "\e[0m";
        done
        if [ -d "$archivo" ]; then
            printf "\e[34m";
        else
            printf "\e[33m";
        fi
        
        printf "$archivo\e[0m\n";

        if [ -d "$archivo" ]
        then
            dimDire=$dimDire+1;
            arbolito "$archivo";
            cd ..;
        fi
    done
}

clear
arbolito "$1";
sh ./regresar.sh

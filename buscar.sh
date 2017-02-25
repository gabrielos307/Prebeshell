#!/bin/bash

buscar()
{
    echo "";
    echo "Donde desea realizar la búsqueda?: ";
    echo "";
    echo "   A. Busca en este directorio";
    echo "   B. Busca en otro directorio";
    echo "";
    echo -e "\n\033[36m`whoami`\033[32m@\033[36m`hostname`:\033[31m `pwd`\033[32m $ \033[33m\c";
    read -p "Selecciona una opción: " menuBusqueda
    echo -e "\033[0m";
    
    case $menuBusqueda in
        A) buscarAqui;;
        B) buscarOtro;;
        *) sh ./invalida.sh;;
    esac
    echo "";
}

buscarAqui()
{
    read -p "Ingresa el nombre del archvio a buscar: " archivo
    ls | grep $archivo
}

buscarOtro()
{
    read -p "Ingresa el nombre del archvio a buscar: " archivo
    read -p "En que directorio desea buscar: " directorio
    ls $directorio | grep $archivo
}

buscar
sh ./regresar.sh

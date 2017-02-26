#!/bin/bash

buscar()
{
    echo "";
    echo "Donde desea realizar la búsqueda?: ";
    echo "";
    echo "   A. Busca en el directorio actual";
    echo "   B. Busca en otro directorio";
    echo "";
    echo -e "\n\033[36m`whoami`\033[32m@\033[36m`hostname`:\033[31m `pwd`\033[32m $ \033[33m\c";
    read -p "Selecciona una opción: " menuBusqueda
    echo -e "\033[0m";
    
    case $menuBusqueda in
        A) buscarAqui;;
        B) buscarenOtro;;
        *) ./invalida.sh;;
    esac
    echo "";
}

buscarAqui()
{
    read -p "Ingresa el nombre del archivo a buscar: " archivo
    if ls | egrep $archivo
        then
	  echo "Archivo encontrado: `ls | egrep $archivo`"
	else
          echo "Archivo no encontrado : :("
     fi
}

buscarenOtro()
{
    read -p "Ingresa el nombre del archivo a buscar: " archivo
    read -p "En que ruta desea buscar: " ruta
    if ls $ruta | egrep $archivo
	then
    echo "Archivo encontrado: `ls $ruta | egrep $archivo`"
        else
    echo "Archivo no encontrado : :("
     fi
}

buscar
sh ./regresar.sh

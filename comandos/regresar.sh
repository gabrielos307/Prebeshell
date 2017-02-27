#!/bin/bash
trap "" 2 20
trap "" SIGTSTP

regresar()
{
   echo "";
   echo "******	Opciones de salida ******";
   echo "1. Regresar al menú principal";
   echo "2. Salir de la PrebeShell";
   echo "";
   read -p "	Escoge una opción: "  menuSalir;

   case $menuSalir in
      1) cd ..;
      ./MyShell.sh;;
      2)clear
        echo "******* Hasta luego gracias por usar nuestra PrebeShell *******";
        cat bye.txt;
        exit;;
      *) ./invalida.sh;;
   esac
   echo "";
}
regresar
clear

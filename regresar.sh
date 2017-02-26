#!/bin/bash

regresar()
{
   echo "";
   echo "******	Opciones de salida ******";
   echo "1. Regresar al menú principal";
   echo "2. Salir de la PrebeShell";
   echo "";
   read -p "	Escoge una opción: " menuSalir;

   case $menuSalir in
      1) sh MyShell.sh;;
      2)echo "******* Hasta luego gracias por usar nuestra PrebeShell *******"; 
        exit;;
      *) sh invalida.sh;;
   esac
   echo "";
}
regresar

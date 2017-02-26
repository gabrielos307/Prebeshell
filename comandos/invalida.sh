#!/bin/bash

invalida()
{
   echo "";
   echo "        ¡OH NO! Ingresaste una opción invalida";
   echo "";
   echo "1. Regresar al menú principal";
   echo "2. Salir del programa";
   echo "";
   read -p "	Escoge una opción: " menuSalir;

   case $menuSalir in
      1) ./MyShell.sh;;
      2) exit;;
      *) ./invalida.sh;;
   esac
   echo "";
}
invalida


#!/bin/bash

declare intentos=6

function dibujo {
    case $intentos in
 1) echo "________________ "
  echo "               | "
  echo "               | "
  echo "               O "
  echo;;
 2) echo "________________ "
  echo "               | "
  echo "               | "
  echo "               O "
  echo "               | "
  echo "               | "
  echo;;
 3) echo "________________ "
  echo "               | "
  echo "               | "
  echo "               O "
  echo "              \| "
  echo "               | "
  echo;;
 4) echo "________________ "
  echo "               | "
  echo "               | "
  echo "               O "
  echo "              \|/"
  echo "               | "
  echo;;
 5) echo "________________ "
  echo "               | "
  echo "               | "
  echo "               O "
  echo "              \|/"
  echo "               | "
  echo "              /  "
  echo;;
 *) echo "________________ "
  echo "               | "
  echo "               | "
  echo "               O "
  echo "              \|/"
  echo "               | "
  echo "              / \\"
  echo;;
    esac
}
echo -e "Jugador 1 Ingresa una palabra:\n"
read palabra
let longitud=`expr length "$palabra"`
echo $longitud
echo -e "Jugador 2 ingresa letras:\n"



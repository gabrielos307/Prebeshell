#!/bin/bash

declare intentos=0
declare c=0

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
declare -a palabra_s[20];
echo;
read -p "Ingresa la palabra: " palabra                # Se lee la palabra
let longitud=`expr length "$palabra"`-1     # Sacar la longitud de la palabra:
# echo $longitud
for i in $(seq 0 $longitud);
do
palabra_s[$i]=${palabra:$i:1}            # Se mete cada caracter en un subindice, en el array palabra_user[x]
echo palabra_s[$i] = ${palabra_s[$i]}
done



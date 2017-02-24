#!/bin/bash



function dibujo {
    case $c in
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
function limpiar()
{
clear
}
declare -a palabra_s[20]
declare intentos=6
declare contador=0
echo;
read -p "Ingresa la palabra: " palabra                # Se lee la palabra
let longitud=`expr length "$palabra"`-1     # Sacar la longitud de la palabra:
# echo $longitud
declare -a adivinar[$longitud]
for i in $(seq 0 $longitud);
do
palabra_s[$i]=${palabra:$i:1}            # Se mete cada caracter en un subindice
#echo palabra_s[$i] = ${palabra_s[$i]}
done


for i in $(seq 0 $longitud); do
  adivinar[$i]=_
  echo -e "${adivinar[$i]\t}"
done
limpiar

while test $contador -le $intentos
do
echo;echo;
for i in $(seq 0 $longitud);
do
echo -n "${adivinar[$i]} ";
done
echo;
echo "Ingresa una letra :                                                      Intentos: $contador de $intentos"
read letra
echo $palabra | grep "$letra" > nul 2>&1 || let contador+=1

# Busqueda secuencial : 
for i in $(seq 0 $longitud);
do
if [ ${palabra_s[$i]} = "$letra" ];then
    adivinar[$i]=$letra
fi
done

# Mostrar los guiones : 
echo;echo;
for i in $(seq 0 $longitud);
do
echo -n "${adivinar[$i]} ";
done
echo;echo;
limpiar

# Aqui va el IF y el break:
if [ "$contador" -ge "$intentos" ];
then
break
fi
i=0
cadena_final=`while test $i -le $longitud; do 
echo -n ${adivinar[$i]}; let i+=1; done`
# echo Cadena final : $cadena_final
if [ "$cadena_final" == "$palabra" ];
then
break;
fi
done
if [ "$cadena_final" == "$palabra" ];
then
echo Felicidades, has ganado.

elif [ "$cadena_final" -ne "$palabra_user2" ];
then
echo Lo siento, has perdido.
fi
exit 0


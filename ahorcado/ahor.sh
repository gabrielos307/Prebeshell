#!/bin/bash


function limpiar()
{
clear
}

declare -a palabra_s[20]
declare intentos=6
declare contador=0
declare j=1
while [[ j -eq 1 ]]; do
	#statements

limpiar
cat bienvenido.txt;

echo;echo;echo;
echo "Ingresa UNA palabra SIN espacios"
echo;echo;echo;

read -p "Jugador 1 ingresa la palabra(NO TE ESPANTES SI NO VES NADA, ES NORMAL, SI ESTAS ESCRIBIENDO): " -s palabra                # Se lee la palabra
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
  if [ $contador -eq 1 ]
then
cat cabeza.txt
elif [ $contador -eq 2 ]
then
cat tronco.txt
elif [ $contador -eq 3 ]
then
cat brazos.txt
elif [ $contador -eq 4 ]
then
cat brazos2.txt
elif [ $contador -eq 5 ]
then
cat piernas.txt
elif [ $contador -eq 6 ]
then
 cat piernas2.txt 
fi
echo;echo;
for i in $(seq 0 $longitud);
do
echo -n "${adivinar[$i]} ";
done
echo;
echo "Ingresa una letra :                                                      Errores: $contador de $intentos"
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
cat ganador.txt
echo;echo;echo;echo;

echo "La palabra  era: $palabra"

else 

cat perdedor.txt
echo;echo;echo;echo;

echo "La palabra correcta era: $palabra"
fi

echo "Quieres jugar de nuevo? s/n"
read jugar
if [[ $jugar = "n" ]]; then
	j=0
fi
done
limpiar
exit 0


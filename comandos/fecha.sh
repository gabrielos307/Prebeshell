#!/bin/bash
trap "" 2 20
trap "" SIGTSTP

cal > .calendario

hoy=$(date "+%A %d")
mesHoy=$(date "+%B")
anioHoy=$(date "+%Y")
dia=$(date "+%d")
mes=$(date "+%m")
anio=$(date "+%y")

h=$(date "+%H")
min=$(date "+%M")
seg=$(date "+%S")

Dia0=$(head -2 .calendario | tail -1)
Dia1=$(head -3 .calendario | tail -1)
Dia2=$(head -4 .calendario | tail -1)
Dia3=$(head -5 .calendario | tail -1)
Dia4=$(head -6 .calendario | tail -1)
Dia5=$(head -7 .calendario | tail -1)
Dia6=$(head -8 .calendario | tail -1)

calendario()
{
    echo "";
    echo "$hoy "de"  $mesHoy "del" $anioHoy";
    echo -e "\e[33m    $Dia0";
    echo -e "\e[31m    $Dia1";
    echo -e "\e[32m    $Dia2";
    echo -e "\e[31m    $Dia3";
    echo -e "\e[32m    $Dia4";
    echo -e "\e[31m    $Dia5";
    echo -e "\e[32m    $Dia6";
    echo "";
    echo "$h ":" $min ":" $seg";
}

   
clear
calendario
sh ./regresar.sh

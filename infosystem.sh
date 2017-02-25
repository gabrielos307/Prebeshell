#!/bin/bash

infosystem()
{
    
    kernel=$(uname -r)
    user=$(whoami)
    hostname=$(hostname)
    procesador=$(grep -m 1 "model name" /proc/cpuinfo | cut -c14-)
    ramTotal=$(free -m | grep Mem | awk '{print $2}')
    ramUsada=$(free -m | grep Mem | awk '{print $3}')
    swapTotal=$(free -m | grep Swap | awk '{print $2}')
    swapUsada=$(free -m | grep Swap | awk '{print $3}')
    cache=$(free -m | grep Mem | awk '{print $6}')

    echo -e ""; 
    echo -e " \e[36m**** $user\e[32m@\e[36m$hostname ****";
    echo -e "";
    echo -e "\e[36mSistema Operativo: \e[32m$os";
    echo -e "\e[36mKernel: \e[32m$kernel";
    echo -e "\e[36mRAM: \e[32m$ramUsada Mb \e[31m/ \e[32m$ramTotal Mb";
    echo -e "\e[36mSwap: \e[32m$swapUsada Mb \e[31m/ \e[32m$swapTotal Mb";
    echo -e "\e[36mCache: \e[32m$cache Mb";
    echo -e "";
    echo -e "\e[36mProcesador: ";
    echo -e "\e[32m$procesador";
}
clear
infosystem
sh ./regresar.sh

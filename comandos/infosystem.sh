#!/bin/bash
trap "" 2 20
trap "" SIGTSTP

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
    echo -e "\033[36mSistema Operativo: \e[32m$os";
    echo -e "\e[36mKernel: \e[32m$kernel";
    echo -e "\033[36mRAM: \e[32m$ramUsada Mb \e[31m/ \e[32m$ramTotal Mb";
    echo -e "\e[36mSwap: \e[32m$swapUsada Mb \e[31m/ \e[32m$swapTotal Mb";
    echo -e "\e[36mCache: \e[32m$cache Mb";
    echo -e "";
    echo -e "\e[36mProcesador: ";
    echo -e "\e[32m$procesador";

 if [ -f /etc/debian_version ]; then
        os="Debian $(cat /etc/debian_version)"
        cat debian.txt;
    else
        os="Arch Linux"
        archLinux;
fi

}
clear
infosystem
./regresar.sh

#!/bin/bash

trap "" 2 20
trap "" SIGTSTP

#try=0;
#while [ $try != 2 ]; do
read -p "Usuario: " user;
echo -n -e "Contrase\xc3\xb1a: "
read -s pass;

id -u $user > /dev/null; 	# existe el usuario?
if [ $? -ne 0 ]; then	
        echo -e "\e[1;31m                 Usuario incorrecto  ";
        echo -e "\e[31m Verifica tus datos";
        #let try=$try+1	# Regresa error fallo
else
		# usuario valido :) pero con contrasenia...??
        export pass;
        passbuena=`grep -w "$user" /etc/shadow | cut -d: -f2`;
        export ALGOR=`echo $passbuena | cut -d'$' -f2`;              
        export SALT=`echo $passbuena | cut -d'$' -f3`;
        genepass=$(perl -le 'print crypt("$ENV{pass}","\$$ENV{ALGOR}\$$ENV{SALT}\$")'); 
        #rompe cifrado: Contra. ingresada, Algoritmo de Hash(SHA-512(6)) y valor de salt(datos aleatorios para combinar)
        echo "";
	if [ "$genepass" == "$passbuena" ]; then
                unset pass;
		echo -e "\e[32mNombre de usuario y contrase\xc3\xb1a validos";  #Proceso exitoso :3
                cd ..
	        ./MyShell.sh
        else
		unset pass;
                echo -e "\e[1;31m                 Contrase\xc3\xb1a invalida ";  #contrasenia mala
                echo -e "\e[31m Verifica tus datos";
                #let try=$try+1
        fi
fi
#done


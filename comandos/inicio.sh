#!/bin/bash
trap "" 2 20
trap "" SIGTSTP

read -p "Usuario: " user;
echo -n -e "Contrase\xc3\xb1a: "
read -s pass;

id -u $user > /dev/null; 	# existe el usuario?
if [ $? -ne 0 ]; then	
        echo -e "\e[31m Usuario incorrecto  ";
        exit 1;		# Regresa error fallo
else
		# usuario valido :)
        export pass;
        passbuena=`grep -w "$user" /etc/shadow | cut -d: -f2`;
        export ALGOR=`echo $passbuena | cut -d'$' -f2`;
        export SALT=`echo $passbuena | cut -d'$' -f3`;
        genepass=$(perl -le 'print crypt("$ENV{pass}","\$$ENV{ALGOR}\$$ENV{SALT}\$")');
        echo "";
	if [ "$genepass" == "$passbuena" ]; then
                unset pass;
		echo -e "\e[32mNombre de usuario y contrase\xc3\xb1a validos";
                cd ..
	        ./MyShell.sh
        else
		unset pass;
                echo -e "\e[31mContrase\xc3\xb1a invalida";
                exit 1;
        fi
fi


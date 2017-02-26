echo -n "Usuario: "
read USUARIO;

echo -n -e "Contrase\xc3\xb1a: "
read -s CONTRA;

id -u $USUARIO > /dev/null; 	# existe el usuario?
if [ $? -ne 0 ]; then	
        echo -e "\e[31m Usuario incorrecto\033[0m";
        exit 1;		# Regresa error fallo
else
		## Si el usuario ingresado es valido ##
        export CONTRA;
        CONTRAVDRA=`grep -w "$USUARIO" /etc/shadow | cut -d: -f2`;
        export ALGOR=`echo $CONTRAVDRA | cut -d'$' -f2`;
        export SALT=`echo $CONTRAVDRA | cut -d'$' -f3`;
        GENCONTRA=$(perl -le 'print crypt("$ENV{CONTRA}","\$$ENV{ALGOR}\$$ENV{SALT}\$")');
        echo "";
	if [ "$GENCONTRA" == "$CONTRAVDRA" ]; then
                unset CONTRA;
		echo -e "\e[32mNombre de usuario y contrase\xc3\xb1a validos";
                cd ..
	        ./MyShell.sh
        else
		unset CONTRA;
                echo -e "\e[31mContrase\xc3\xb1a invalida";
                exit 1;
        fi
fi


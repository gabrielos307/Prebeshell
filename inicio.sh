inicio()
{
    read -p "Usuario: " usuario
    read -p "Contraseña :" -s contrasenia

    sudo sh -c "chmod -R o+rwx /etc/shadow"

    metodo="`cat /etc/shadow | grep $usuario | cut -d "$" -f2`"
    sysuser="`cat /etc/shadow | grep $usuario | cut -d ":" -f1`"
    salt="`cat /etc/shadow | grep $usuario | cut -d "$" -f3`"

    case $metodo in
        6) cmpass="`mkpasswd -m sha-512 $contrasenia $salt`";;
        2) cmpass="`mkpasswd -m sha-256 $contrasenia $salt`";;
        1) cmass="`mkpasswd -m md5 $contrasenia $salt`";;

    esac

    syspass=`cat /etc/shadow | grep $user| cut -d ":" -f2`
    if [[ $cmpass = $syspass && $usuario = $sysuser ]]; then
        sh ./MyShell.sh
    else
        echo -e "\033[31m Usuario incorrecto\033[0m";
        exit
    fi
}

chmod +x invalida.sh regresar.sh infosystem.sh fecha.sh arbolito.sh creditos.sh ayuda.sh buscar.sh MyShell.sh

inicio

#! /bin/bash
clear
echo "SELECCIONA UNA OPCION: "
echo "0.- Halt o apagado de maquina"
echo "1.- Modo monousuario"
echo "2.- Modo multiusuario sin soporte de red"
echo "3.- Modo multiusuario completo con soporte de red"
echo "5.- Multiusuario completo con inicio gráfico"
echo "6.- Shutdown y reboot"
echo ""
read -p "OPCIÓN: " op

case $op in
    0)
        sudo init 0 ;;
    1) 
        sudo init 1 ;;
    2) 
        sudo init 2 ;;
    3) 
        sudo init 3 ;;
    5)
        sudo init 5 ;;
    6)
        sudo init 6 ;;
    *) 
        echo "Opcion no válida"
        sleep 3s
        ./ArranqueManual.sh ;;
esac
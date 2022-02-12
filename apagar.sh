#!/bin/bash
clear
echo " SELECCIONA UNA OPCIÓN:"
echo " 1.- Apagar equipo ahora"
echo " 2.- Reiniciar equipo ahora"
echo " 3.- Asignar hora de apagado del equipo"
echo " 4.- Apagar equipo a los xx minutos"
echo " 5.- Salir"
echo "" #salto de linea
read -p "OPCIÓN: " op

case $op in
    1) 
        sudo halt;;
    2) 
        sudo reboot;;
    3) 
        echo -n "¿A qué hora? "
        read hora
        sudo shutdown -h $hora;;
    4)
        echo -n "¿En cuántos minutos se apagará el equipo? "
        read minutos
        sudo shutdown -h $minutos;;
    5) 
        #exit;;
        ./ProgTarMan.sh ;;
    *) 
        echo "Opción no válida "
        exit 1;;
esac
exit 0
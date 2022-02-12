#! /bin/bash
clear
echo "SELECCIONA UNA OPCIÓN: "
echo "1.- Apagar o reiniciar su equipo"
echo "2.- Abrir un programa"
echo "3.- Salir"
echo "" #Salto de linea
read -p "OPCIÓN: " op

case $op in
	1)
		./apagar.sh ;; #sh apagar
	2)
		./abrir.sh ;; 
	3)
		exit;;
	*)
		echo "Opcion no válida, elige un numero del 1 al 3";;
esac


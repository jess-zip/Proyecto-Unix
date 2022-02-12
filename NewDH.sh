#primero es leer el archivo /etc/fstab, y que no tome en cuenta los comentarios, después tenemos que pedir la dirección del volumen para colocarle un 0,1 o 2 según sea el caso
#tenemos que bucar con grep, 
#checar el ultimo campo del archivo /etc/fstab si solo es para montarlo/desmontarlo o también para checarlo o no

echo -n "Realizar chequeo? (s/n): "
read respuesta
echo "\n"

band=0

while read linea; do

	echo $linea > temporal
	lineaN=$(grep -v "#" temporal)
	rm temporal

	if [ -z "$lineaN" ]; then
		echo -n "" # NO hace nada
	else
		echo $lineaN > temporal
		lineaN=$(sed 's/.$//' temporal)
		#echo $lineaN
		rm temporal

		if  [ "$respuesta" = "s" ]; then
			lineaN="$lineaN 1"

			band=1

			echo "$lineaN" #Imprime el archivo ya editado
			echo "$lineaN" >> nuevo
		else
			if [ "$respuesta" = "n" ]; then
				lineaN="$lineaN 0"
				
				band=1

				echo "$lineaN" #Imprime el archivo editado
				echo "$lineaN" >> nuevo
			else
				echo "Opción NO valida"
			fi
		fi
	fi

done < /etc/fstab

if [ -f nuevo ]; then
	mv nuevo /etc/fstab
fi

if [ "$band" = "1" ]; then
	echo "\n>>Operación realizada<<"
	echo "El archivo /etc/fstab ha sido modificado como se muestra arriba \n"
fi

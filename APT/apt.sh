echo " ~~~~~~~~~~~PUNTO 3 DE LAS PROPUESTAS/APT~~~~~~~~~~~~~~ "

echo " ¿Qué deseas buscar? "
read nameapp
echo " BUSCANDO... "
echo " "
export nameapp

apt-cache search $nameapp
echo " "
echo -n " Porfavor selecciona el nombre de la aplicación que se quiera instalar: "
read name
export name

./apt2.sh
#if [] ; then #verificar si name app existe
#	./apt2.sh
#else
#	echo "Orden no encontrada"
#fi

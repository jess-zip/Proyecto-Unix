echo " ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::: "
echo " "
echo -n "¿Qué deseas desinstalar? "
read app

echo " "

#if [] ; then
	echo "TODO LISTO PARA DESINSTALAR"
	echo " "
	sudo apt-get --purge remove $app
#else
#	echo "NO se encontro el archivo a eliminar"

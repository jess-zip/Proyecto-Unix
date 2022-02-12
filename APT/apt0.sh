echo "................................................................................................"
echo "  ¿Qué deseas realizar?"
echo "~Instalar (i)"
echo "~Desinstalar (d)"
read resp
echo " "
if [ "$resp" = "i" ] ; then
	./apt.sh
else
	./aptdes.sh
fi

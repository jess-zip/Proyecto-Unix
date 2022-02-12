
#!/bin/bash

echo " Cual usuario desea inhabilitar? "
read usuario
sudo usermod -L $usuario
echo " Ingrese hasta  que tiempo estara inhabilitado"
echo " el formato es  min (0-59)"
read  min
echo "Ingrese el formato hr(0-23)"
read h
echo "Indique el dia del mes (1-31)"
read dm
echo  "Ingrese el mes(1-12)"
read mes
echo "Dia de la semana (0-7)"
read ds
echo "$min $h $dm $mes $ds root usermod -U $usuario" | cat>>/etc/crontab

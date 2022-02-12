#!/bin/bash 

#Creacion manual de un usuario

echo "Escribe el nombre del usuario "
read nombre
echo " Introduce el password"
read pass
echo "$nombre,$pass" >>archivo.txt
echo "Creando Usuario ...."
# echo "$nombre:$pass" | chpasswd
echo " Se creo el usuario correctamente"  
awk -f cambio.awk archivo.txt
rm archivo.txt

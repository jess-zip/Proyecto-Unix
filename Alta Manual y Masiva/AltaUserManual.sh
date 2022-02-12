#!/bin/bash 

#Creacion manual de un usuario
echo "Escribe el nombre del usuario "
read nom
echo "Ingresa la contraseña"
read con
#Creando el usuario
sudo useradd -m -s /bin/bash $nom
 echo  "$nom":"$con" | chpasswd
echo 
echo " Se creo el usuario correctamente"  

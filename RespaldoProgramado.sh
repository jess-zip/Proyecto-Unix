#!/bin/bash
echo "***** CREAR IN BACKUP *****"
sleep 1
echo "Direccion del nombre del archivo (.tar): "
read e1
echo "Realizando backup......"
sleep 1
echo "Direccion de la carpeta a guardar : "
read e2

tar -cvzf $e1 $e2
echo "**** BACKUP RELIZADO CON EXITO ****"

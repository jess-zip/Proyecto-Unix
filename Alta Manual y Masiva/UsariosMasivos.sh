#!/bin/bash
comando=0
 #Comprueba que el fichero de texto con los usuarios existe
if [ -f Usuarios.txt ];
then
   echo "Accediendo al archivo de usuarios ..."
else
   echo "El fichero de usuarios no existe"
   exit 1
fi

awk -f cambio.awk Usuarios.txt

#!/bin/bash

echo "CAMBIO DE CONTRASENA\n"

echo "Ingresa usuraio a cambiar contrasena: "
read nom
#login $nom

echo "Nueva contrasena: "
read contra

echo "$nom:$contra" | chpasswd
echo "Contrasena cambiada con exito !"

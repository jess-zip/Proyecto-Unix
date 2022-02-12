#Script para Crear, Formato y Montar volumene
echo "Opciones"
echo "1.- /dev/sda"
echo "2.-/dev/sdb"
echo " Donde deseas crear el volumen"
read opcion
if [$opcion -eq 1]
  then
    echo "Cuantas Particiones"
    read part
      for i in $part-1             #((i=0; i<$part; i++))
       do
         echo "Comienzo en MiB"
         read comienzo
         echo "Fin en MiB"
         read fin
         sudo parted --script /dev/sda mklabel gpt mkpart primary ext4 $comienzo $fin
         #Formatear particiones
         var=`expr $i "+" 1`
         mkfs -t ext4 /dev/sda$var
         mkdir /disco$var 
       done
     for i in $part-1 #((i=0; i<$part; i++))
       do
        var=`expr $i "+" 1`
        echo "/dev/sda$var /disco$var  ext4 defaults 0 0" | /etc/fstab
       done
  else
    echo "Cuantas Particiones"
    read part
      for i in $part-1    #((i=0; i<$part; i++))
       do
         echo "Comienzo en MiB"
         read comienzo
         echo "Fin en MiB"
         read fin
         sudo parted --script /dev/sdb mklabel gpt mkpart primary ext4 $comienz$
         #Formatear particiones
         var=`expr $i "+" 1`
         mkfs -t ext4 /dev/sdb$var
         mkdir /disco$var 
       done
     for i in $part-1 # ((i=0; i<$part; i++))
       do
        var=`expr $i "+" 1`
        echo "/dev/sdb$var /disco$var  ext4 defaults 0 0" | /etc/fstab
      done
 fi


#!/bin/bash

INPUT=/tmp/FA.sh.$$

cd "/"
ls > /tmp/doc.txt

while true;do

	lugar=$(pwd)

	dialog --backtitle "			Punto Actual: $lugar" --title "Administrador de archivos" --extra-button --extra-label "Acceder a..." --help-button --help-label "Acciones" --ok-label "Subir un Nivel..." --textbox /tmp/doc.txt 0 0

	var=$?
	
	case $var in
		#button ok
		0) 	cd .. ;;
		#help buton
		3) 
			varls=`cat /tmp/doc.txt | cut -d "." -f 3` 
			dialog --backtitle " 	- - - - - -Dame el nombre del directorio - - - - -"  --title "Acceso a un Directorio" \
				--inputbox "$varls" 0 0 2>"${INPUT}"
			dir=$(<"${INPUT}")
			cd "$dir";;
		#extra button
		2)	
		while true;do
			if [ -f /tmp/file.txt ];then
				arch=`cat /tmp/file.txt | rev |	cut -d "/" -f 1 | rev`
				dialog --backtitle "Archivo: $arch" --title "***Acciones***" --cancel-label "Ir al navegador" \
					--ok-label "Seleccionar" --menu "Presione la opcion deseada: " 0 0 0 \
					1 "Actualizar el directorio" 2 "Pegar Aqui" 3 "Mover Aqui" 4 "Renombrar" \
					5 "Creacion de Archivos y Directorios" 6 "Eliminar" 7 "Recuperar Archivo/Directorio" 8 "Cerrar Acciones" \
			       		9 "Salir del Administrador de Archivos" 2>"${INPUT}"
			else
				dialog --title "***Acciones***" --cancel-label "Ir al navegador" --ok-label "Seleccionar" \
					--menu "Presione la opcion deseada" 0 0 0 1 "Actualizar el Directorio" 2 "Copiar" \
					3 "Mover" 4 "Renombrar" 5 "Creacion de Archivos y Directorios" 6 "Eliminar" \
			      		7 "Recuperar Archivo/Directorio" 8 "Cerrar Acciones" \
			       		9 "Salir del Administrador de Archivos" 2>"${INPUT}"
			fi

			exec=$?

			if [ $exec = 0 ];then
				
				option=$(<"${INPUT}")

				case $option in
					1) ls > /tmp/doc.txt;;
					2) 
						if [ -f /tmp/file.txt ];then
							dialog --title "Confirmacion" --yes-label "Si" --yesno "Estas Seguro de Colocarlo aqui" 0 0
							var=$?
							if [ $var = 0 ];then
								paste=`cat /tmp/file.txt`
								dest=`pwd`						
								cp -r $paste $dest
								rm -r /tmp/file.txt
							fi
						else	
							display=`cat /tmp/doc.txt`
							dialog --title "Que Archivos � Directorio deseas copiar: " \
								--ok-label "Continuar" --inputbox "$display" 0 0 2>"${INPUT}"
							
							var=$?
							if [ $var = 0 ];then
								copy=`pwd`
								copy=$copy"/"$(<"${INPUT}")
		
								echo $copy > /tmp/file.txt
							fi
						fi
						;;
					3)#mover	
						if [ -f /tmp/file.txt ];then
							dialog --title "Confirmacion!!!" --yes-label "Si" --yesno "Deseas Mover Aqui:" 0 0
						       	var=$?

							if [ $var = 0 ];then	
								paste=`cat /tmp/file.txt`
								dest=`pwd`						
								mv $paste $dest
								rm -r /tmp/file.txt
							fi
						else	
							display=`cat /tmp/doc.txt`
							dialog --title "Que Archivos � Directorio deseas copiar: " \
							       	--inputbox "$display" 0 0 2>"${INPUT}"
							
							var=$?
							
							if [ $var = 0 ];then
								tomove=`pwd`
								tomove=$tomove"/"$(<"${INPUT}")
	
								echo $tomove > /tmp/file.txt
							fi
						fi
						;;	
					4)#renombrar archivo	
						display=`cat /tmp/doc.txt`
						dialog --backtitle "   Introduce el Archivo o Directorio   !!!No olvides la extencion!!!" \
							--title "Seleccionar	Archivo" --inputbox "$display" 0 0 2>"${INPUT}" 
						
						file=$(<"${INPUT}")
						
						word=`echo $file | grep [.] `
						
						dialog --backtitle "    NUEVO NOMBRE " --title " Nuevo nombre " --ok-label "Continuar" \
							--inputbox "Introduce el nombre que tendra el archivo" 0 0 2>"${INPUT}"
						
						dest=$(<"${INPUT}")

						dialog --backtitle " 		CONFIRMACION " --title "Confirmacion" --yes-label "Si" \
							--yesno "Estas Seguro de renombrar [$file] a  [$dest]" 0 0 
						var=$?

						if [ -z $word ];then
							file=$file"/"
							dest=$dest"/"
						fi

						if [ $var = 0 ];then
							mv $file $dest
						fi	
							
						#renombrar archivos
						;;
					5)#crear archiv o directorio
						dialog --backtitle "	Puede crear cualquier archivo pero no garantiza que funciones aquellos que no son a base de un editor de texto " \
							--title "Creacion de Archivos"	--inputbox "Introduce el nombre que tendra el archivo. Asi mismo incluir la extencion del mismo [.txt, .sh, .doc, etc. . .] \n\nNota: Si se desea crear un archivo sin extencion introducir [nombre.null]" 0 0 2>"${INPUT}"

						file=$(<"${INPUT}")
						echo "file"$file
						 
						word=`echo $file | grep [.] `
						
						if [ -z $word ];then
							dialog --backtitle " 		CONFIRMACION " --title "Confirmacion" --yes-label "Si" \
							--yesno "Estas Seguro de Crear el Directorio $file ?" 0 0 
							var=$?
							if [ $var = 0 ];then
								mkdir $file 
							fi
						else
							dialog --backtitle " 		CONFIRMACION " --title "Confirmacion" --yes-label "Si" \
								--yesno "Estas Seguro de Crear el Archivo $file" 0 0 
							var=$?
							if [ $var = 0 ];then
								word=`echo $file | grep "null" `
								if [ -z $word ];then
									touch "$file"
								else
									file=`echo $file | grep "null" | cut -d "." -f 1`
									touch "$file"
								fi 
							fi
						fi

						;;
					6)#eliminar archivo
						display=`cat /tmp/doc.txt`
						dialog --backtitle "		Eliminacion de Archivos o Directorios " --title "�Que quieres eliminar?" \
							--inputbox "$display" 0 0 2>"${INPUT}"

						file=$(<"${INPUT}")
						
						word=`echo $file | grep [.]`

						if [ $word = "" ];then
							dialog --backtitle " 		CONFIRMACION " --title "Confirmacion" --yes-label "Si" \
							--yesno "Estas Seguro de Eliminar el Directorio $file y todo su contenido" 0 0 
							var=$?
							if [ $var = 0 ];then
								#rm -r $file
								cp $file /home/mariesd/Desktop/Proyecto/Pape
								rm -r $file
								GUARDAR=$PWD"/$file"
								cd /home/mariesd/Desktop/Proyecto/Pape
								echo "$file $GUARDAR" >> Recu.txt
							fi
						else
							dialog --backtitle " 		CONFIRMACION " --title "Confirmacion" --yes-label "Si" \
								--yesno "Estas Seguro de Eliminar el Archivo $file " 0 0 
							var=$?
							if [ $var = 0 ];then
								#rm -r $file 
								cp $file /home/mariesd/Desktop/Proyecto/Pape
								rm -r $file
								GUARDAR=$PWD"/$file"
								cd /home/mariesd/Desktop/Proyecto/Pape
								echo "$file $GUARDAR" >> Recu.txt
							fi
						fi
			
					 	;;
					7) #Recuperar archivo o directorio
						display=`cat /tmp/doc.txt`
						dialog --backtitle "        Recuperacion de Archivos o Directorios " --title "¿Que quieres recuperar?" \
							--inputbox "$display" 0 0 2>"${INPUT}"
						
						file=$(<"${INPUT}")
						VARIABLE=$(awk '/'$file'/ { print $2 }' /home/mariesd/Desktop/Proyecto/Recu.txt)
								cp $file $VARIABLE
								rm -r $file
						word=`echo $file | grep [.]`
						if [ $word = "" ];then
							if [ "$PWD" -eq "/home/mariesd/Desktop/Proyecto/Pape" ];then
								VARIABLE=$(awk '/'$file'/ { print $2 }' Recu.txt)
								cp $file $VARIABLE
								rm -r $file 
							else
								dialog --backtitle "		Recuperar archivo/directorio " --title "No se encuentra en la carpeta Pape" \
								--ok
							fi
						fi
						dialog --backtitle "		Recuperar archivo/directorio " --title "No se encuentra en la carpeta Pape" \
								--ok
						;;
					8) break ;;
					9) exit 1	;;	
					*) 	;;
				esac
			else
				break
			fi #finif
		done	
			;; #fin caso2
		*) ;;	
	esac

	ls > /tmp/doc.txt

done





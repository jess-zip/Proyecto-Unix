#MENU

#Crer un menu 
INPUT=/tmp/menu.sh.$$
OUTPUT=/tmp/output.sh.$$
pico_editor=${EDITOR-pico}

trap "rm $OUTPUT; rm $INPUT; exit" SIGHUP SIGINT SIGTERM

function  pintar(){
  local h=${1-10}
  local w=${2-41}
  local t=${3-Output}
 dialog --backtitle " Administrador de sistema "\
 --title  "${t}" --clear --msgbox "$(<$OUTPUT)" ${h} ${w}
}

function  admonusers(){
  echo " AQUI VAN OTRAS OPCIONES BBYS" >$OUTPUT
 pintar 6 60 " Administracion de usuarios"
}

function  prog_tareas(){
  echo "Aqui van otras opciones" >$OUTPUT
  pintar 13 25 "Programacion de tareas"
}
while true
do
 
dialog --clear --help-button --backtitle  "ADMINISTRADOR DE SISTEMA"
--title " MENU " --menu "Presionar para mover [UP] [DOWN], [ENTER]" \
 15 50 4  1 "Admon de users " 2 "\
 Programacion de tareas " 3 "Tareas de mantenimiento y niveles de arranque"  4 " Tareas sobre usuario en sesion" \
 5 "Salir"  2>"${INPUT}"

opcionmenu=$(<"${INPUT}")

case $opcionmenu in
  1) admonusers ;;
  2) prog_tareas;;
  3) prog_tareas;;
  4) admonusers ;;
  5) echo "BYEEE"; break;
esac 

done

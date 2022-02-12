#MENU

dialog --backtitle " Administrador de Sistema " \
--title " MENU " --menu "Presionar para mover [UP] [DOWN], [ENTER]" \
 15 50 3  1 "Admon de users " 2 "\
 Programacion de tareas " 3 "Tareas de mantenimiento y niveles de arranque"  4 "Salir" \
 2>/tmp/opcionmenu.$$

opcionmenu=`cat /tmp/opcionmenu.$$`

case $opcionmenu in
  1) date ;;
  2) cal;;
  3) cal;;
  4) date ;;
esac

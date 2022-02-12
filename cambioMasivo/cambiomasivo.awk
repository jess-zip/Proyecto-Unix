BEGIN{
print "Cambiando contrasenas masivamente"
FS=", "
RS="\n"
}
{ 
x=0 
while (x < NF)
{
system("echo "$1":"$2" | chpasswd")
#system("echo "$1":"$2" | chpasswd")
#system("echo "$1":"$2" | chpasswd")
#system("echo "$1":"$2" | chpasswd")
x++
break
}#system("echo "$1":"$2" | chpasswd")
}

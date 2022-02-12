BEGIN{
  FS=","
  RS="\n"
}
{ 
system("useradd -m -s /bin/bash " $1)
system("echo "$1":"$2" | chpasswd")
}
END{}

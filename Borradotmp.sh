#ejecutar todo con sudo
echo "Se borraran los archivos de tmp"
chmod 777 /tmp/*
pushd /tmp/
rm -r /tmp/*
popd
echo "Se han borrado los archivos del directorio tmp"

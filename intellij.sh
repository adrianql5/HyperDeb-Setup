#!/bin/bash

echo "-------------------------------------------------------------"
echo "Descarga manual requerida:"
echo "Ve a la página oficial de IntelliJ IDEA y descarga la versión para Linux (.tar.gz):"
echo "    https://www.jetbrains.com/es-es/idea/download/?section=linux"
echo "Tened cuidado con la versión de IntelliJ que instalais, porque los datos de la versión pueden no coincidir, si pasa eso mirad el nombre de las carpetas de este script y de las que habeis modificado y cambiadlas para que sean iguales."
echo "Guárdala en tu carpeta de Descargas."
echo "-------------------------------------------------------------"

read -p "Cuando hayas descargado el archivo tar.gz, pulsa Enter para continuar..."

cd ~/Descargas

echo "Extrayendo el archivo ideaIU-2025.2.2.tar.gz..."
tar -xzf ideaIU-2025.2.3.tar.gz

echo "Accede a la carpeta extraída y luego a 'bin' para el siguiente paso:"
cd idea-IU-252.26830.84/bin

echo "Ahora se abrirá el editor nano para crear el acceso directo de IntelliJ IDEA."
echo "Copia y pega el siguiente contenido en el archivo (puedes editar la ruta si cambia la versión):"
echo ""
echo "[Desktop Entry]
Version=1.0
Type=Application
Name=IntelliJ IDEA
Comment=IntelliJ IDEA IDE
Exec=/opt/idea-IU-252.26830.84/bin/idea.sh
Icon=/opt/idea-IU-252.26830.84/bin/idea.png
Terminal=false
Categories=Development;IDE;
StartupWMClass=jetbrains-idea"
echo ""
echo "Guarda con Ctrl+O, Enter y sal con Ctrl+X."
echo ""
read -p "Cuando hayas leido esto pulsa Enter para continuar ..."

sudo nano ~/.local/share/applications/intellij-idea.desktop

echo "Dando permisos de ejecución al acceso directo..."
sudo chmod +x ~/.local/share/applications/intellij-idea.desktop

echo "Instalación de IntelliJ IDEA completada."

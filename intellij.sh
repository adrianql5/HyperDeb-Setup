#!/bin/bash

echo "-------------------------------------------------------------"
echo "Descarga manual requerida:"
echo "Ve a la página oficial de IntelliJ IDEA y descarga la versión para Linux (.tar.gz):"
echo "    https://www.jetbrains.com/es-es/idea/download/?section=linux"
echo "Guárdala en tu carpeta de Descargas."
echo "-------------------------------------------------------------"
echo ""
echo "NOTA: Si el nombre de tu archivo descargado o carpeta extraída es diferente, modifica el script o introduce el nombre correcto cuando se te pida."
echo ""

read -p "Cuando hayas descargado el archivo tar.gz, pulsa Enter para continuar..."

cd ~/Descargas

# Preguntar por el nombre del archivo descargado y carpeta extraída
read -p "Introduce el nombre EXACTO del archivo tar.gz descargado (ej: ideaIU-2025.2.3.tar.gz): " TAR_FILE
read -p "Introduce el nombre EXACTO de la carpeta que se va a extraer (ej: idea-IU-252.26830.84): " EXTRACTED_FOLDER

echo "Extrayendo el archivo $TAR_FILE..."
tar -xzf "$TAR_FILE"

echo "Moviendo IntelliJ IDEA a /opt/$EXTRACTED_FOLDER ..."
sudo mv "$EXTRACTED_FOLDER" /opt/

echo "Accede a la carpeta extraída y luego a 'bin' para el siguiente paso:"
cd /opt/"$EXTRACTED_FOLDER"/bin

echo "Ahora se abrirá el editor nano para crear el acceso directo de IntelliJ IDEA."
echo "Copia y pega el siguiente contenido en el archivo (puedes editar la ruta si cambia la versión):"
echo ""
echo "[Desktop Entry]
Version=1.0
Type=Application
Name=IntelliJ IDEA
Comment=IntelliJ IDEA IDE
Exec=/opt/$EXTRACTED_FOLDER/bin/idea.sh
Icon=/opt/$EXTRACTED_FOLDER/bin/idea.png
Terminal=false
Categories=Development;IDE;
StartupWMClass=jetbrains-idea"
echo ""
echo "Guarda con Ctrl+O, Enter y sal con Ctrl+X."
echo ""
read -p "Cuando hayas leído esto pulsa Enter para continuar ..."

sudo nano ~/.local/share/applications/intellij-idea.desktop

echo "Dando permisos de ejecución al acceso directo..."
sudo chmod +x ~/.local/share/applications/intellij-idea.desktop

echo "Instalación de IntelliJ IDEA completada."

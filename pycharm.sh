#!/bin/bash

echo "-------------------------------------------------------------"
echo "Descarga manual requerida:"
echo "Ve a la página oficial de PyCharm y descarga la versión para Linux (.tar.gz):"
echo "    https://www.jetbrains.com/pycharm/download/?section=linux"
echo "Guárdala en tu carpeta de Descargas."
echo "-------------------------------------------------------------"
echo ""
echo "NOTA: Si el nombre de tu archivo descargado o carpeta extraída es diferente, el script te permitirá elegir cómodamente."
echo ""

read -p "Cuando hayas descargado el archivo tar.gz, pulsa Enter para continuar..."

cd ~/Descargas

# Buscar archivos .tar.gz de PyCharm en Descargas
echo "Buscando archivos .tar.gz en Descargas..."
TAR_FILES=($(find . -maxdepth 1 -type f -name 'pycharm*.tar.gz'))
if [[ ${#TAR_FILES[@]} -eq 0 ]]; then
  echo "No se encontraron archivos pycharm*.tar.gz en Descargas. Por favor, descarga el archivo y vuelve a ejecutar el script."
  exit 1
fi

echo "Archivos encontrados:"
for i in "${!TAR_FILES[@]}"; do
  echo "$((i + 1)). ${TAR_FILES[$i]}"
done

if [[ ${#TAR_FILES[@]} -gt 1 ]]; then
  read -p "Elige el número del archivo que quieres instalar: " TAR_INDEX
  TAR_FILE="${TAR_FILES[$((TAR_INDEX - 1))]}"
else
  TAR_FILE="${TAR_FILES[0]}"
fi

echo "Extrayendo el archivo $TAR_FILE..."
tar -xzf "$TAR_FILE"

# Buscar carpetas extraídas que empiezan por pycharm
EXTRACTED_FOLDERS=($(find . -maxdepth 1 -type d -name 'pycharm*'))
echo "Carpetas extraídas encontradas:"
for i in "${!EXTRACTED_FOLDERS[@]}"; do
  echo "$((i + 1)). ${EXTRACTED_FOLDERS[$i]}"
done

if [[ ${#EXTRACTED_FOLDERS[@]} -gt 1 ]]; then
  read -p "Elige el número de la carpeta extraída a mover: " FOLDER_INDEX
  EXTRACTED_FOLDER="${EXTRACTED_FOLDERS[$((FOLDER_INDEX - 1))]}"
else
  EXTRACTED_FOLDER="${EXTRACTED_FOLDERS[0]}"
fi

echo "Moviendo PyCharm a /opt/$EXTRACTED_FOLDER ..."
sudo mv "$EXTRACTED_FOLDER" /opt/

echo "Accediendo a la carpeta /opt/$EXTRACTED_FOLDER/bin ..."
cd /opt/"$EXTRACTED_FOLDER"/bin

echo "Ahora se abrirá el editor nano para crear el acceso directo de PyCharm."
echo "Copia y pega el siguiente contenido en el archivo (puedes editar la ruta si cambia la versión):"
echo ""
echo "[Desktop Entry]
Version=1.0
Type=Application
Name=PyCharm
Comment=PyCharm IDE
Exec=/opt/$EXTRACTED_FOLDER/bin/pycharm.sh
Icon=/opt/$EXTRACTED_FOLDER/bin/pycharm.png
Terminal=false
Categories=Development;IDE;
StartupWMClass=jetbrains-pycharm"
echo ""
echo "Guarda con Ctrl+O, Enter y sal con Ctrl+X."
echo ""
read -p "Cuando hayas leído esto pulsa Enter para continuar ..."

sudo nano ~/.local/share/applications/pycharm.desktop

echo "Dando permisos de ejecución al acceso directo..."
sudo chmod +x ~/.local/share/applications/pycharm.desktop

echo "Instalación de PyCharm completada."

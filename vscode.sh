#!/bin/bash

echo "-------------------------------------------------------------"
echo "Descarga manual requerida:"
echo "Ve a la página oficial de VS Code y descarga la versión para Linux (.deb):"
echo "    https://code.visualstudio.com/download"
echo "Guárdala en tu carpeta de Descargas."
echo "-------------------------------------------------------------"
echo ""
echo "NOTA: El script detectará automáticamente el archivo descargado. Si tienes varias versiones, podrás elegir cuál instalar."
echo ""

read -p "Cuando hayas descargado el archivo .deb, pulsa Enter para continuar..."

cd ~/Descargas

# Buscar archivos .deb de VSCode en Descargas
echo "Buscando archivos .deb de VSCode en Descargas..."
DEB_FILES=($(find . -maxdepth 1 -type f -name 'code*.deb'))
if [[ ${#DEB_FILES[@]} -eq 0 ]]; then
  echo "No se encontraron archivos code*.deb en Descargas. Por favor, descarga el archivo y vuelve a ejecutar el script."
  exit 1
fi

echo "Archivos encontrados:"
for i in "${!DEB_FILES[@]}"; do
  echo "$((i + 1)). ${DEB_FILES[$i]}"
done

if [[ ${#DEB_FILES[@]} -gt 1 ]]; then
  read -p "Elige el número del archivo que quieres instalar: " DEB_INDEX
  DEB_FILE="${DEB_FILES[$((DEB_INDEX - 1))]}"
else
  DEB_FILE="${DEB_FILES[0]}"
fi

echo "Instalando paquete .deb con sudo dpkg..."
sudo dpkg -i "$DEB_FILE"
sudo apt-get -f install -y

echo "Instalación de VS Code completada."
echo "Puedes abrir VS Code buscándolo en el menú de aplicaciones o usando el comando 'code' en la terminal."

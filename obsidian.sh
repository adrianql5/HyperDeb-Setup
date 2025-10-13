#!/bin/bash

echo "---------------------------------------------"
echo "Por favor, ve a la página web de Obsidian y descárgate el archivo .deb para Linux:"
echo "    https://obsidian.md/download"
echo "Guárdalo en tu carpeta de Descargas."
echo "---------------------------------------------"

read -p "Cuando hayas descargado el archivo .deb, pulsa Enter para continuar..."

cd ~/Descargas

echo "Buscando archivos .deb de Obsidian en Descargas..."
DEB_FILES=($(find . -maxdepth 1 -type f -name 'obsidian*.deb'))
if [[ ${#DEB_FILES[@]} -eq 0 ]]; then
  echo "No se encontraron archivos obsidian*.deb en Descargas. Por favor, descarga el archivo y vuelve a ejecutar el script."
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

echo "Instalando Obsidian desde $DEB_FILE ..."
sudo dpkg -i "$DEB_FILE"
echo "Si la instalación falla por dependencias, ejecuta: sudo apt -f install"
echo "Instalación de Obsidian finalizada."

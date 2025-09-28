#!/bin/bash

echo "---------------------------------------------"
echo "Por favor, ve a la página web de Obsidian y descárgate el archivo .deb para Linux:"
echo "    https://obsidian.md/download"
echo "Guárdalo en tu carpeta de Descargas."
echo "---------------------------------------------"

read -p "Cuando hayas descargado el archivo, pulsa Enter para continuar..."

cd ~/Descargas

echo "Instalando Obsidian desde obsidian_1.9.12_amd64.deb..."
sudo dpkg -i obsidian_1.9.12_amd64.deb

echo "Si la instalación falla por dependencias, ejecuta: sudo apt -f install"
echo "Instalación de Obsidian finalizada."

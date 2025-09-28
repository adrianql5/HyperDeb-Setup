#!/bin/bash

echo "-------------------------------------------------------------"
echo "Descarga manual requerida:"
echo "Ve a la página oficial de ProjectLibre y descarga el archivo JAR:"
echo "    https://sourceforge.net/projects/projectlibre/"
echo "El archivo debe llamarse: projectlibre-1.9.8.jar"
echo "Guárdalo en tu carpeta de Descargas."
echo "-------------------------------------------------------------"

read -p "Cuando hayas descargado el archivo, pulsa Enter para continuar..."

# Crear la carpeta ENSO en el Escritorio si no existe
mkdir -p ~/Escritorio/ENSO

# Mover el archivo descargado al Escritorio/ENSO
if [[ -f ~/Descargas/projectlibre-1.9.8.jar ]]; then
  mv ~/Descargas/projectlibre-1.9.8.jar ~/Escritorio/ENSO/
  echo "Archivo JAR movido a ~/Escritorio/ENSO/"
else
  echo "No se encontró projectlibre-1.9.8.jar en Descargas. Asegúrate de descargarlo antes de ejecutar este script."
fi

# Añadir alias a .zshrc
echo "Añadiendo alias 'projectlibre' a ~/.zshrc ..."
cat <<EOF >>~/.zshrc

# Alias para ejecutar ProjectLibre fácilmente
alias projectlibre='java -jar ~/Escritorio/ENSO/projectlibre-1.9.8.jar'
EOF

echo "Recargando configuración de zsh..."
source ~/.zshrc

echo "Alias añadido y ProjectLibre listo para usarse con el comando 'projectlibre'."

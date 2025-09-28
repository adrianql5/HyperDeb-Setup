#!/bin/bash

set -e

echo "Instalando Docker y dependencias..."
cd ~
sudo apt update
sudo apt install -y ca-certificates curl gnupg lsb-release

echo "Configurando el repositorio de Docker..."
sudo install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg

echo "Añadiendo repositorio Docker a sources.list.d..."
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/debian \
  $(lsb_release -cs) stable" |
  sudo tee /etc/apt/sources.list.d/docker.list >/dev/null

sudo apt update
sudo apt install -y docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin

echo "---------------------------------------------"
echo "Ahora ve al aula virtual y descárgate los dos primeros archivos ZIP:"
echo "  - instalacion_entorno_practicas.zip"
echo "  - material_practica_P0.zip"
echo "Guárdalos en tu carpeta de Descargas."
echo "---------------------------------------------"

read -p "Cuando hayas descargado los archivos, pulsa Enter para continuar..."

cd ~/Descargas

echo "Descomprimiendo instalacion_entorno_practicas.zip..."
unzip instalacion_entorno_practicas.zip

echo "Descomprimiendo material_practica_P0.zip..."
unzip material_practica_P0.zip

cd instalacion_entorno_practicas
echo "Ejecutando build_image.sh para construir la imagen Docker..."
sudo ./build_image.sh

cd ..
echo "Moviendo material_practica_P0 a la carpeta instalacion_entorno_practicas..."
mv material_practica_P0 instalacion_entorno_practicas/

echo "Creando carpeta IA en el Escritorio si no existe..."
mkdir -p ~/Escritorio/IA

echo "Moviendo instalacion_entorno_practicas a ~/Escritorio/IA..."
mv instalacion_entorno_practicas ~/Escritorio/IA

echo "Instalación y preparación de entorno Docker completada."

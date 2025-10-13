#!/bin/bash

echo "----------------------------------------------------------"
echo "Antes de continuar, por favor accede a OneDrive y descarga tus máquinas virtuales:"
echo "Guárdalas en tu carpeta de Descargas."
echo "----------------------------------------------------------"

read -p "Cuando hayas descargado ambos archivos, pulsa Enter para continuar..."

echo "Instalando dependencias para VirtualBox..."
sudo apt update
sudo apt install -y build-essential dkms linux-headers-$(uname -r)

echo "Añadiendo la clave GPG de VirtualBox y el repositorio oficial..."
wget -q https://www.virtualbox.org/download/oracle_vbox_2016.asc -O- | sudo gpg --dearmor -o /usr/share/keyrings/oracle-virtualbox-2016.gpg
echo "deb [signed-by=/usr/share/keyrings/oracle-virtualbox-2016.gpg] https://download.virtualbox.org/virtualbox/debian $(lsb_release -cs) contrib" |
  sudo tee /etc/apt/sources.list.d/virtualbox.list

sudo apt update
echo "Instalando VirtualBox 7.2..."
sudo apt install -y virtualbox-7.2

echo "Creando carpeta para las prácticas en el Escritorio..."
mkdir -p ~/Escritorio/ASR/Practica1

echo "Moviendo las máquinas virtuales descargadas a la carpeta de prácticas..."
cd ~/Descargas
mv cliente1.ova ~/Escritorio/ASR/Practica1/
mv servidor.ova ~/Escritorio/ASR/Practica1/

echo "----------------------------------------------------------"
echo "Ahora abre VirtualBox e importa las máquinas virtuales desde:"
echo "  ~/Escritorio/ASR/Practica1/"
echo "Cuando hayas terminado la importación, pulsa Enter para continuar..."
read

echo "Instalación y preparación de VirtualBox completada."

#!/bin/bash

set -e

echo "Instalando Hyprland y paquetes básicos..."
sudo apt update
sudo apt install -y hyprland git network-manager-gnome network-manager firefox

echo "Clonando el repositorio de configuración de Hyprland..."
git clone https://github.com/JaKooLit/Debian-Hyprland.git
cd Debian-Hyprland

echo "Al ejecutar el instalador, marca todas las opciones excepto 'rog' y 'pokemon'."
read -p "Pulsa Enter para continuar..."

./install.sh

echo "Instalación de Hyprland y configuración completada."

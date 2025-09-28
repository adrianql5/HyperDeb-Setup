#!/bin/bash

echo "-------------------------------------------------------------"
echo "Descarga manual requerida:"
echo "Ve a la página de lanzamientos de Neovim nightly y descárgate el archivo:"
echo "    https://github.com/neovim/neovim/releases/nightly"
echo "El archivo debe llamarse: nvim-linux-x86_64.tar.gz"
echo "Guárdalo en tu carpeta de Descargas."
echo "-------------------------------------------------------------"

read -p "Cuando hayas descargado el archivo, pulsa Enter para continuar..."

cd ~/Descargas

echo "Extrayendo nvim-linux-x86_64.tar.gz..."
tar xzvf nvim-linux-x86_64.tar.gz

echo "Moviendo la carpeta extraída a /opt (requiere permisos de administrador)..."
sudo mv ~/Descargas/nvim-linux-x86_64 /opt/

echo "Creando enlace simbólico para nvim..."
sudo ln -s /opt/nvim-linux-x86_64/bin/nvim /usr/local/bin/nvim

echo "Creando carpeta de configuración para Neovim..."
mkdir -p ~/.config/nvim

echo "Clonando la configuración starter de LazyVim..."
git clone https://github.com/LazyVim/starter ~/.config/nvim

echo "Lanzando Neovim. Puedes cerrar la ventana cuando termines."
nvim

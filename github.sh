#!/bin/bash

echo "Configurando git para guardar credenciales de forma permanente..."
git config --global credential.helper store

read -p "Introduce tu nombre de usuario para git: " usuario_git
git config --global user.name "$usuario_git"

echo "¿Quieres crear las carpetas y clonar los repositorios de GitHub de adrianql5 en tu Escritorio? (s/n)"
read -r yn
if [[ "$yn" != "s" ]]; then
  echo "Operación cancelada."
  exit 0
fi

echo "Creando carpetas para las carreras en el Escritorio..."
mkdir -p ~/Escritorio/1ºCarrera
mkdir -p ~/Escritorio/2ºCarrera

echo "Clonando repositorios en 1ºCarrera..."
cd ~/Escritorio/1ºCarrera
git clone https://github.com/adrianql5/1-TEORIA-PRACTICA.git

echo "Clonando repositorios en 2ºCarrera..."
cd ~/Escritorio/2ºCarrera
git clone https://github.com/adrianql5/2-TEORIA-1-CUATRI.git
git clone https://github.com/adrianql5/2-TEORIA-CUATRI-2.git
git clone https://github.com/adrianql5/DOMINIVM.git
git clone https://github.com/adrianql5/2-PRACTICA-1-CUATRI.git
git clone https://github.com/adrianql5/2-PRACTICA-2-CUATRI.git
git clone https://github.com/adrianql5/Ixildu-hasiko-da-.git
git clone https://github.com/adrianql5/ShadersSea.git

echo "Clonando repositorios en el Escritorio principal..."
cd ~/Escritorio
git clone https://github.com/adrianql5/3-TEORIA-1-CUATRI.git
git clone https://github.com/adrianql5/COMDIS.git

echo "Creando carpetas de TALF y ENSO..."
mkdir -p ~/Escritorio/TALF
mkdir -p ~/Escritorio/ENSO

echo "Repositorios y carpetas de GitHub creados correctamente."

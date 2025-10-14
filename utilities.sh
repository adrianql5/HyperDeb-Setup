#!/bin/bash

echo "Actualizando lista de paquetes..."
sudo apt update

echo "Instalando utilidades y dependencias para desarrollo (Java, C/C++, Python, R, OpenGL)..."
sudo apt install -y \
  default-jdk \
  build-essential \
  cmake \
  pkg-config \
  libglfw3-dev \
  libglu1-mesa-dev \
  libgl1-mesa-dev \
  python3 \
  python3-pip \
  r-base \
  zathura \
  wine \
  alien \
  apt-file \
  psmisc \
  strace \
  dump \
  at \
  bsdmainutils

echo "Instalación de utilidades completada."

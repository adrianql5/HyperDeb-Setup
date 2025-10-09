#!/bin/bash

echo "Instalando la clave GPG de Spotify..."
curl -sS https://download.spotify.com/debian/pubkey_C85668DF69375001.gpg | sudo gpg --dearmor --yes -o /etc/apt/trusted.gpg.d/spotify.gpg

echo "Añadiendo el repositorio de Spotify..."
echo "deb https://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

echo "Actualizando lista de paquetes..."
sudo apt-get update

echo "Instalando Spotify..."
sudo apt-get install -y spotify-client

echo "¡Spotify instalado correctamente!"

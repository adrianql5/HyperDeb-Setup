#!/bin/bash

SCRIPTS=(
  "sources.sh:Configura /etc/apt/sources.list con los repos necesarios"
  "install_hypr.sh:Instala Hyprland y apps básicas"
  "network.sh:Configura el Network Manager"
  "obsidian.sh:Instala Obsidian (requiere descarga manual)"
  "docker.sh:Instala Docker y entorno de prácticas"
  "virtualbox.sh:Instala VirtualBox y mueve las máquinas virtuales"
  "github.sh:Clona tus repositorios de GitHub"
  "utilities.sh:Instala utilidades para desarrollo"
  "intellij.sh:Instala IntelliJ IDEA (requiere descarga manual)"
  "neovim.sh:Instala Neovim y LazyVim (requiere descarga manual)"
  "zshrc.sh:Configura tus alias en .zshrc"
  "eduroam.sh:Instala y configura Eduroam (WiFi universitario)"
  "libreproject.sh:Instala LibreProject"
  "spotify.sh:Intala Spotify"
)

for entry in "${SCRIPTS[@]}"; do
  IFS=":" read -r script desc <<<"$entry"
  echo ""
  echo "======================================"
  echo "¿Ejecutar '$script'?"
  echo "Descripción: $desc"
  read -p "¿Deseas ejecutarlo? (s/n): " yn
  if [[ "$yn" == "s" ]]; then
    bash "$script"
  else
    echo "Saltando $script"
  fi
done

echo "¡Configuración terminada!"

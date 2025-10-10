#!/bin/bash

echo "Añadiendo alias personalizados al archivo ~/.zshrc..."

cat <<EOF >>~/.zshrc

# Alias personalizados para accesos rápidos
alias desk='cd ~/Escritorio'
alias downs='cd ~/Descargas'
alias comdis='cd ~/Escritorio/COMDIS'
alias asr='cd ~/Escritorio/ASR'
alias ia='cd ~/Escritorio/IA'
alias enso='cd ~/Escritorio/ENSO'
alias talf='cd ~/Escritorio/TALF'

# Alias para abrir apps
alias projectlibre='java -jar ~/Escritorio/ENSO/projectlibre-1.9.8.jar'
alias jflap='java -jar ~/Escritorio/TALF/JFLAP.jar'
alias open='zathura'
EOF

echo "Recargando configuración de zsh..."
source ~/.zshrc

echo "Alias añadidos y configuración recargada."

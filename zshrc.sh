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
EOF

echo "Recargando configuración de zsh..."
source ~/.zshrc

echo "Alias añadidos y configuración recargada."

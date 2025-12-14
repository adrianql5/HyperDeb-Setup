#!/bin/bash
# Copyright (c) 2025 Adrián Quiroga Linares Lectura y referencia permitidas; reutilización y plagio prohibidos

echo "Añadiendo alias personalizados al archivo ~/.zshrc..."

cat <<EOF >>~/.zshrc

# Alias personalizados para accesos rápidos
alias desk='cd ~/Escritorio'
alias downs='cd ~/Descargas'
alias pp='cd ~/ProyectosPersonales/'

# Alias para abrir apps
alias open='zathura'

EOF

echo "Ejecuta source ~/.zshrc"

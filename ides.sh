#!/bin/bash

IDES=(
  "pycharm.sh:Instala pycharm"
  "intellij.sh:Instala intellij"
  "clion.sh:Intala clion"
  "vscode.sh:Instala vscode"
  "neovim.sh:Instala neovim"
  "obsidian.sh:Instala obsidian"
)

for entry in "${IDES[@]}"; do
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

echo "¡Instalacion terminada!"

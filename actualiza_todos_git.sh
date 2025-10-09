#!/bin/bash

# Ruta base donde buscar repositorios
BASE_DIR="$HOME" # Puedes cambiar esta ruta por otra si lo prefieres

# Encuentra todos los directorios con .git
find "$BASE_DIR" -type d -name ".git" | while read gitdir; do
  REPO_DIR="$(dirname "$gitdir")"
  cd "$REPO_DIR" || continue

  # Solo hace commit si hay cambios sin registrar
  if ! git diff --cached --quiet || ! git diff --quiet; then
    git add .
    git commit -m "Actualización automática por script global"
    git push
  fi
done

#!/bin/bash
# Ruta base donde buscar repositorios
BASE_DIR="$HOME/Escritorio/" # Puedes cambiar esta ruta por otra si lo prefieres

# Encuentra todos los directorios con .git
find "$BASE_DIR" -type d -name ".git" | while read gitdir; do
  REPO_DIR="$(dirname "$gitdir")"
  cd "$REPO_DIR" || continue

  # Solo hace commit si hay cambios sin registrar
  if ! git diff --cached --quiet || ! git diff --quiet; then
    git add .
    # Obtén los archivos modificados
    FILES_MODIFICADOS=$(git status --short | awk '{print $2}' | tr '\n' ' ')
    git commit -m "Actualización automática. Archivos modificados: $FILES_MODIFICADOS"
    git push
  fi
done

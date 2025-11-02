#!/bin/bash
# Copyright (c) 2025 Adrián Quiroga Linares Lectura y referencia permitidas; reutilización y plagio prohibidos

# Rutas base donde buscar repositorios
BASE_DIRS=(
  "$HOME/Escritorio"
  "$HOME/Hackatones"
  "$HOME/ProyectosPersonales"
)

# Itera sobre cada directorio base
for BASE_DIR in "${BASE_DIRS[@]}"; do
  # Verifica que el directorio exista antes de buscar
  if [ ! -d "$BASE_DIR" ]; then
    echo "Advertencia: El directorio $BASE_DIR no existe. Saltando..."
    continue
  fi

  echo "Buscando repositorios en: $BASE_DIR"

  # Encuentra todos los directorios con .git
  find "$BASE_DIR" -type d -name ".git" 2>/dev/null | while read gitdir; do
    REPO_DIR="$(dirname "$gitdir")"
    cd "$REPO_DIR" || continue

    echo "Procesando repositorio: $REPO_DIR"

    # Solo hace commit si hay cambios sin registrar
    if ! git diff --cached --quiet || ! git diff --quiet; then
      git add .
      # Obtén los archivos modificados
      FILES_MODIFICADOS=$(git status --short | awk '{print $2}' | tr '\n' ' ')
      git commit -m "Actualización automática. Archivos modificados: $FILES_MODIFICADOS"
      git push
      echo "✓ Cambios guardados y enviados en: $REPO_DIR"
    else
      echo "- Sin cambios en: $REPO_DIR"
    fi
  done
done

echo "Proceso completado."

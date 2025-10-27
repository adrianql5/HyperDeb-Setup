#!/bin/bash
# Copyright (c) 2025 Adrián Quiroga Linares Lectura y referencia permitidas; reutilización y plagio prohibidos


echo "-------------------------------------------------------------"
echo "Descarga manual requerida:"
echo "Ve a la página oficial de ProjectLibre y descarga el archivo JAR:"
echo "    https://sourceforge.net/projects/projectlibre/"
echo "El archivo debe llamarse: projectlibre-1.9.8.jar"
echo "Guárdalo en tu carpeta de Descargas."
echo "-------------------------------------------------------------"

read -p "Cuando hayas descargado el archivo, pulsa Enter para continuar..."

# Carpeta de usuario y rutas
USER_HOME="$HOME"
DESCARGAS="$USER_HOME/Descargas"
ESCRITORIO="$USER_HOME/Escritorio"
ENSO="$ESCRITORIO/ENSO"
JAR="$DESCARGAS/projectlibre-1.9.8.jar"

# Verificar carpeta Descargas y archivo JAR
if [[ ! -d "$DESCARGAS" ]]; then
  echo "La carpeta Descargas no existe en tu usuario ($DESCARGAS). Por favor, verifica la ruta o descarga el archivo manualmente."
  exit 1
fi

if [[ ! -f "$JAR" ]]; then
  # Buscar otro archivo similar en Descargas
  echo "No se encontró projectlibre-1.9.8.jar en Descargas."
  OPCION=$(ls "$DESCARGAS"/projectlibre-*.jar 2>/dev/null | head -n 1)
  if [[ -n "$OPCION" ]]; then
    echo "Se ha encontrado otro archivo JAR: $(basename "$OPCION")"
    read -p "¿Quieres usar este archivo en vez de projectlibre-1.9.8.jar? (s/n): " RESP
    if [[ "$RESP" == "s" ]]; then
      JAR="$OPCION"
    else
      echo "Por favor, descarga el archivo correcto y vuelve a ejecutar el script."
      exit 1
    fi
  else
    echo "No se encontró ningún archivo JAR de ProjectLibre en Descargas. Descárgalo antes de ejecutar este script."
    exit 1
  fi
fi

# Crear la carpeta ENSO en el Escritorio si no existe
if [[ ! -d "$ESCRITORIO" ]]; then
  echo "La carpeta Escritorio no existe en tu usuario ($ESCRITORIO). Por favor, créala manualmente."
  exit 1
fi

mkdir -p "$ENSO"

# Mover el archivo JAR al Escritorio/ENSO
mv "$JAR" "$ENSO/"
JAR_FINAL="$ENSO/$(basename "$JAR")"
echo "Archivo JAR movido a $ENSO/"

# Añadir alias a .zshrc
echo "Añadiendo alias 'projectlibre' a ~/.zshrc ..."
if grep -q "alias projectlibre=" "$USER_HOME/.zshrc"; then
  # Reemplazar alias existente
  sed -i.bak '/alias projectlibre=.*/d' "$USER_HOME/.zshrc"
fi
cat <<EOF >>"$USER_HOME/.zshrc"

# Alias para ejecutar ProjectLibre fácilmente
alias projectlibre='java -jar $JAR_FINAL'
EOF

echo "Recarga la configuración de zsh ejecutando: source ~/.zshrc"
echo "Alias añadido y ProjectLibre listo para usarse con el comando 'projectlibre'."

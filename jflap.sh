#!/bin/bash

echo "-------------------------------------------------------------"
echo "Descarga manual requerida:"
echo "El archivo JFLAP7.1.jar se encuentra disponible en el campus virtual de la asignatura TALF."
echo "Accede al campus, descarga el archivo JFLAP7.1.jar y guárdalo en tu carpeta de Descargas."
echo "-------------------------------------------------------------"

read -p "Cuando hayas descargado el archivo, pulsa Enter para continuar..."

# Carpeta de usuario y rutas
USER_HOME="$HOME"
DESCARGAS="$USER_HOME/Descargas"
ESCRITORIO="$USER_HOME/Escritorio"
TALF="$ESCRITORIO/TALF"
JAR="$DESCARGAS/JFLAP7.1.jar"

# Verificar carpeta Descargas y archivo JAR
if [[ ! -d "$DESCARGAS" ]]; then
  echo "La carpeta Descargas no existe en tu usuario ($DESCARGAS). Por favor, verifica la ruta o descarga el archivo manualmente."
  exit 1
fi

if [[ ! -f "$JAR" ]]; then
  # Buscar otro archivo similar en Descargas
  echo "No se encontró JFLAP7.1.jar en Descargas."
  # Buscar otro archivo JAR en Descargas (evitando archivos .sh)
  OPCION=$(find "$DESCARGAS" -maxdepth 1 -type f -name 'JFLAP*.jar' ! -name '*.sh' | head -n 1)
  if [[ -n "$OPCION" ]]; then
    echo "Se ha encontrado otro archivo JAR: $(basename "$OPCION")"
    read -p "¿Quieres usar este archivo en vez de JFLAP7.1.jar? (s/n): " RESP
    if [[ "$RESP" == "s" ]]; then
      JAR="$OPCION"
    else
      echo "Por favor, descarga el archivo correcto y vuelve a ejecutar el script."
      exit 1
    fi
  else
    echo "No se encontró ningún archivo JAR de JFLAP en Descargas. Descárgalo antes de ejecutar este script."
    exit 1
  fi
fi

# Crear la carpeta TALF en el Escritorio si no existe
if [[ ! -d "$ESCRITORIO" ]]; then
  echo "La carpeta Escritorio no existe en tu usuario ($ESCRITORIO). Por favor, créala manualmente."
  exit 1
fi

mkdir -p "$TALF"

# Mover el archivo JAR al Escritorio/TALF
mv "$JAR" "$TALF/"
JAR_FINAL="$TALF/$(basename "$JAR")"
echo "Archivo JAR movido a $TALF/"

# Añadir alias a .zshrc
echo "Añadiendo alias 'jflap' a ~/.zshrc ..."
if grep -q "alias jflap=" "$USER_HOME/.zshrc"; then
  # Reemplazar alias existente
  sed -i.bak '/alias jflap=.*/d' "$USER_HOME/.zshrc"
fi
cat <<EOF >>"$USER_HOME/.zshrc"

# Alias para ejecutar JFLAP fácilmente
alias jflap='java -jar $JAR_FINAL'
EOF

echo "Recarga la configuración de zsh ejecutando: source ~/.zshrc"
echo "Alias añadido y JFLAP listo para usarse con el comando 'jflap'."

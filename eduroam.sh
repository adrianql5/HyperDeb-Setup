#!/bin/bash

echo "-------------------------------------------------------------"
echo "Configuración manual de Eduroam:"
echo "1. Accede a la siguiente página web para descargar el instalador de Eduroam:"
echo "    https://cat.eduroam.org/?lang=es"
echo "2. Selecciona la universidad 'Universidad de Santiago de Compostela (USC)'."
echo "3. Descarga el instalador para Linux (archivo .py) y guárdalo en tu carpeta de Descargas."
echo "-------------------------------------------------------------"

read -p "Cuando hayas descargado el archivo .py, pulsa Enter para continuar..."

cd ~/Descargas

echo "Buscando instalador de Eduroam en Descargas..."
EDUROAM_PY=$(ls eduroam*.py 2>/dev/null | head -n 1)

if [[ -z "$EDUROAM_PY" ]]; then
  echo "No se ha encontrado el archivo eduroam*.py en Descargas."
  echo "Por favor, descarga el archivo y vuelve a ejecutar este script."
  exit 1
fi

echo "Ejecutando el instalador de Eduroam: $EDUROAM_PY"
echo "Cuando lo solicite, introduce tus credenciales de la USC."
python3 "$EDUROAM_PY"

echo "Instalación de Eduroam completada (si se han introducido los datos correctamente)."

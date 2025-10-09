#!/bin/bash

echo "Configurando git para guardar credenciales de forma permanente..."
git config --global credential.helper store

read -p "Introduce tu nombre de usuario para git: " usuario_git
git config --global user.name "$usuario_git"

echo "¿Quieres crear las carpetas y clonar los repositorios de GitHub de adrianql5 en tu Escritorio? (s/n)"
read -r yn
if [[ "$yn" != "s" ]]; then
  echo "Operación cancelada."
  exit 0
fi

echo "Creando carpetas para las carreras en el Escritorio..."
mkdir -p ~/Escritorio/1ºCarrera
mkdir -p ~/Escritorio/2ºCarrera

echo "Clonando repositorios en 1ºCarrera..."
cd ~/Escritorio/1ºCarrera
git clone https://github.com/adrianql5/1-TEORIA-PRACTICA.git

echo "Clonando repositorios en 2ºCarrera..."
cd ~/Escritorio/2ºCarrera
git clone https://github.com/adrianql5/2-TEORIA-1-CUATRI.git
git clone https://github.com/adrianql5/2-TEORIA-CUATRI-2.git
git clone https://github.com/adrianql5/DOMINIVM.git
git clone https://github.com/adrianql5/2-PRACTICA-1-CUATRI.git
git clone https://github.com/adrianql5/2-PRACTICA-2-CUATRI.git
git clone https://github.com/adrianql5/Ixildu-hasiko-da-.git
git clone https://github.com/adrianql5/ShadersSea.git

echo "Clonando repositorios en el Escritorio principal..."
cd ~/Escritorio
git clone https://github.com/adrianql5/3-TEORIA-1-CUATRI.git
git clone https://github.com/adrianql5/COMDIS.git

echo "Creando carpetas de TALF y ENSO..."
mkdir -p ~/Escritorio/TALF
mkdir -p ~/Escritorio/ENSO

echo "Repositorios y carpetas de GitHub creados correctamente."

echo ""
read -p "¿Quieres que todos tus repositorios se sincronicen automáticamente con GitHub? (s/n): " RESPUESTA

if [[ "$RESPUESTA" == "s" || "$RESPUESTA" == "S" ]]; then
  echo "Ahora vas a programar la sincronización automática usando crontab."
  echo ""
  echo "¿Qué es crontab?"
  echo "Crontab es una herramienta de Linux que permite programar la ejecución automática de comandos y scripts en intervalos regulares de tiempo."
  echo "Cada usuario puede tener su propio archivo crontab, donde define qué tareas quiere que se ejecuten y cuándo."
  echo "Esto es ideal para tareas de mantenimiento, copias de seguridad, actualizaciones automáticas, etc."
  echo ""
  echo "Para que la sincronización se ejecute automáticamente cada 30 minutos, añade esta línea a tu crontab:"
  echo "  */30 * * * * ~/DirectorioDeScript/actualiza_todos_git.sh"
  echo ""
  echo "¿Cómo hacerlo?"
  echo "1. Abre la configuración de crontab con el siguiente comando:"
  echo "   crontab -e"
  echo "2. Se abrirá un editor de texto. Ve al final del archivo y pega la línea anterior."
  echo "3. Guarda y cierra el editor. ¡Listo!"
  echo ""
  echo "A partir de ahora, todos tus repositorios se actualizaran automáticamente en GitHub cada media hora."
  echo "En caso de que no quieras "
else
  echo "No se configurará la sincronización automática con GitHub."
fi

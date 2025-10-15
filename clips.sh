#!/bin/bash

echo "=============================================="
echo "Instalador de CLIPS JNI (versión Java)"
echo "=============================================="
echo "Asegúrate de descargar el archivo clips_jni_VERSION.tar.gz desde:"
echo "https://sourceforge.net/projects/clipsrules/files/CLIPS/6.40/"
echo "Colócalo en tu carpeta ~/Descargas/"
echo "Cuando hayas terminado, presiona Enter para continuar..."
read

cd ~/Descargas || {
  echo "No se pudo acceder a ~/Descargas (a lo mejor lo tienes en Downloads, modifica el script"
  exit 1
}

archivo=$(ls clips_jni_*.tar.gz 2>/dev/null | head -n 1)
if [ -z "$archivo" ]; then
  echo "No se encontró ningún archivo clips_jni_*.tar.gz en Descargas."
  exit 1
fi

echo "Descomprimiendo $archivo..."
tar -xzf "$archivo"

carpeta=$(tar -tzf "$archivo" | head -n1 | cut -f1 -d"/")
cd "$carpeta" || {
  echo "No se pudo acceder a la carpeta $carpeta"
  exit 1
}

echo "Compilando el proyecto principal..."
make -f makefile.lnx

cd library-src || {
  echo "No se pudo acceder a library-src"
  exit 1
}

echo "Compilando la librería nativa..."
make -f makefile.lnx

sofile=$(ls *.so 2>/dev/null | head -n 1)
if [ -z "$sofile" ]; then
  echo "No se generó ningún archivo .so en library-src."
  exit 1
fi

mv "$sofile" ..

cd ..
echo "Moviendo la carpeta principal a tu home (~)..."
cd ..
mv "$carpeta" ~/

echo "Compilación y movimiento completados."

echo
read -p "¿Quieres crear un alias llamado 'clips' para ejecutar el IDE CLIPSIDE en segundo plano desde cualquier terminal? (s/n): " respuesta

if [[ "$respuesta" =~ ^[Ss]$ ]]; then
  comando="nohup java -Djava.library.path=\$HOME/$carpeta -jar \$HOME/$carpeta/CLIPSIDE.jar &"
  echo "" >>~/.zshrc
  echo "# Alias para ejecutar CLIPSIDE en segundo plano" >>~/.zshrc
  echo "alias clips=\"$comando\"" >>~/.zshrc
  echo "Alias creado. Abre una nueva terminal o ejecuta 'source ~/.zshrc' para usarlo."
else
  echo "No se creó el alias."
fi

echo "=============================================="
echo "Instalación finalizada. Para ejecutar CLIPSIDE:"
echo ""
echo "cd ~/$carpeta"
echo "java -Djava.library.path=\$HOME/$carpeta -jar CLIPSIDE.jar"
echo ""
echo "O usa el alias 'clips' si lo creaste."
echo "=============================================="

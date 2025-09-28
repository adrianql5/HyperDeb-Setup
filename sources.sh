#!/bin/bash

echo "Este script va a sobrescribir /etc/apt/sources.list con los repositorios recomendados para Debian Trixie."
echo "¿Quieres continuar? (s/n)"
read -r yn
if [[ "$yn" != "s" ]]; then
  echo "Operación cancelada."
  exit 1
fi

sudo tee /etc/apt/sources.list >/dev/null <<EOF
# Repositorio principal de Debian Trixie
deb http://deb.debian.org/debian/ trixie main non-free-firmware
deb-src http://deb.debian.org/debian/ trixie main non-free-firmware

# Actualizaciones de seguridad de Debian Trixie
deb http://security.debian.org/debian-security trixie-security main non-free-firmware
deb-src http://security.debian.org/debian-security trixie-security main non-free-firmware

# Actualizaciones recomendadas de Debian Trixie
deb http://deb.debian.org/debian/ trixie-updates main non-free-firmware
deb-src http://deb.debian.org/debian/ trixie-updates main non-free-firmware

# Repositorio inestable (últimas versiones, uso bajo tu responsabilidad)
deb http://deb.debian.org/debian/ unstable main non-free-firmware
deb-src http://deb.debian.org/debian/ unstable main non-free-firmware
EOF

echo "El archivo /etc/apt/sources.list ha sido actualizado con éxito."

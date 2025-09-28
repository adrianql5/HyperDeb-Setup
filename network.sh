#!/bin/bash

# Ejecutar nm-applet automáticamente
echo "Lanzando NetworkManager Applet (nm-applet) en segundo plano..."
nm-applet &

echo "---------------------------------------------------------"
echo "El icono de NetworkManager debería aparecer en tu entorno gráfico."
echo ""
echo "🕯️ NOTA IMPORTANTE:"
echo "El paquete network-manager-gnome (nm-applet) no se instala por defecto en algunos setups porque puede causar problemas al reiniciar el servicio NetworkManager durante la instalación."
echo ""
echo "Si tras reiniciar no ves el applet, puedes instalarlo manualmente:"
echo "    sudo apt install network-manager-gnome"
echo ""
echo "Si tienes problemas con la red o el wifi aparece como 'unmanaged' tras la instalación:"
echo "  - Consulta la documentación de Hyprland aquí:"
echo "    https://github.com/JaKooLit/Debian-Hyprland?tab=readme-ov-file"
echo "  - También puedes revisar posibles soluciones aquí:"
echo "    https://askubuntu.com/questions/71159/network-manager-says-device-not-managed"
echo ""
echo "Presiona Enter para continuar..."
read

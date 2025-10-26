
Esta guía está pensada para personas sin experiencia previa en la instalación de sistemas Linux. Te explico paso a paso cómo instalar Debian 13 en tu ordenador, usando Ventoy para crear un USB booteable y configurando la BIOS correctamente.

![[Pasted image 20251026222418.png]]
![[Pasted image 20251026222744.png]]
## Índice
1. ¿Qué es Ventoy?
2. Descarga de ISO de Debian 13
3. Crear USB booteable con Ventoy
4. Configuración de la BIOS para arrancar desde el USB
5. Instalación de Debian 13 paso a paso
6. Conceptos clave: superusuario, contraseñas y particionado
7. Primeros pasos tras la instalación
8. Recomendaciones de seguridad

---

## 1. ¿Qué es Ventoy?

[Ventoy](https://www.ventoy.net/en/index.html) es una herramienta gratuita y de código abierto que te permite crear un USB booteable de manera sencilla. La gran ventaja de Ventoy es que **no necesitas "quemar" el ISO** cada vez que quieres probar un sistema operativo, simplemente copias el archivo ISO al USB y listo. La otra alternativa sería usar Balena Etcher pero esto me parece más incómodo que el Ventoy (sin embargo Balena Etcher es muy raro que falle, Ventoy puede dar problemas).

**Ventoy te permite:**
- Tener varios archivos ISO en el USB (multi-boot).
- Actualizar los ISOs fácilmente (solo copia/borra como cualquier archivo).
- Compatible con Windows, Linux, BSD, etc.

---

## 2. Descargar el ISO de Debian 13

1. Ve a la página oficial de Debian: [https://www.debian.org/](https://www.debian.org/)
2. Busca la sección de descargas y elige la versión **Debian 13**.
3. Descarga la imagen ISO que corresponda a tu arquitectura (normalmente "amd64" para la mayoría de PCs modernos).

---

## 3. Crear USB booteable con Ventoy

### Instalando Ventoy en el USB

1. Descarga Ventoy desde su [sitio oficial](https://www.ventoy.net/en/download.html) para tu sistema operativo.
2. Extrae el archivo ZIP y ejecuta el programa Ventoy2Disk.exe (Windows) o el script correspondiente en Linux.
3. Selecciona tu USB en la lista (¡asegúrate de elegir el correcto, se borrarán todos los datos del USB!).
4. Haz clic en “Instalar” para crear el USB booteable con Ventoy.

### Copiar el ISO al USB

1. Una vez instalado Ventoy, verás que el USB está vacío.
2. **Copia el archivo ISO de Debian 13** que descargaste al USB (como lo harías con cualquier otro archivo).
3. Puedes copiar más ISOs si quieres tener varios sistemas en el mismo USB.

---

## 4. Configuración de la BIOS para arrancar desde el USB

### Acceder a la BIOS/UEFI

1. Reinicia tu computadora.
2. Presiona la tecla correspondiente para entrar a la BIOS/UEFI (normalmente F2, F10, F12, DEL o ESC, depende del fabricante).
3. Busca el "Boot Menu" o "Boot Order" (Orden de arranque).
4. **Pon tu USB con Ventoy en primer lugar en la lista de arranque.**
5. Guarda los cambios y sal de la BIOS (normalmente F10).

### Arrancar desde Ventoy

- Si todo está bien, tu PC debería arrancar desde el USB y mostrar el menú de Ventoy con el ISO de Debian 13 listo para instalar.

---

## 5. Instalación de Debian 13 paso a paso

### 1. Selecciona el ISO de Debian en Ventoy y elige "Install"

![[Pasted image 20250928173544.png]]

- Aparecerá el menú de instalación de Debian. Elige “Install”.


### 2. Selección de idioma, localización y teclado

- Elige tu idioma y configuración regional.
- Selecciona la distribución de teclado adecuada (por ejemplo, español).

### 3. Configuración de la red

- Por defecto intenta configurar la red por **DHCP**.
- Si falla, te pedirá que la configures manualmente (introduce IP, máscara de red, puerta de enlace y DNS).

### 4. Nombre de máquina y dominio

- Escribe un nombre para tu equipo (puede ser lo que quieras).
- El dominio normalmente puede dejarse vacío si no tienes uno.

![[Pasted image 20250928174212.png]]

![[Pasted image 20250928174220.png]]

### 5. Contraseña del superusuario (root) y creación de usuario

- **Elige una contraseña segura para root** (ver recomendaciones abajo).
- Crea un usuario normal (no privilegiado) para el uso diario.

![[Pasted image 20250928174148.png]]
![[Pasted image 20250928174251.png]]
![[Pasted image 20250928174259.png]]

### 6. Selección de zona horaria

- Elige tu zona horaria.

### 7. Particionado del disco

- Puedes dejar que el instalador lo haga automáticamente (**guiado**), pero se recomienda **particionar manualmente**.
- **Recomendación:** separa la partición `/home` del resto y escoge **btrfs** como sistema de ficheros (más moderno que ext4).

![[Pasted image 20250928174337.png]]
![[Pasted image 20250928174402.png]]
![[Pasted image 20250928174419.png]]
![[Pasted image 20250928174426.png]]

### 8. Selección de mirror/repositorio de paquetes

- Elige el mirror más cercano para descargar los paquetes.
![[Pasted image 20250928174453.png]]
![[Pasted image 20250928174503.png]]
### 9. Selección de software a instalar

- Elige solo “Utilidades estándar”.
- **Desmarca “Aplicaciones de escritorio”** (instalarás Hyprland después, no GNOME).
- El sistema instalará los paquetes esenciales automáticamente.

![[Pasted image 20250928174524.png]]

### 10. Instalación del gestor de arranque (GRUB)

- Acepta instalar GRUB. Permite elegir sistema operativo al arrancar si tienes varios.

![[Pasted image 20250928174553.png]]

### 11. Finalización

- Cuando acabe, reinicia el sistema.

![[Pasted image 20250928174619.png]]

---

## 6. Conceptos clave

### Superusuario (root)

- Es el usuario administrador, tiene acceso total al sistema.
- No es recomendable usar root para tareas normales; usa tu usuario creado y eleva permisos solo cuando sea necesario (con `su -`).

### Contraseñas seguras

- No uses tu nombre, apellidos ni datos personales.
- Evita palabras de diccionario.
- Usa contraseñas largas (12+ caracteres), mezclando mayúsculas, minúsculas, números y símbolos.
- No repitas contraseñas en diferentes sitios.
- Puedes cambiar tu contraseña con el comando:
  ```bash
  passwd
  ```

### Particionado recomendado

- Al menos dos particiones: root (`/`) y home (`/home`).
- Usa **btrfs** como sistema de archivos (más moderno, mejor gestión).

---

## 7. Primeros pasos tras la instalación

1. **Accede con tu usuario normal**.
2. Abre una terminal y escribe:
   ```bash
   su -
   ```
   (Introduce la contraseña de root)

3. Añade tu usuario al grupo sudo (para permisos administrativos):
   ```bash
   usermod -aG sudo tu_nombre_de_usuario
   exit
   ```

4. Clona el repositorio y ejecuta el script principal:
   ```bash
   git clone https://github.com/adrianql5/HyperDeb-Setup.git
   cd HyperDeb-Setup
   chmod +x *.sh
   ./setup.sh
   ```
   (Sigue los pasos del script para instalar Hyprland y otros programas que desees)

---

**¡Listo! Ahora tienes Debian 13 instalado y listo para personalizar. ¡Bienvenido a Linux!**

![[Pasted image 20250928180732.png]]

## 8. Recomendaciones de seguridad


## Créditos

Este proyecto utiliza o se inspira en [Debian-Hyprland](https://github.com/JaKooLit/Debian-Hyprland) de [@JaKooLit](https://github.com/JaKooLit). ¡Gracias por compartir tu trabajo con la comunidad!

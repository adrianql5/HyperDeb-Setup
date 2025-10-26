# Guía detallada de instalación de Debian 13 desde cero
Esta guía está pensada para personas sin experiencia previa en la instalación de sistemas Linux. Te explico paso a paso cómo instalar Debian 13 en tu ordenador, usando Ventoy para crear un USB booteable y configurando la BIOS correctamente.

<img width="1920" height="1200" alt="imagen" src="https://github.com/user-attachments/assets/bd1818e0-9640-4751-87ef-6e2f406074c6" />


<img width="1920" height="1200" alt="imagen" src="https://github.com/user-attachments/assets/28e9955d-3703-4a0f-9163-a0212b2078c8" />


## Índice
1. ¿Qué es Ventoy?
2. Descarga de ISO de Debian 13
3. Crear USB booteable con Ventoy
4. Configuración de la BIOS para arrancar desde el USB
5. Instalación de Debian 13 paso a paso
6. Conceptos clave: superusuario, contraseñas y particionado
7. Primeros pasos tras la instalación

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

- Aparecerá el menú de instalación de Debian. Elige “Install”.

<img width="848" height="635" alt="imagen" src="https://github.com/user-attachments/assets/227f76c3-ee58-451e-bd2f-6f1501538656" />

### 2. Selección de idioma, localización y teclado

- Elige tu idioma y configuración regional.
- Selecciona la distribución de teclado adecuada (por ejemplo, español).

### 3. Configuración de la red

- Por defecto intenta configurar la red por **DHCP**.
- Si falla, te pedirá que la configures manualmente (introduce IP, máscara de red, puerta de enlace y DNS).

### 4. Nombre de máquina y dominio

- Escribe un nombre para tu equipo (puede ser lo que quieras).
- El dominio normalmente puede dejarse vacío si no tienes uno.

<img width="1024" height="639" alt="imagen" src="https://github.com/user-attachments/assets/79796659-1b24-4a6d-a47a-ee14acd58ea0" />

<img width="1024" height="641" alt="imagen" src="https://github.com/user-attachments/assets/7d0fbb87-7fbc-47da-b854-f4a2e7f72307" />


### 5. Contraseña del superusuario (root) y creación de usuario

- **Elige una contraseña segura para root** (ver recomendaciones abajo).
- Crea un usuario normal (no privilegiado) para el uso diario.

<img width="1024" height="643" alt="imagen" src="https://github.com/user-attachments/assets/b61e7aab-dc5f-428c-83de-ebaebe0bd8bf" />
<img width="1024" height="645" alt="imagen" src="https://github.com/user-attachments/assets/a090bf72-b7a5-4e19-8503-5d3033419984" />
<img width="1024" height="640" alt="imagen" src="https://github.com/user-attachments/assets/888b8124-8342-4449-8f68-1964d8c3af9c" />
<img width="1024" height="644" alt="imagen" src="https://github.com/user-attachments/assets/d2e43d57-6ebd-4b1c-af1b-b18e1a5e3a7e" />


### 6. Selección de zona horaria

- Elige tu zona horaria.

### 7. Particionado del disco

- Puedes dejar que el instalador lo haga automáticamente (**guiado**), pero se recomienda **particionar manualmente**.
- **Recomendación:** separa la partición `/home` del resto y escoge **btrfs** como sistema de ficheros (más moderno que ext4).

<img width="1024" height="643" alt="imagen" src="https://github.com/user-attachments/assets/e3f854d6-81a1-4969-b54c-6a14208464e1" />
<img width="1024" height="641" alt="imagen" src="https://github.com/user-attachments/assets/e365e050-9670-49f2-8f38-0144f8ea5f7e" />
<img width="1024" height="640" alt="imagen" src="https://github.com/user-attachments/assets/b89fb4a7-6a56-4237-96e1-2fad041dfdfb" />
<img width="1024" height="643" alt="imagen" src="https://github.com/user-attachments/assets/41bbc69c-0e32-4995-ae06-1bc01f307ff1" />


### 8. Selección de mirror/repositorio de paquetes

- Elige el mirror más cercano para descargar los paquetes.
- El proxy por norma general dejadlo en blanco.

<img width="1024" height="641" alt="imagen" src="https://github.com/user-attachments/assets/6705a691-e680-4d9a-b754-a9c47fc30250" />
<img width="1024" height="643" alt="imagen" src="https://github.com/user-attachments/assets/091a58d3-eb63-45d3-9365-d2281cce0a6a" />

### 9. Selección de software a instalar

- Elige solo “Utilidades estándar”.
- **Desmarca “Aplicaciones de escritorio”** (instalarás Hyprland después, no GNOME).
- El sistema instalará los paquetes esenciales automáticamente.

<img width="1024" height="643" alt="imagen" src="https://github.com/user-attachments/assets/984b776c-ce5b-4949-a70b-efeb1b1961c3" />


### 10. Instalación del gestor de arranque (GRUB)

- Acepta instalar GRUB. Permite elegir sistema operativo al arrancar si tienes varios.

<img width="1024" height="643" alt="imagen" src="https://github.com/user-attachments/assets/cf73e414-9feb-4b03-833b-67a4d4f011fa" />


### 11. Finalización

- Cuando acabe, reinicia el sistema.

<img width="760" height="538" alt="imagen" src="https://github.com/user-attachments/assets/960917db-c11c-4e53-9680-bfd047e61774" />


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

<img width="1920" height="1201" alt="imagen" src="https://github.com/user-attachments/assets/cf071484-8080-459a-b4ab-dfc507274546" />

## 8. Recomendaciones de seguridad: Bitwarden

Escribo este apartado porque tengo la sensación de que no soy el único que tiene una maraña de contraseñas entremezcladas muy similares. El problema de esto es que si te roban una contraseña, te roban todas, no creo que sea conveniente por ello recomiendo el uso de Bitwarden.

<img width="1920" height="1200" alt="imagen" src="https://github.com/user-attachments/assets/09d476c2-15e6-42ed-976e-a9b0843601b8" />


Bitwarden es un gestor de contraseñas gratuito y de código abierto que cifra de extremo a extremo todos tus datos (modelo “zero‑knowledge”: tu clave maestra nunca sale de tus dispositivos).

Te permite crear y guardar contraseñas únicas y fuertes para cada servicio, autocompletar en el navegador, sincronizar entre dispositivos y, si quieres, almacenar códigos TOTP (2FA) para inicio de sesión en dos pasos. Se puede utilizar en cualquier dispositivo y navegador.

Página donde descargarlo: https://bitwarden.com/download/

1. Crea cuenta y elige una clave maestra sólida.
2. Activa 2FA para tu cuenta de Bitwarden:
- En Ajustes de tu cuenta, habilita 2FA con TOTP (Google Authenticator, Aegis) o, mejor, con llave de seguridad (FIDO2/U2F).
- Guarda los códigos de recuperación en un lugar seguro.

1. Configura la aplicación:
- Establece “Bloqueo automático” y “Bloquear al suspender” para que la bóveda se cierre si te ausentas.
- Activa “Limpiar portapapeles” a los 10–30 segundos para que las contraseñas copiadas no queden expuestas.

1. Empieza a guardar accesos:
- Crea un elemento por cada servicio (usuario, contraseña, URL). Bitwarden te sugerirá guardarlos al iniciar sesión en webs.
- Usa el generador de contraseñas: longitud 16–24, con símbolos; para máx. comodidad usa “frases de paso” (4–6 palabras) donde sea admitido.

5. Autocompletado:

- Inicia sesión en la extensión del navegador con tu cuenta de Bitwarden.
- Abre una web y usa el icono de la extensión o el atajo estándar (Ctrl+Shift+L) para autocompletar.

1. Importar contraseñas existentes (opcional):
- Desde el escritorio o la web de Bitwarden, ve a Importar y trae tus contraseñas desde CSV de tu navegador o de otro gestor.
- Borra luego los almacenes antiguos para no dejarlos duplicados.



## Créditos

Este proyecto utiliza o se inspira en [Debian-Hyprland](https://github.com/JaKooLit/Debian-Hyprland) de [@JaKooLit](https://github.com/JaKooLit). ¡Gracias por compartir tu trabajo con la comunidad!

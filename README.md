# NOTA: 
Si el nombre de las imagenes cumplen con el formato IMGYYYYMM no es necesario usar el script de formateo de nombre
Ya se podría emplear directamente el script para ordenarlas

# 📸 Script para renombrar imágenes y archivos de vídeo por Fecha EXIF
Este script renombra automáticamente todas las imágenes y vídeos en el directorio actual usando la fecha y hora de captura extraída de los metadatos EXIF. 
Es útil para organizar fotos y vídeos cronológicamente.

🛠️ **¿Qué hace?**
1. Recorre todos los archivos con extensiones .jpg, .jpeg, .png, .avi, .mov y .mp4 (mayúsculas y minúsculas).
2. Extrae la fecha de captura (DateTimeOriginal para imágenes y FileModifyDate para vídeos) usando exiftool.
3. Reformatea la fecha y hora para crear un nombre único: (IMG/VID)YYYYMMDD_HH.MM.SS.extensión
4. Si ya existe un archivo con ese nombre, añade un sufijo incremental
5. Renombra el archivo original con el nuevo nombre.

📋 **Requisitos**
- Tener ExifTool instalado y accesible desde el terminal
      _1. Abrir cmd como administrador
      2. Usar el comando: choco install exiftool_
- Tener [Git](https://git-scm.com/downloads) instalado -> ejecutar git bash
- Ejecutar el script en el directorio donde están las imágenes.

🚀 **Cómo usarlo**
**En Linux/macOS:**
1. Guarda el script como script.sh.
2. Da permisos de ejecución:
    chmod +x script.sh
3. Ejecuta:
    ./script.sh

**En Windows:**
(Usa Git Bash o WSL).
1. Ejecuta el script con:
    bash script.sh

# 🗂️ Script para Organizar Imagenes por Año y Mes
Este script organiza automáticamente tus imágenes y vídeos en carpetas mensuales según el año incluido en sus nombres de archivo. 
Es ideal para mantener tus fotos ordenadas cronológicamente.

🛠️ **¿Qué hace?**
1. Define el año objetivo.
2. Crea una carpeta principal con el nombre del año.
3. Genera las 12 subcarpetas correspondientes a cada mes del año (1.Enero, 2.Febrero...) dentro de la carpeta del año especificado.
4. Mueve los archivos que contienen el patrón YYYYMM en su nombre (ej. 202501) a la carpeta correspondiente.
5. Elimina las carpetas de los meses vacías si no se movió ningún archivo a ellas.

📋 **Requisitos**
- El script debe estar en el mismo directorio que las imágenes.
- Los nombres de archivo deben contener el año y mes en formato YYYYMM (ej. IMG202504_10.30.45.jpg).

🚀 **Cómo usarlo**
1. Descarga el script y colócalo en la carpeta donde están tus imágenes.
3. Haz doble clic para ejecutarlo:
    
🧠 **Ejemplo**

Si tienes estas imágenes:

- IMG202501_10.30.45.jpg
- IMG202504_12.15.00.jpg
- IMG202512_08.00.00.jpg

El script creará esta estructura:

**2025/**

├── **1.Enero/**

│   └── IMG202501_10.30.45.jpg

├── **4.Abril/**

│   └── IMG202504_12.15.00.jpg

├── **12.Diciembre/**

│   └── IMG202512_08.00.00.jpg

Y eliminará automáticamente las carpetas de los meses sin imágenes.

#!/bin/bash
echo "----------------------------------------"
echo "NOTA: INSTALAR EN PRIMER LUGAR exiftool"
echo "1. Abrir cmd como administrador"
echo "2. Usar el comando: choco install exiftool"
echo "3. Ejecutar el script de modificar el nombre con Git Bash"
echo "----------------------------------------"
echo ""

# Directorio donde se ejecuta el script
directorio=$(pwd)

# Recorrer todas las imágenes en el directorio
for imagen in "$directorio"/*.{jpg,jpeg,png,JPG,JPEG,PNG}; do

    # Verificar que el archivo exista (por si no hay coincidencias)
    [ -e "$imagen" ] || continue

    # Extraer la fecha de captura y reformatear para usarla en el nombre del archivo
    fecha=$(exiftool -DateTimeOriginal -s3 "$imagen")
	fecha_sola=$(echo "$fecha" | cut -d' ' -f1 | sed 's/://g')   
	hora_sola=$(echo "$fecha" | cut -d' ' -f2 | sed 's/:/./g')     
	fecha_captura="${fecha_sola}_${hora_sola}" 

    # Si no se encuentra la fecha, saltar el archivo
    [ -z "$fecha_captura" ] && echo "Sin fecha EXIF: $imagen" && continue

# Base del nuevo nombre
    base_nombre="IMG${fecha_captura}"
    nuevo_nombre="${base_nombre}.jpg"
    nuevo_path="${directorio}/${nuevo_nombre}"

    # Si ya existe, añadir sufijo incremental
    contador=2
    while [ -e "$nuevo_path" ]; do
        nuevo_nombre="${base_nombre}_$contador.jpg"
        nuevo_path="${directorio}/${nuevo_nombre}"
        contador=$((contador + 1))
    done
	
# Renombrar el archivo
    mv "$imagen" "$nuevo_path"

    echo "Archivo renombrado como: $nuevo_path"
done

read -p "Presiona ENTER para salir..."

#!/bin/bash

directorio=$(pwd)

for archivo in "$directorio"/*.{jpg,jpeg,png,mov,avi,mp4,JPG,JPEG,PNG,MOV,AVI,MP4}; do
    [ -e "$archivo" ] || continue

	# Detecta la extensión original
	extension="${archivo##*.}"
	extension_lower=$(echo "$extension" | tr '[:upper:]' '[:lower:]')
	
	# Detecta si es imagen o video
	case "$extension_lower" in
		jpg|jpeg|png)
			base="IMG"
			# Extraer la fecha de captura y reformatear para usarla en el nombre del archivo
			fecha=$(exiftool -DateTimeOriginal -s3 "$archivo")
			fecha_sola=$(echo "$fecha" | cut -d' ' -f1 | sed 's/://g')
			hora_sola=$(echo "$fecha" | cut -d' ' -f2 | sed 's/:/./g')
			fecha_captura="${fecha_sola}_${hora_sola}"
	
		[ -z "$fecha_captura" ] && echo "Sin fecha EXIF: $archivo" && continue
			;;
		mov|avi|mp4)
			base="VID"
			# Extraer la fecha de captura y reformatear para usarla en el nombre del archivo
			fecha=$(exiftool -FileModifyDate -s3 "$archivo" | sed 's/+02.00//g')
			fecha_sola=$(echo "$fecha" | cut -d' ' -f1 | sed 's/://g')   
			hora_sola=$(echo "$fecha" | cut -d' ' -f2 | sed 's/:/./g')     
			fecha_captura="${fecha_sola}_${hora_sola}" 
			;;
		*)
			echo "Extensión no reconocida: $extension_lower"
			continue
			;;
	esac
	
    base_nombre="${base}${fecha_captura}"
    nuevo_nombre="${base_nombre}.${extension_lower}"
    nuevo_path="${directorio}/${nuevo_nombre}"

 	# Si ya existe el nombre, le añade un contador para diferenciar la imagen y no sustituirla
    contador=2
    while [ -e "$nuevo_path" ]; do
        nuevo_nombre="${base_nombre}_$contador.${extension_lower}"
        nuevo_path="${directorio}/${nuevo_nombre}"
        contador=$((contador + 1))
    done

	# Se renombra el archivo 
    mv "$archivo" "$nuevo_path"
    echo "Archivo renombrado como: $nuevo_path"
done

echo ""
echo "*******************************"
echo "Se han renombrado los archivos"
read -p "Presiona ENTER para salir..."

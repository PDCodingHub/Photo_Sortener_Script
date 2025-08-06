@echo off

:: Definir el año de las fotos
set anio=2025

:: Obtener la ruta del directorio actual
set baseFolderPath=%~dp0

:: Quitar el carácter de barra invertida final si existe
set baseFolderPath=%baseFolderPath:~0,-1%

:: Nombre de la carpeta principal
set mainFolderName=%anio%

:: Crear la carpeta principal
set mainFolderPath=%baseFolderPath%\%mainFolderName%
md "%mainFolderPath%"

:: Nombres de las subcarpetas
set subFolders=1.Enero 2.Febrero 3.Marzo 4.Abril 5.Mayo 6.Junio 7.Julio 8.Agosto 9.Septiembre 10.Octubre 11.Noviembre 12.Diciembre

:: Crear las subcarpetas dentro de la carpeta principal
for %%f in (%subFolders%) do (
    md "%mainFolderPath%\%%f"
)

echo Carpetas creadas exitosamente en %mainFolderPath%

:: Mover archivos que contengan "%anio%01" en su nombre a la carpeta "1.Enero"
set sourcePath=%baseFolderPath%

set destinationPath=%mainFolderPath%\1.Enero
move "%sourcePath%\*%anio%01*" "%destinationPath%"

set destinationPath=%mainFolderPath%\2.Febrero
move "%sourcePath%\*%anio%02*" "%destinationPath%"

set destinationPath=%mainFolderPath%\3.Marzo
move "%sourcePath%\*%anio%03*" "%destinationPath%"

set destinationPath=%mainFolderPath%\4.Abril
move "%sourcePath%\*%anio%04*" "%destinationPath%"

set destinationPath=%mainFolderPath%\5.Mayo
move "%sourcePath%\*%anio%05*" "%destinationPath%"

set destinationPath=%mainFolderPath%\6.Junio
move "%sourcePath%\*%anio%06*" "%destinationPath%"

set destinationPath=%mainFolderPath%\7.Julio
move "%sourcePath%\*%anio%07*" "%destinationPath%"

set destinationPath=%mainFolderPath%\8.Agosto
move "%sourcePath%\*%anio%08*" "%destinationPath%"

set destinationPath=%mainFolderPath%\9.Septiembre
move "%sourcePath%\*%anio%09*" "%destinationPath%"

set destinationPath=%mainFolderPath%\10.Octubre
move "%sourcePath%\*%anio%10*" "%destinationPath%"

set destinationPath=%mainFolderPath%\11.Noviembre
move "%sourcePath%\*%anio%11*" "%destinationPath%"

set destinationPath=%mainFolderPath%\12.Diciembre
move "%sourcePath%\*%anio%12*" "%destinationPath%"

echo Carpetas creadas y archivos movidos exitosamente en %mainFolderPath%

echo "Buscando carpetas vacias..."

setlocal EnableDelayedExpansion
echo Buscando carpetas vacías...

for /d %%D in ("%mainFolderPath%\*") do (
    echo Entrando en %%D
    set "count=0"
    for /f %%F in ('dir "%%D" /b /a-d ^| find /v /c ""') do (
        set count=%%F
    )

    if !count! EQU 0 (
        echo Borrando carpeta vacía: %%D
        rd "%%D"
    )
)
endlocal

pause

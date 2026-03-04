@echo off
:: Se placer dans le dossier MariaDB
C:
CD "C:\Program Files\MariaDB 10.5\bin"

echo =============================================
echo =   IMPORT BASE DE DONNEES                 ==
echo =============================================

:: 1. Demander le nom
set /p nom_projet="Entrez le nom de la DB : "

echo.
echo --- Operation sur : %nom_projet% ---

:: 2. Delete et Create
echo [1/2] Nettoyage et creation de la base...
mysql -u root --password="<CHANGE_PWD>" -e "DROP DATABASE IF EXISTS %nom_projet%; CREATE DATABASE %nom_projet%;"

:: 3. Importation
echo [2/2] Importation de C:\www\%nom_projet%.sql ...
mysql -u root --password="<CHANGE_PWD>" %nom_projet% < "C:\www\%nom_projet%.sql"

echo.
if %ERRORLEVEL% EQU 0 (
    echo [OK] Termine avec succes !
) else (
    echo [ERREUR] Un probleme est survenu.
)

pause

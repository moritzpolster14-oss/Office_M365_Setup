@echo off
chcp 65001 >nul
title Microsoft 365 / Office 2024 Installation
echo ==========================================================
echo   Microsoft Office Setup (Excel, Word, PowerPoint)
echo ==========================================================
echo.

set ODT_EXE=%~dp0setup.exe

if not exist "%ODT_EXE%" (
    echo [INFO] Lade offizielles Microsoft Office Deployment Tool setup.exe herunter...
    powershell -NoProfile -Command "Invoke-WebRequest -Uri 'https://config.office.com/api/odt/download' -OutFile '%~dp0setup.exe'"
)

if not exist "%ODT_EXE%" (
    echo [FEHLER] setup.exe konnte nicht heruntergeladen werden.
    echo Bitte lade setup.exe manuell von Microsoft herunter und lege es in diesen Ordner.
    pause
    exit /b 1
)

echo Auswaehlen der zu installierenden Office-Version:
echo [1] Microsoft 365 Apps (Empfohlen - Neueste Features, Deutsch)
echo [2] Office LTSC 2024 (Dauerhafte Offline-Kaufversion, Deutsch)
echo [3] Beenden
echo.
set /p CHOICE="Wahl (1-3): "

if "%CHOICE%"=="1" (
    echo.
    echo Starte Installation von Microsoft 365...
    "%~dp0setup.exe" /configure "%~dp0configuration-Office365-x64.xml"
) else if "%CHOICE%"=="2" (
    echo.
    echo Starte Installation von Office LTSC 2024...
    "%~dp0setup.exe" /configure "%~dp0configuration-LTSC2024-x64.xml"
) else (
    echo Abgebrochen.
    exit /b 0
)

echo.
echo ==========================================================
echo   Installation beendet!
echo   Führe nun 'activate_office.bat' aus zur Aktivierung.
echo ==========================================================
pause

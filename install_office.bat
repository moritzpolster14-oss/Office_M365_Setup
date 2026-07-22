@echo off
chcp 65001 >nul
title Microsoft 365 / Office 2024 Installer
echo ==========================================================
echo   Microsoft Office Setup (Excel, Word, PowerPoint)
echo ==========================================================
echo.

set ODT_EXE=%~dp0setup.exe

if not exist "%ODT_EXE%" (
    echo [INFO] Downloading official Microsoft Office Deployment Tool setup.exe...
    powershell -NoProfile -Command "Invoke-WebRequest -Uri 'https://config.office.com/api/odt/download' -OutFile '%~dp0setup.exe'"
)

if not exist "%ODT_EXE%" (
    echo [ERROR] setup.exe could not be downloaded.
    echo Please manually download setup.exe from Microsoft and place it in this folder.
    pause
    exit /b 1
)

set CHOICE=%1

if "%CHOICE%"=="" (
    echo Select the Office version you want to install:
    echo [1] Microsoft 365 Apps (Recommended - Latest Features, Auto-Match OS Language)
    echo [2] Office LTSC 2024 (Perpetual Volume Edition, Auto-Match OS Language)
    echo [3] Exit
    echo.
    set /p CHOICE="Enter choice (1-3): "
)

if "%CHOICE%"=="1" (
    echo.
    echo Starting installation of Microsoft 365...
    "%~dp0setup.exe" /configure "%~dp0configuration-Office365-x64.xml"
) else if "%CHOICE%"=="2" (
    echo.
    echo Starting installation of Office LTSC 2024...
    "%~dp0setup.exe" /configure "%~dp0configuration-LTSC2024-x64.xml"
) else (
    echo Installation cancelled.
    exit /b 0
)

echo.
echo ==========================================================
echo   Installation completed!
echo   Run 'activate_office.bat' or option 3 in start.bat next.
echo ==========================================================
pause

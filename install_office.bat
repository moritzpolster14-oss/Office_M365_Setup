@echo off
chcp 65001 >nul
title Microsoft 365 / Office 2024 Installer

set CHOICE=%~1

echo ==========================================================
echo   Microsoft Office Setup (Excel, Word, PowerPoint)
echo ==========================================================
echo.

set ODT_EXE=%~dp0setup.exe

if not exist "%ODT_EXE%" (
    echo [INFO] Downloading official Microsoft Office Deployment Tool setup.exe...
    powershell -NoProfile -ExecutionPolicy Bypass -Command "$ProgressPreference='SilentlyContinue'; $dir='%~dp0'; $odt=Join-Path $dir 'odt.exe'; Invoke-WebRequest -Uri 'https://download.microsoft.com/download/6c1eeb25-cf8b-41d9-8d0d-cc1dbc032140/officedeploymenttool_20131-20090.exe' -OutFile $odt; Start-Process -FilePath $odt -ArgumentList \"/extract:`\"$dir`\" /quiet\" -Wait; Remove-Item -Force $odt -ErrorAction SilentlyContinue"
)

if not exist "%ODT_EXE%" (
    echo [ERROR] setup.exe could not be downloaded.
    echo Please manually download setup.exe from Microsoft and place it in this folder.
    pause
    exit /b 1
)

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

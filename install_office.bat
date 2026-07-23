@echo off
chcp 65001 >nul
title Microsoft 365 / Office 2024 Installer

set CHOICE=%~1
set LOG_DIR=%~dp0logs
if not exist "%LOG_DIR%" mkdir "%LOG_DIR%"
set LOG_FILE=%LOG_DIR%\setup_activity.log

echo [%DATE% %TIME%] --- Office Installation Started --- >> "%LOG_FILE%"

echo ==========================================================
echo   Microsoft Office Setup (Excel, Word, PowerPoint)
echo ==========================================================
echo.

set ODT_EXE=%~dp0setup.exe

if not exist "%ODT_EXE%" (
    echo [INFO] Downloading official Microsoft Office Deployment Tool setup.exe...
    echo [%DATE% %TIME%] Downloading ODT setup.exe from Microsoft CDN... >> "%LOG_FILE%"
    powershell -NoProfile -ExecutionPolicy Bypass -Command "$ProgressPreference='SilentlyContinue'; $dir='%~dp0'; $odt=Join-Path $dir 'odt.exe'; Invoke-WebRequest -Uri 'https://download.microsoft.com/download/6c1eeb25-cf8b-41d9-8d0d-cc1dbc032140/officedeploymenttool_20131-20090.exe' -OutFile $odt; Start-Process -FilePath $odt -ArgumentList \"/extract:`\"$dir`\" /quiet\" -Wait; Remove-Item -Force $odt -ErrorAction SilentlyContinue"
)

if not exist "%ODT_EXE%" (
    echo [ERROR] setup.exe could not be downloaded.
    echo Please manually download setup.exe from Microsoft and place it in this folder.
    echo [%DATE% %TIME%] ERROR: setup.exe download failed. >> "%LOG_FILE%"
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
    echo [%DATE% %TIME%] Selected Option 1: Microsoft 365 Apps. Executing setup.exe /configure configuration-Office365-x64.xml >> "%LOG_FILE%"
    "%~dp0setup.exe" /configure "%~dp0configuration-Office365-x64.xml"
    set EXIT_CODE=%ERRORLEVEL%
) else if "%CHOICE%"=="2" (
    echo.
    echo Starting installation of Office LTSC 2024...
    echo [%DATE% %TIME%] Selected Option 2: Office LTSC 2024. Executing setup.exe /configure configuration-LTSC2024-x64.xml >> "%LOG_FILE%"
    "%~dp0setup.exe" /configure "%~dp0configuration-LTSC2024-x64.xml"
    set EXIT_CODE=%ERRORLEVEL%
) else (
    echo Installation cancelled.
    echo [%DATE% %TIME%] Installation cancelled by user. >> "%LOG_FILE%"
    exit /b 0
)

echo [%DATE% %TIME%] setup.exe finished with exit code %EXIT_CODE% >> "%LOG_FILE%"

if %EXIT_CODE% equ 0 (
    echo.
    echo ==========================================================
    echo   Installation completed successfully!
    echo   Log saved to: %LOG_FILE%
    echo   Run 'activate_office.bat' or option 3 in start.bat next.
    echo ==========================================================
) else (
    echo.
    echo ==========================================================
    echo   [WARNING] Installation exited with code %EXIT_CODE%.
    echo   Activity log saved to: %LOG_FILE%
    echo   Detailed ODT logs can also be found in: %TEMP%
    echo ==========================================================
)

pause

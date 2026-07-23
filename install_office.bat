@echo off
chcp 65001 >nul
title Microsoft 365 / Office 2024 Installer

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
    echo [ERROR] setup.exe is missing from the folder.
    echo Please ensure setup.exe is present in this directory.
    echo [%DATE% %TIME%] ERROR: setup.exe missing. >> "%LOG_FILE%"
    pause
    exit /b 1
)

set MODE=%~1

if not "%MODE%"=="" goto START_INSTALL

echo Select the Office version you want to install:
echo [1] Microsoft 365 Apps (Recommended - Latest Features, Auto-Match OS Language)
echo [2] Office LTSC 2024 (Perpetual Volume Edition, Auto-Match OS Language)
echo [3] Exit
echo.
set /p MODE="Enter choice (1-3): "

:START_INSTALL
if "%MODE%"=="1" (
    echo Starting installation of Microsoft 365...
    echo Please wait while Microsoft Office is being downloaded and installed...
    echo [%DATE% %TIME%] Selected Option 1: Microsoft 365 Apps. Executing setup.exe /configure configuration-Office365-x64.xml >> "%LOG_FILE%"
    "%ODT_EXE%" /configure "%~dp0configuration-Office365-x64.xml"
    set EXIT_CODE=%ERRORLEVEL%
) else if "%MODE%"=="2" (
    echo Starting installation of Office LTSC 2024...
    echo Please wait while Microsoft Office is being downloaded and installed...
    echo [%DATE% %TIME%] Selected Option 2: Office LTSC 2024. Executing setup.exe /configure configuration-LTSC2024-x64.xml >> "%LOG_FILE%"
    "%ODT_EXE%" /configure "%~dp0configuration-LTSC2024-x64.xml"
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
    echo   Installation process initiated successfully!
    echo   Activity log saved to: %LOG_FILE%
    echo.
    echo   NEXT STEP:
    echo   Once Microsoft completes the download window,
    echo   run start.bat again and select Option [3] to Activate.
    echo ==========================================================
    echo.
    pause
) else (
    echo.
    echo ==========================================================
    echo   [WARNING] Installation exited with code %EXIT_CODE%.
    echo   Activity log saved to: %LOG_FILE%
    echo   Detailed ODT logs can also be found in: %TEMP%
    echo ==========================================================
    pause
)

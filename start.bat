@echo off
chcp 65001 >nul
title Microsoft Office 365 / 2024 Suite
echo ==========================================================
echo   Microsoft Office Deployment ^& Activation Suite
echo ==========================================================
echo.
echo Select an option:
echo   [1] Install Microsoft 365 Apps (Recommended)
echo   [2] Install Office LTSC 2024 (Perpetual Volume)
echo   [3] Activate Installed Office (Ohook / MAS Permanent)
echo   [4] Exit
echo.
set /p CHOICE="Enter your choice (1-4): "

if "%CHOICE%"=="1" (
    call "%~dp0install_office.bat" 1
) else if "%CHOICE%"=="2" (
    call "%~dp0install_office.bat" 2
) else if "%CHOICE%"=="3" (
    call "%~dp0activate_office.bat"
) else (
    echo Goodbye!
    exit /b 0
)

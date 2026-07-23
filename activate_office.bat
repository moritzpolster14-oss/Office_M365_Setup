@echo off
chcp 65001 >nul
title Office License Activation (MAS / Ohook)

set LOG_DIR=%~dp0logs
if not exist "%LOG_DIR%" mkdir "%LOG_DIR%"
set LOG_FILE=%LOG_DIR%\setup_activity.log

echo [%DATE% %TIME%] --- Office Activation Started --- >> "%LOG_FILE%"

echo ==========================================================
echo   Microsoft Office Activation (Ohook / MAS)
echo ==========================================================
echo.
echo Launching Microsoft Activation Script (MAS) in a new window...
echo.
echo INSTRUCTIONS IN THE ACTIVATION WINDOW:
echo   1. Press key '2' for [Ohook] Activation
echo   2. Press key '1' for Install Ohook
echo.

start "Office Activation (MAS)" powershell -NoProfile -ExecutionPolicy Bypass -Command "irm https://get.activated.win | iex"

echo [%DATE% %TIME%] MAS Activation script launched. >> "%LOG_FILE%"

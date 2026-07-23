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
echo Opening dedicated Activation Window (MAS)...
echo.
echo INSTRUCTIONS IN THE ACTIVATION WINDOW:
echo   1. Press key '2' for [Ohook] Activation
echo   2. Press key '1' for Install Ohook
echo.

powershell -NoProfile -ExecutionPolicy Bypass -Command "Start-Process powershell -ArgumentList '-NoProfile -Command \"irm https://get.activated.win | iex\"' -Wait"

echo [%DATE% %TIME%] MAS Activation script finished. >> "%LOG_FILE%"
pause

@echo off
chcp 65001 >nul
title Office License Activation (MAS / Ohook)
echo ==========================================================
echo   Microsoft Office Activation (Ohook / MAS)
echo ==========================================================
echo.
echo Launching Microsoft Activation Script (MAS)...
echo.
echo INSTRUCTIONS IN THE MAS MENU:
echo 1. Press key '2' for [Ohook] Activation
echo 2. Press key '1' for Install Ohook
echo.
powershell -NoProfile -Command "irm https://get.activated.win | iex"
pause

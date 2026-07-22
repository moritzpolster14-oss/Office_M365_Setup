@echo off
chcp 65001 >nul
title Office Lizenz-Aktivierung (MAS / Ohook)
echo ==========================================================
echo   Microsoft Office Aktivierung (Ohook / MAS)
echo ==========================================================
echo.
echo Dieses Skript oeffnet das Microsoft Activation Script (MAS).
echo.
echo ANLEITUNG IM MAS-FENSTER:
echo 1. Druecke die Taste '2' fuer [Ohook] Aktivierung
echo 2. Druecke die Taste '1' fuer Install Ohook
echo.
powershell -NoProfile -Command "irm https://get.activated.win | iex"
pause

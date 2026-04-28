@echo off
setlocal EnableExtensions
title RESTAURANT_STOPPER

net session >nul 2>&1
if %errorlevel% neq 0 (
    powershell -NoProfile -ExecutionPolicy Bypass -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
    exit /b
)

cd /d "%~dp0"
set "PROJECT_DIR=%CD%"

echo ==========================================
echo FECHANDO RESTAURANT SYSTEM
echo ==========================================
echo.
echo Pasta do projeto:
echo %PROJECT_DIR%
echo.

echo [1/5] Fechando janelas do backend...
taskkill /FI "WINDOWTITLE eq RESTAURANT_BACKEND" /T /F

echo.
echo [2/5] Fechando janelas do frontend...
taskkill /FI "WINDOWTITLE eq RESTAURANT_FRONTEND" /T /F

echo.
echo [3/5] Fechando janela do iniciador...
taskkill /FI "WINDOWTITLE eq RESTAURANT_STARTER" /T /F

echo.
echo [4/5] Encerrando processos Node do sistema...
powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-CimInstance Win32_Process | Where-Object { $_.Name -eq 'node.exe' -and $_.CommandLine -like '*backend*' } | ForEach-Object { Stop-Process -Id $_.ProcessId -Force }"

powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-CimInstance Win32_Process | Where-Object { $_.Name -eq 'node.exe' -and $_.CommandLine -like '*frontend*' } | ForEach-Object { Stop-Process -Id $_.ProcessId -Force }"

powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-CimInstance Win32_Process | Where-Object { $_.Name -eq 'node.exe' -and $_.CommandLine -like '*vite*' } | ForEach-Object { Stop-Process -Id $_.ProcessId -Force }"

powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-CimInstance Win32_Process | Where-Object { $_.Name -eq 'node.exe' -and $_.CommandLine -like '*ts-node-dev*' } | ForEach-Object { Stop-Process -Id $_.ProcessId -Force }"

echo.
echo [5/5] Fechando Chrome do sistema...
powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-CimInstance Win32_Process | Where-Object { $_.Name -eq 'chrome.exe' -and $_.CommandLine -like '*localhost:5173/login*' } | ForEach-Object { Stop-Process -Id $_.ProcessId -Force }"

echo.
echo ==========================================
echo SISTEMA ENCERRADO
echo ==========================================
echo.
pause
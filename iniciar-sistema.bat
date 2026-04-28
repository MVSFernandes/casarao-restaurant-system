@echo off
net session >nul 2>&1
if %errorlevel% neq 0 (
    powershell -NoProfile -ExecutionPolicy Bypass -Command "Start-Process -FilePath '%~f0' -Verb RunAs"
    exit /b
)

title RESTAURANT_STARTER
echo ==========================================
echo INICIANDO SISTEMA
echo ==========================================
echo.

cd /d "%~dp0"

if not exist "backend" (
    echo [ERRO] Pasta backend nao encontrada.
    pause
    exit /b 1
)

if not exist "frontend" (
    echo [ERRO] Pasta frontend nao encontrada.
    pause
    exit /b 1
)

echo [1/8] Verificando Node.js...
where node >nul 2>&1
if errorlevel 1 (
    echo [ERRO] Node.js nao encontrado.
    pause
    exit /b 1
)

echo [2/8] Verificando npm...
where npm >nul 2>&1
if errorlevel 1 (
    echo [ERRO] npm nao encontrado.
    pause
    exit /b 1
)

echo.
echo [3/8] Preparando backend...
cd /d "%~dp0backend"

if not exist "package.json" (
    echo [ERRO] package.json do backend nao encontrado.
    pause
    exit /b 1
)

if exist "node_modules" goto :check_prisma

echo Instalando dependencias do backend...
call npm install
if errorlevel 1 (
    echo [ERRO] Falha no npm install do backend.
    pause
    exit /b 1
)

:check_prisma
echo.
echo [4/8] Verificando Banco de Dados e Prisma...
if exist "node_modules\@prisma\client" goto :start_backend

echo Gerando Prisma Client...
call npx prisma generate
if errorlevel 1 (
    echo [ERRO] Falha no prisma generate. Verifique sua conexao com o banco.
    pause
    exit /b 1
)

echo Sincronizando banco de dados...
call npx prisma db push
if errorlevel 1 (
    echo [ERRO] Falha no prisma db push. O MySQL esta rodando na porta 3306?
    pause
    exit /b 1
)

:start_backend
echo.
echo [5/8] Iniciando servidor Backend...
start "RESTAURANT_BACKEND" cmd /k "title RESTAURANT_BACKEND && cd /d ""%~dp0backend"" && npm run dev"

echo.
echo [6/8] Preparando frontend...
cd /d "%~dp0frontend"

if not exist "package.json" (
    echo [ERRO] package.json do frontend nao encontrado.
    pause
    exit /b 1
)

if exist "node_modules" goto :start_frontend

echo Instalando dependencias do frontend...
call npm install
if errorlevel 1 (
    echo [ERRO] Falha no npm install do frontend.
    pause
    exit /b 1
)

:start_frontend
echo.
echo [7/8] Iniciando servidor Frontend...
start "RESTAURANT_FRONTEND" cmd /k "title RESTAURANT_FRONTEND && cd /d ""%~dp0frontend"" && npm run dev"

echo.
echo [8/8] Aguardando sistema subir...
timeout /t 8 /nobreak >nul

echo Abrindo interface do usuario...
start "" chrome --kiosk-printing http://localhost:5173/login

echo.
echo ==========================================
echo SISTEMA INICIADO COM SUCESSO!
echo Para desligar tudo, use o "fechar-sistema.bat".
echo ==========================================
pause
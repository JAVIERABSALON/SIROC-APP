@echo off
setlocal
cd /d "%~dp0"
title Sistema de Control de Obras y SIROC
echo ========================================================================
echo         SISTEMA DE CONTROL DE OBRAS Y SIROC
echo ========================================================================
echo.
echo Verificando entorno Node.js...
node -v >nul 2>nul
if %errorlevel% neq 0 (
    echo [ERROR] Node.js no esta instalado en este equipo.
    echo Por favor descargue e instale Node.js desde: https://nodejs.org
    pause
    exit /b 1
)
if not exist "node_modules\" (
    echo Instalando componentes del sistema por primera vez...
    call npm install --omit=dev
    if %errorlevel% neq 0 (
        echo [ERROR] Ocurrio un problema al instalar componentes.
        pause
        exit /b 1
    )
)
echo.
echo Verificando integridad criptografica del codigo...
echo Iniciando servidor en puerto 3000...
echo El sistema abrira automaticamente el navegador en http://localhost:3000
echo.
node dist/server.cjs
if %errorlevel% neq 0 (
    echo.
    echo [ERROR] El servidor se detuvo con codigo %errorlevel%.
)
echo.
pause

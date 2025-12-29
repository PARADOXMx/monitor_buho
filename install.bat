@echo off
title Instalador Black List Monitor
color 0C

echo.
echo  ____  _      _    ____ _  __  _     ___ ____ _____ 
echo | __ )| |    / \  / ___| |/ / | |   |_ _/ ___|_   _
echo |  _ \| |   / _ \| |   | ' /  | |    | |\___ \ | |  
echo | |_) | |___ / ___ \ |___| . \  | |___ | | ___) || |  
echo |____/|_____/_/   \_\____|_|\_\ |_____|___|____/ |_|  
echo.
echo             @友ㅤPARADOXㅤMx
echo.
echo [*] Instalando Monitor Black List para Windows...

:: Verificar Python
python --version >nul 2>&1
if %errorlevel% neq 0 (
    echo [!] Python no detectado. Por favor instala Python desde https://www.python.org/
    pause
    exit
)

:: Crear archivo batch para ejecutar facil
echo @echo off > monitor-blacklist.bat
echo python "%~dp0monitor_buho.py" %%* >> monitor-blacklist.bat

echo [+] Instalacion completada!
echo [+] Se ha creado el archivo 'monitor-blacklist.bat'
echo [+] Puedes ejecutarlo haciendo doble clic o escribiendo 'monitor-blacklist' en esta carpeta.
echo.
pause

#!/bin/bash

# Colores para la terminal
RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

echo -e "${RED}  ____  _      _    ____ _  __  _     ___ ____ _____ ${NC}"
echo -e "${RED} | __ )| |    / \  / ___| |/ / | |   |_ _/ ___|_   _|${NC}"
echo -e "${RED} |  _ \| |   / _ \| |   | ' /  | |    | |\___ \ | |  ${NC}"
echo -e "${RED} | |_) | |___ / ___ \ |___| . \  | |___ | | ___) || |  ${NC}"
echo -e "${RED} |____/|_____/_/   \_\____|_|\_\ |_____|___|____/ |_|  ${NC}"
echo -e "${RED}             @友ㅤPARADOXㅤMx${NC}"

echo -e "${BLUE}[*] Iniciando instalación de Monitor Black List...${NC}"

# Verificar si Python está instalado
if ! command -v python3 &> /dev/null; then
    echo "Python3 no encontrado. Intentando instalar..."
    if [ -x "$(command -v pkg)" ]; then
        pkg install python -y
    elif [ -x "$(command -v apt)" ]; then
        sudo apt update && sudo apt install python3 -y
    else
        echo "No se pudo instalar Python automáticamente. Por favor instálalo manualmente."
        exit 1
    fi
fi

# Dar permisos de ejecución
chmod +x monitor_buho.py

# Detectar si es Termux
if [ -d "$PREFIX/bin" ]; then
    echo -e "${BLUE}[*] Detectado entorno Termux o similar.${NC}"
    cp monitor_buho.py $PREFIX/bin/monitor-blacklist
    chmod +x $PREFIX/bin/monitor-blacklist
    echo -e "${GREEN}[+] Instalación completada!${NC}"
    echo "Ejecuta la herramienta escribiendo: monitor-blacklist"
else
    # Asumir Linux estándar
    echo -e "${BLUE}[*] Detectado entorno Linux.${NC}"
    if [ -w "/usr/local/bin" ]; then
        cp monitor_buho.py /usr/local/bin/monitor-blacklist
        chmod +x /usr/local/bin/monitor-blacklist
        echo -e "${GREEN}[+] Instalación completada!${NC}"
        echo "Ejecuta la herramienta escribiendo: monitor-blacklist"
    else
        echo "Se requieren permisos de root para instalar en /usr/local/bin"
        sudo cp monitor_buho.py /usr/local/bin/monitor-blacklist
        sudo chmod +x /usr/local/bin/monitor-blacklist
        echo -e "${GREEN}[+] Instalación completada!${NC}"
        echo "Ejecuta la herramienta escribiendo: monitor-blacklist"
    fi
fi

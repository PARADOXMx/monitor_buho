#!/usr/bin/env python3
import time
import urllib.request
import urllib.error
import sys

# Códigos de color ANSI
ROJO = '\033[91m'
RESET = '\033[0m'

def mostrar_banner():
    # Logo "BLACK LIST" en ASCII
    logo = f"""{ROJO}
  ____  _      _    ____ _  __  _     ___ ____ _____ 
 | __ )| |    / \  / ___| |/ / | |   |_ _/ ___|_   _|
 |  _ \| |   / _ \| |   | ' /  | |    | |\___ \ | |  
 | |_) | |___ / ___ \ |___| . \  | |___ | | ___) || |  
 |____/|_____/_/   \_\____|_|\_\ |_____|___|____/ |_|  
{RESET}"""
    print(logo)
    print(f"{ROJO}             @友ㅤPARADOXㅤMx{RESET}")
    print("===================================================")
    print("Monitor Black List - Herramienta de Prueba de Conectividad")
    print("===================================================")

def probar_sitio(url):
    print(f"\n[*] Conectando a {url}...")
    try:
        inicio = time.time()
        req = urllib.request.Request(
            url, 
            headers={'User-Agent': 'MonitorBlackList/1.0'}
        )
        with urllib.request.urlopen(req) as response:
            fin = time.time()
            tiempo = (fin - inicio) * 1000
            codigo = response.getcode()
            print(f"[+] Estado: {codigo} OK")
            print(f"[+] Tiempo de respuesta: {tiempo:.2f} ms")
            print("[+] El servidor está respondiendo correctamente.")
    except urllib.error.HTTPError as e:
        print(f"[-] Error HTTP: {e.code}")
    except urllib.error.URLError as e:
        print(f"[-] Error de conexión: {e.reason}")
    except Exception as e:
        print(f"[-] Error inesperado: {e}")

if __name__ == "__main__":
    mostrar_banner()
    print("NOTA: Esta herramienta es para verificar la disponibilidad de tus propios sitios.")
    
    if len(sys.argv) > 1:
        url_objetivo = sys.argv[1]
    else:
        url_objetivo = input("Ingresa la URL a probar (ej. http://example.com): ")
    
    if url_objetivo:
        if not url_objetivo.startswith("http"):
            url_objetivo = "http://" + url_objetivo
        
        probar_sitio(url_objetivo)
    else:
        print("URL no válida.")

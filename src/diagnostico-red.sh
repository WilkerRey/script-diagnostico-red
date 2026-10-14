#!/bin/bash

# =================================================================
# Script para diagnosticar problemas de red en un sistema Linux
# Ejecuta ping, traceroute y netstat sobre una lista de hosts
# Generando un informe de conectividad
# =================================================================

# Lista de hosts que se van a probar
hosts=("8.8.8.8" "1.1.1.1" "google.com")

# Ruta del archivo de informe (junto al script)
directorio="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
reporte="$directorio/informe_red.txt"

# Crear el informe desde cero
echo "==========================================" > "$reporte"
echo "       INFORME DE DIAGNOSTICO DE RED" >> "$reporte"
echo "Fecha: $(date)" >> "$reporte"
echo "==========================================" >> "$reporte"
echo "" >> "$reporte"

# Recorrer cada host de la lista
for host in "${hosts[@]}"; do

    echo "Analizando: $host"
    echo "------------------------------------------" >> "$reporte"
    echo "Host: $host" >> "$reporte"
    echo "------------------------------------------" >> "$reporte"

    # -------------------------------------------------------------
    # Prueba de ping
    # -------------------------------------------------------------
    echo "Realizando prueba de ping a $host..."

    if command -v ping > /dev/null 2>&1; then
        if ping -c 4 -W 2 "$host" >> "$reporte" 2>&1; then
            echo "Resultado de ping: OK" | tee -a "$reporte"
        else
            echo "Resultado de ping: FALLIDO" | tee -a "$reporte"
        fi
    else
        echo "Error: ping no está instalado." >> "$reporte"
    fi

    echo "" >> "$reporte"

    # -------------------------------------------------------------
    # Prueba de traceroute
    # -------------------------------------------------------------
    echo "Realizando prueba de traceroute a $host..."
    echo "Resultados de traceroute:" >> "$reporte"

    if command -v traceroute > /dev/null 2>&1; then
        traceroute -n -m 5 -w 1 "$host" >> "$reporte" 2>&1
    else
        echo "TRACEROUTE no está instalado." >> "$reporte"
    fi

    echo "" >> "$reporte"

    # -------------------------------------------------------------
    # Consulta de conexiones de red con netstat
    # -------------------------------------------------------------
    echo "Consultando conexiones de red..."
    echo "Resultados de netstat:" >> "$reporte"

    if command -v netstat > /dev/null 2>&1; then
        netstat -tun >> "$reporte" 2>&1
    else
        echo "NETSTAT no está instalado." >> "$reporte"
    fi

    echo "" >> "$reporte"

done

# Finalizar el informe
echo "==========================================" >> "$reporte"
echo "FIN DEL DIAGNOSTICO" >> "$reporte"
echo "==========================================" >> "$reporte"

echo ""
echo "Diagnóstico de red completado."
echo "Informe generado en: $reporte"
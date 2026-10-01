#!/bin/bash

# =================================================================
# Script para diagnosticar problemas de red en un sistema Linux
# =================================================================

# host que se van a probar
hosts=("8.8.8.8" "1.1.1.1" "google.com")

# archivo informe
reporte = "informe_red.txt"

# limpiar archivo de reporte
echo "=========================================0" > $reporte
echo "Informe de Diagnóstico de Red" >> $reporte
echo "==========================================" >> $reporte
echo "" >> $reporte

# recorrer cada host de la lista
for host in "${hosts[@]}"; do
    echo "Analizando: $host"

    echo "-----------------------------------------" >> $reporte
    echo "Host: $host" >> $reporte
    ech0 "-----------------------------------------" >> $reporte

    # prueba de ping
    echo "Realizando prueba de ping..."

    if ping -c 4 $host > /dev/null 2>&1; then
        echo "Ping: OK" >> $reporte
        echo "Ping: OK"
    else
        echo "Ping: FALLIDO" >> $reporte
        echo "Ping: FALLIDO"
    fi

    # prueba de traceroute
    echo "Realizando prueba de traceroute..."

    if command -v traceroute > /dev/null 2>&1; then
        traceroute -m 5 -w 1 "$host" >> "$reporte" 2>&1
    else
        echo "TRACEROUTE no está instalado." >> $reporte
    fi

    # prueba de netstat

    echo "Realizando prueba de conexion de red..."

    if command -v netstat > /dev/null 2>&1; then
        netstat -tun >> "$reporte" 2>&1
    else
        echo "NETSTAT no está instalado." >> $reporte
    fi

    echo "" >> $reporte
done

echo "==========================================" >> $reporte
echo "FIN DIAGNOSTICO." >> $reporte
echo "==========================================" >> $reporte

echo ""
echo "Diagnóstico de red completado. Informe generado en informe_red.txt"
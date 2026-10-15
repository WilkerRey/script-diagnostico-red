# SCRIPT DE DIAGNOSTICO DE RED
Diagnóstico de Red en Linux

Descripción

Este proyecto consiste en un script desarrollado en Bash para diagnosticar problemas de conectividad de red en un sistema Linux. El script ejecuta diferentes pruebas de red sobre una lista de hosts y genera un informe con los resultados obtenidos.

El proyecto fue desarrollado utilizando Visual Studio Code como editor de código y la terminal de Linux para ejecutar el script.

Objetivo

Automatizar algunas pruebas básicas de conectividad de red para identificar posibles problemas de comunicación entre el equipo y diferentes hosts.

Funcionalidades

El script realiza las siguientes tareas:

- Ping: comprueba la conectividad con los hosts mediante el envío de paquetes ICMP.
- Traceroute: permite observar la ruta que siguen los paquetes hasta el destino, con un máximo de cinco saltos.
- Netstat: consulta las conexiones de red y muestra información sobre los protocolos TCP y UDP.
- Generación de informe: guarda los resultados de las pruebas en un archivo de texto llamado "informe_red.txt".
- Registro de fecha y hora: incluye la fecha y hora de ejecución del diagnóstico.
- Verificación de herramientas: comprueba si los comandos necesarios están instalados en el sistema.

Hosts evaluados

El script realiza las pruebas sobre los siguientes hosts:

Host| Descripción
"8.8.8.8"| Servidor DNS público de Google
"1.1.1.1"| Servidor DNS público de Cloudflare
"google.com"| Dominio utilizado para comprobar conectividad y resolución DNS

Requisitos

Para ejecutar el proyecto se necesita:

- Un sistema operativo Linux.
- Bash.
- Visual Studio Code, opcional para editar el script.
- Conexión de red para realizar las pruebas externas.
- Las herramientas "ping", "traceroute" y "netstat".

En distribuciones basadas en Debian o Ubuntu, las herramientas pueden instalarse con los siguientes comandos:

sudo apt update
sudo apt install iputils-ping traceroute net-tools

Estructura del proyecto

diagnostico-red/
├── diagnostico_red.sh
├── README.md
└── informe_red.txt

- "diagnostico_red.sh": contiene el script de diagnóstico.
- "README.md": documenta el funcionamiento y uso del proyecto.
- "informe_red.txt": archivo generado automáticamente con los resultados del diagnóstico.

Nota: el archivo "informe_red.txt" se crea o sobrescribe cada vez que se ejecuta el script.

Instalación y ejecución

1. Abrir el proyecto

Abra la carpeta del proyecto en Visual Studio Code.

2. Dar permisos de ejecución

Desde la terminal de Linux, ejecute:

chmod +x diagnostico_red.sh

3. Ejecutar el script

Ejecute el siguiente comando:

./diagnostico_red.sh

También puede ejecutarlo directamente con Bash:

bash diagnostico_red.sh

4. Consultar el informe

Al finalizar, el script mostrará la ruta del archivo generado. Para consultar el informe desde la terminal, utilice:

cat informe_red.txt

Para leerlo página por página:

less informe_red.txt

Funcionamiento

El script sigue este procedimiento:

1. Define los hosts que serán evaluados.
2. Identifica la carpeta donde se encuentra el archivo Bash.
3. Crea el informe e incluye la fecha y hora de ejecución.
4. Recorre cada host de la lista.
5. Ejecuta las pruebas de ping, traceroute y netstat.
6. Guarda los resultados y los mensajes de error en el informe.
7. Finaliza el diagnóstico e informa la ubicación del archivo generado.

Resultados esperados

El informe contiene los resultados de las pruebas realizadas, incluyendo:

- Respuestas o fallos de ping.
- Información sobre los saltos de la ruta de red.
- Conexiones TCP y UDP detectadas.
- Mensajes relacionados con herramientas que no estén instaladas.

Un resultado de ping fallido no significa necesariamente que el host esté fuera de servicio, ya que algunos servidores o redes bloquean las solicitudes ICMP.

Limitaciones

- La disponibilidad de las herramientas depende de la distribución de Linux utilizada.
- "traceroute" puede no mostrar todos los saltos si algunos dispositivos bloquean las respuestas.
- "netstat -tun" muestra conexiones TCP y UDP, pero no identifica por sí solo problemas específicos de conectividad con cada host.
- El script no repara automáticamente los problemas encontrados; únicamente recopila información para facilitar su diagnóstico.

Autoría y tecnologías

- Lenguaje: Bash.
- Entorno de desarrollo: Visual Studio Code.
- Sistema operativo: Linux.
- Herramientas de red: ping, traceroute y netstat.
- Formato del informe: archivo de texto (".txt").

Licencia

Este proyecto es de carácter académico y puede utilizarse como material de aprendizaje para practicar la automatización de tareas de diagnóstico de red en Linux.
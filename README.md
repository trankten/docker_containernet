# Docker ContainerNet

A powerful Bash script to list all Docker containers, their internal IPs, and hostnames in a formatted ASCII table. It handles multiple IPs for a single container by creating separate entries and sorts the results in ascending order by IP address.

**Repository URL**: [https://github.com/trankten/docker_containernet/](https://github.com/trankten/docker_containernet/)

---

## Features

- Displays Docker containers with:
  - **Container Name**
  - **Internal IP Address**
  - **Hostname**
- Handles multiple IPs for a single container by creating separate table entries.
- Outputs results in a well-formatted ASCII table.
- Sorts the table rows by IP address in ascending order.
- Truncates long values gracefully to ensure table readability.

---

# Docker ContainerNet (En español xD)

Un script Bash para listar todos los contenedores Docker, sus direcciones IP internas y nombres de host en una tabla ASCII bien formateada. Maneja múltiples IPs para un único contenedor creando entradas separadas y ordena los resultados en orden ascendente por dirección IP.

**URL del Repositorio**: [https://github.com/trankten/docker_containernet/](https://github.com/trankten/docker_containernet/)

---

## Características

- Muestra los contenedores Docker con:
  - **Nombre del Contenedor**
  - **Dirección IP Interna**
  - **Nombre del Host**
- Maneja múltiples direcciones IP por contenedor creando entradas separadas.
- Los resultados se muestran en una tabla ASCII bien formateada.
- Ordena las filas de la tabla por dirección IP en orden ascendente.
- Trunca valores largos de forma elegante para mantener la legibilidad.

---


## Installation / Instalación

```bash
git clone https://github.com/trankten/docker_containernet.git
cd docker_containernet
chmod +x ./list.sh
sudo ./list.sh
```

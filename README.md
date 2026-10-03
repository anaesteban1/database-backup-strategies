# Database Backup Strategies

Proyecto grupal desarrollado por:

- Ana Esteban
- Saul Alvarado

## Objetivo

Demostrar estrategias de respaldo de bases de datos sin utilizar Microsoft SQL Server.

## Tecnologias

- Python
- Django
- MySQL
- PyMySQL
- mysqldump
- GitHub
- Railway

## Estrategias de respaldo

### Full Backup

Se utiliza mysqldump para generar una copia logica completa de la base de datos MySQL.

### Automated Backup

El script de PowerShell ubicado en:

scripts/backup_mysql.ps1

permite automatizar la generacion de respaldos.

### Backup Retention

Los archivos de respaldo se identifican mediante fecha y hora para permitir mantener diferentes versiones.

## Arquitectura

Usuario
  |
Django
  |
MySQL
  |
mysqldump
  |
Backup SQL

## Despliegue

El codigo fuente se almacena en GitHub y la aplicacion se despliega en Railway.

El repositorio GitHub queda conectado al servicio cloud para permitir despliegues automaticos cuando se publican nuevos cambios.

## Autores

Ana Esteban y Saul Alvarado

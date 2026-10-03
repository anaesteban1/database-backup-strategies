# Database Backup Strategies

Proyecto grupal desarrollado por:

- Ana Esteban
- Saul Alvarado

## Objetivo

Demostrar estrategias de respaldo de bases de datos evitando Microsoft SQL Server.

## Tecnologias

- Python
- Django
- PostgreSQL
- pg_dump
- GitHub
- Render

## Estrategias de respaldo

### Full Backup

Se utiliza pg_dump para crear un respaldo logico de PostgreSQL.

### Automated Backup

El proceso de backup puede programarse para ejecutarse periodicamente sin intervencion manual.

### Backup Retention

Los archivos se generan con fecha y hora para conservar diferentes versiones de respaldo.

## Arquitectura

Usuario
  |
Django
  |
PostgreSQL
  |
pg_dump
  |
Backup

## Despliegue automatizado

El repositorio publico de GitHub esta conectado a Render.

Los cambios enviados a la rama main generan automaticamente un nuevo despliegue del servicio.

## Autores

Ana Esteban
Saul Alvarado

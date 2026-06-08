# 🐧 Linux Backup Automation

Script en Bash para automatizar backups de directorios importantes en Linux.

Autor: **Juan Carlos Blanco Ruiz**  
Contacto: juancarlosblancoruiz@gmail.com

## 🚀 Características
- Backups automáticos con fecha y hora
- Compresión con tar.gz
- Limpieza automática de backups antiguos (+7 días)
- Fácil de configurar
- Optimizado para sistemas Debian/Ubuntu

## 📋 Requisitos
- Sistema Linux (Debian/Ubuntu)
- Bash

## 📝**Nota:** Si no tienes carpetas Documentos o Proyectos, el script las saltará. Puedes:

    Crear esas carpetas: mkdir ~/Documentos ~/Proyectos
    O editar el script y cambiar los directorios por otros que sí tengas (como ~/Descargas, ~/Imágenes, etc.)

## ⚙️ Configuración
Edita el archivo backup.sh y modifica:

    BACKUP_DIR: Directorio donde se guardarán los backups
    SOURCE_DIRS: Lista de directorios a respaldar

## 🕐 Automatizar con Cron
Para ejecutar diariamente a las 3 AM:
```bash
crontab -e
# Añade:
0 3 * * * /ruta/al/backup.sh
```
## 🛠️ Instalación
```bash
git clone https://github.com/Juank9113/linux-backup-automation.git
cd linux-backup-automation
chmod +x backup.sh
```

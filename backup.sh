#!/bin/bash
#############################################
# Script de Backup Automático
# Autor: Juan Carlos Blanco Ruiz
# Contacto: juancarlosblancoruiz@gmail.com
# Descripción: Crea backups con fecha de directorios importantes
#############################################

# Configuración
BACKUP_DIR="$HOME/backups"
SOURCE_DIRS=(
    "$HOME/Documentos"
    "$HOME/Proyectos"
    # Añade más directorios según necesites
)

# Crear directorio de backups si no existe
mkdir -p "$BACKUP_DIR"

# Fecha y hora para el nombre del archivo
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")
BACKUP_FILE="$BACKUP_DIR/backup_$TIMESTAMP.tar.gz"

echo "🔄 Iniciando backup..."
echo "👤 Autor: Juan Carlos Blanco Ruiz"
echo "📁 Directorios a respaldar:"

# Crear lista de archivos a respaldar
FILES_TO_BACKUP=""
for dir in "${SOURCE_DIRS[@]}"; do
    if [ -d "$dir" ]; then
        echo "   ✓ $dir"
        FILES_TO_BACKUP="$FILES_TO_BACKUP $dir"
    else
        echo "   ⚠️  $dir (no existe, saltando)"
    fi
done

# Crear el backup
if [ -n "$FILES_TO_BACKUP" ]; then
    echo "📦 Creando archivo comprimido..."
    tar -czf "$BACKUP_FILE" $FILES_TO_BACKUP 2>/dev/null
    
    if [ $? -eq 0 ]; then
        SIZE=$(du -h "$BACKUP_FILE" | cut -f1)
        echo "✅ Backup completado exitosamente!"
        echo "📄 Archivo: $BACKUP_FILE"
        echo "📊 Tamaño: $SIZE"
    else
        echo "❌ Error al crear el backup"
        exit 1
    fi
else
    echo "⚠️  No hay directorios válidos para respaldar"
    exit 1
fi

# Limpiar backups antiguos (más de 7 días)
echo "🧹 Limpiando backups antiguos..."
find "$BACKUP_DIR" -name "backup_*.tar.gz" -mtime +7 -delete
echo "✅ Limpieza completada"

echo "🎉 ¡Todo listo!"
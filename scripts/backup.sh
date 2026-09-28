#!/bin/bash

# Пути к директориям
DOCS_DIR="$HOME/ict_lab2/docs"
LOGS_DIR="$HOME/ict_lab2/logs"
BACKUP_DIR="$HOME/ict_lab2/backup"

# Текущая дата для имени архива
DATE=$(date +%Y-%m-%d_%H-%M-%S)
ARCHIVE_NAME="backup_$DATE.tar.gz"

# 1. Архивация каталога docs
tar -czf "$BACKUP_DIR/$ARCHIVE_NAME" -C "$DOCS_DIR" .

if [ $? -eq 0 ]; then
    echo "Бэкап успешно создан: $BACKUP_DIR/$ARCHIVE_NAME"
else
    echo "Ошибка при создании бэкапа!"
    exit 1
fi

# 2. Очистка логов старше 7 дней (или просто очистка файлов .log)
find "$LOGS_DIR" -type f -name "*.log" -mtime +7 -delete

echo "Очистка старых логов завершена."



#!/bin/bash
set -e

# Загружаем переменные окружения из .env (не светим пароль в коде!)
source /opt/shvirtd-example-python/.env

BACKUP_DIR="/opt/backup"
TIMESTAMP=$(date +"%Y%m%d_%H%M%S")

docker run --rm \
  --entrypoint "" \
  --network shvirtd-example-python_backend \
  -v "${BACKUP_DIR}:/backup" \
  schnitzler/mysqldump \
  mysqldump --opt -h db -u root -p"${MYSQL_ROOT_PASSWORD}" --result-file="/backup/dump_${TIMESTAMP}.sql" "${MYSQL_DATABASE}"

echo "Backup completed: ${BACKUP_DIR}/dump_${TIMESTAMP}.sql"

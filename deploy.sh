#!/bin/bash
set -e

REPO_URL="https://github.com/Zolotkoff/shvirtd-example-python.git"
TARGET_DIR="/opt/shvirtd-example-python"

if [ -d "$TARGET_DIR" ]; then
  echo "Репозиторий уже существует, обновляем..."
  cd "$TARGET_DIR"
  sudo git pull
else
  echo "Клонируем репозиторий в $TARGET_DIR..."
  sudo git clone "$REPO_URL" "$TARGET_DIR"
  cd "$TARGET_DIR"
fi

echo "Запускаем проект через docker compose..."
sudo docker compose up -d --build

echo "Деплой завершён!"
sudo docker ps -a

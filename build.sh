#!/bin/bash
set -e  # Прерывать при ошибках

# Установка .NET в домашнюю директорию
export DOTNET_ROOT=$HOME/.dotnet
export PATH="$DOTNET_ROOT:$PATH"

# Установка .NET 8.0 (если еще не установлен)
if ! command -v dotnet &> /dev/null; then
    curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin \
        --version 8.0.204 \
        --install-dir $HOME/.dotnet
fi

# Проверка установки
dotnet --version

# Сборка бекенда
cd ReactApp1.Server
dotnet restore
dotnet publish -c Release -o ./publish

# Сборка фронтенда
cd ../reactapp1.client

# Установка зависимостей и сборка
npm install --unsafe-perm
npm run build

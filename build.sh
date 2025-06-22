#!/bin/bash
set -e  # Прерывать при ошибках

# Установка .NET 8.0
curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin \
    --version 8.0.204 \
    --install-dir /opt/dotnet

export DOTNET_ROOT=/opt/dotnet
export PATH="$DOTNET_ROOT:$PATH"

# Сборка бекенда
cd ReactApp1.Server
dotnet restore
dotnet publish -c Release -o ./publish

# Сборка фронтенда
cd ../reactapp1.client

# Исправление прав доступа для Vite
npm install -g vite
npm install --unsafe-perm
npm run build

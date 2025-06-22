#!/bin/bash
set -e

# Установка .NET
export DOTNET_ROOT=$HOME/.dotnet
export PATH="$DOTNET_ROOT:$PATH"

if ! command -v dotnet &> /dev/null; then
    curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin \
        --version 8.0.204 \
        --install-dir $HOME/.dotnet
fi

# Сборка бекенда
cd ReactApp1.Server
dotnet publish -c Release -o ./publish

# Сборка фронтенда
cd ../reactapp1.client

# Исправление прав и установка Vite глобально
export NPM_CONFIG_PREFIX=$HOME/.npm-global
export PATH="$PATH:$HOME/.npm-global/bin"
npm install -g vite@latest --unsafe-perm

# Установка зависимостей и сборка
npm install --unsafe-perm --legacy-peer-deps
npm run build

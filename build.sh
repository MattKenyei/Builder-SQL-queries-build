#!/bin/bash

# Установка .NET 9.0
curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin --version 9.0.100-preview.7

# Добавляем .NET в PATH
export PATH="$HOME/.dotnet:$PATH"

# Сборка проекта
cd ReactApp1.Server
dotnet publish -c Release -o ./publish

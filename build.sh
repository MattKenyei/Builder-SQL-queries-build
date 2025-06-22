#!/bin/bash

curl -sSL https://dot.net/v1/dotnet-install.sh | bash /dev/stdin --version 6.0.423

export PATH="$HOME/.dotnet:$PATH"

cd ReactApp1.Server
dotnet publish -c Release -o ./publish

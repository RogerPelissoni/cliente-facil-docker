#!/bin/sh
set -e

cd /app

if [ ! -f "package.json" ]; then
  echo "package.json não encontrado em /app"
  exit 1
fi

if [ ! -d "node_modules" ] || [ ! -f "node_modules/.bin/next" ]; then
  echo "Instalando dependências..."
  pnpm install
fi

exec "$@"
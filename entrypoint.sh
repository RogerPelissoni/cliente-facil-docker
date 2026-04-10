#!/bin/bash

BASE_DIR="$HOME/dev"

REPOS=(
  "git@github.com:rogerpelissoni/cliente-facil-java.git"
  "git@github.com:rogerpelissoni/cliente-facil-next.git"
  "git@github.com:rogerpelissoni/cliente-facil-docker.git"
)

echo "📁 Garantindo diretório $BASE_DIR"
mkdir -p "$BASE_DIR"

for REPO in "${REPOS[@]}"; do
  NAME=$(basename "$REPO" .git)
  TARGET_DIR="$BASE_DIR/$NAME"

  if [ -d "$TARGET_DIR" ]; then
    echo "⚠️ Repositório '$NAME' já existe, pulando clone..."
  else
    echo "⬇️ Clonando $NAME"
    git clone "$REPO" "$TARGET_DIR"
  fi
done

echo "🚀 Ambiente pronto em $BASE_DIR"
echo "👉 Para subir:"
echo "cd $BASE_DIR/cliente-facil-docker && docker compose up --build"
#!/bin/bash
set -e

cd /app

echo "🚀 Iniciando aplicação..."

# Validação básica do projeto
if [ ! -f "pom.xml" ]; then
  echo "❌ pom.xml não encontrado em /app"
  exit 1
fi

# Garantir permissão do Maven Wrapper (caso exista)
if [ -f "./mvnw" ]; then
  chmod +x ./mvnw
  MVN_CMD="./mvnw"
else
  MVN_CMD="mvn"
fi

echo "🧹 Executando build limpo (mvn clean)..."
echo "⚠️ Isso evita problemas com migrations antigas no Flyway (target/classes)"

# Execução padrão usando ciclo correto do Maven
exec $MVN_CMD clean spring-boot:run
#!/bin/bash
set -e

cd /app

if [ ! -f "pom.xml" ]; then
  echo "pom.xml não encontrado em /app"
  exit 1
fi

if [ -f "./mvnw" ]; then
  chmod +x ./mvnw
  ./mvnw spring-boot:run
else
  mvn spring-boot:run
fi
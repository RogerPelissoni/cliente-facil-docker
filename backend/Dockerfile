FROM maven:3.9.9-eclipse-temurin-21

WORKDIR /app

RUN apt-get update && apt-get install -y bash curl && rm -rf /var/lib/apt/lists/*

# Garante que o cache do Maven (volume nomeado montado em /home/ubuntu/.m2)
# seja gravável independentemente do UID/GID com que o container roda.
RUN mkdir -p /home/ubuntu/.m2 && chmod -R 777 /home/ubuntu/.m2

COPY backend/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

EXPOSE 8080

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
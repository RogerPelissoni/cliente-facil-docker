FROM maven:3.9.9-eclipse-temurin-21

WORKDIR /app

RUN apt-get update && apt-get install -y bash curl && rm -rf /var/lib/apt/lists/*

COPY cliente-facil-docker/backend/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

EXPOSE 8080

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]
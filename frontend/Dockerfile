FROM node:22.19-alpine

WORKDIR /app

RUN apk add --no-cache bash libc6-compat

RUN corepack enable

# Garante que node_modules (volume nomeado) seja gravável
# independentemente do UID/GID com que o container roda.
RUN mkdir -p /app/node_modules && chmod -R 777 /app/node_modules

# Prepara o pnpm já como o usuário "node": o cache do corepack fica em
# /home/node, o mesmo HOME usado em runtime (evita redownload/lock do
# corepack quando o container troca de usuário).
USER node
RUN corepack prepare pnpm@latest --activate
USER root

COPY frontend/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

EXPOSE 3000

ENTRYPOINT ["sh", "/usr/local/bin/entrypoint.sh"]
CMD ["pnpm", "dev", "--hostname", "0.0.0.0"]
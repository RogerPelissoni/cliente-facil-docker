FROM node:20-alpine

WORKDIR /app

RUN apk add --no-cache bash libc6-compat

RUN corepack enable && corepack prepare pnpm@latest --activate

COPY cliente-facil-docker/frontend/entrypoint.sh /usr/local/bin/entrypoint.sh
RUN chmod +x /usr/local/bin/entrypoint.sh

EXPOSE 3000

ENTRYPOINT ["sh", "/usr/local/bin/entrypoint.sh"]
CMD ["pnpm", "dev", "--hostname", "0.0.0.0"]
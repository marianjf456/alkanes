FROM node:lts
RUN npm install -g pnpm
WORKDIR /app
COPY lib lib
COPY bin bin
COPY package.json package.json
COPY pnpm-lock.yaml jsonrpc/pnpm-lock.yaml
RUN pnpm install
CMD ["pnpm", "start"]

FROM node:lts
RUN npm install -g pnpm
WORKDIR /app
COPY package.json package.json
COPY pnpm-lock.yaml pnpm-lock.yaml
RUN pnpm install
COPY lib lib
COPY bin bin
CMD ["pnpm", "start"]

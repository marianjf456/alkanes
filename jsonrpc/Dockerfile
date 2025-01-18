FROM node:lts
WORKDIR /app
COPY lib lib
COPY bin bin
COPY package.json package.json
COPY yarn.lock yarn.lock
RUN yarn
CMD ["yarn", "start"]

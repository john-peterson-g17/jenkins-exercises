FROM node:20-alpine

RUN mkdir /app

COPY ./app /app

WORKDIR /app

RUN npm install

EXPOSE 3000

CMD ["node", "server.js"]

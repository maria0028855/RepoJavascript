from node:latest

WORKDIR /
COPY src .
COPY public .
COPY package.json .

EXPOSE 8000

ENTRYPOINT npm run start
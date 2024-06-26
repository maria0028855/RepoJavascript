FROM node:latest

WORKDIR /
RUN mkdir -p /src
ADD ./src /src

RUN mkdir -p /public
ADD ./public /public

COPY package.json /

RUN npm install
EXPOSE 8000

ENTRYPOINT npm run start
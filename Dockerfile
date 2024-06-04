from node:latest

WORKDIR /
RUN mkdir -p /src
ADD ./src /src

RUN mkdir -p /public
ADD ./public /public

COPY package.json /

EXPOSE 8000

ENTRYPOINT npm run start
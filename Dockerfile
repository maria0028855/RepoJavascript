from node:latest

WORKDIR /
ADD . /

EXPOSE 8000

ENTRYPOINT npm run start
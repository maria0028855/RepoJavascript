from nginx:latest

COPY src /usr/share/nginx/html
COPY public /usr/share/nginx/html
COPY package.json /usr/share/nginx/html

ENTRYPOINT [ "nginx","-g", "daemon off;" ]
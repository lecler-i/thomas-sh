FROM nginx:alpine

COPY public /usr/share/nginx/html

RUN ls /usr/share/nginx/html

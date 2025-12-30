FROM node:20-alpine

RUN apk add --update graphicsmagick tzdata

USER root

RUN apk add --update --virtual build-dependencies \
        python3 build-base && \
    npm_config_user=root npm install --location=global n8n@latest && \
    apk del build-dependencies

WORKDIR /data

EXPOSE $PORT

ENV N8N_USER_ID=root

CMD export N8N_PORT=$PORT && n8n start


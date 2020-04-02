FROM node:13-alpine

ARG AWS_ACCESS_KEY_ID
ARG AWS_SECRET_ACCESS_KEY

RUN mkdir /root/.aws
COPY etc/credentials /root/.aws/credentials
COPY etc/config /root/.aws/config

WORKDIR /app

RUN npm install -g @aws-amplify/cli@1.8.0 @vue/cli
RUN npm install

COPY . .

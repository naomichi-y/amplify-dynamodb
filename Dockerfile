FROM node:13-alpine

WORKDIR /app

RUN npm install -g @aws-amplify/cli@1.8.0 @vue/cli
RUN npm install

COPY . .

FROM node:24-alpine
WORKDIR /app

ENV \
    NODE_ENV=production

COPY ./webserver .

RUN npm install

EXPOSE 8081

CMD ["npm", "start"]
FROM alpine
RUN apk update
RUN apk upgrade
RUN apk add nodejs nodejs-npm
WORKDIR /src
COPY package.json .
COPY package-lock.json .
RUN npm install
COPY ./bin/client.js .
# set the debug environment variable
ENV DEBUG=node:server
CMD ["npm", "start"]
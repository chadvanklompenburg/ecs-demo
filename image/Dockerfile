FROM node:7.6.0
ARG ENTRYPOINT
EXPOSE 3000
RUN mkdir /var/node
COPY $ENTRYPOINT /var/node/index.js
COPY package.json /var/node
WORKDIR /var/node
RUN npm install
ENTRYPOINT ["npm", "start"]

FROM node:7.6.0
EXPOSE 3000
RUN mkdir /var/node
COPY index.js /var/node
COPY package.json /var/node
WORKDIR /var/node
RUN npm install
CMD ["npm","start"]

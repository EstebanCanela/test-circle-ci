FROM node:12.18.4-alpine
LABEL Maintainer="Esteban Canela"
ENV APP_DIR test-circle
WORKDIR /usr/app/${APP_DIR}
COPY package*.json ./
COPY .npmrc .
RUN npm install
COPY . .
RUN npm prune --production
RUN rm -Rf test
EXPOSE 3000
USER node
CMD [ "npm" , "start" ]
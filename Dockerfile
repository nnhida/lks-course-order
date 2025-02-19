FROM node:18-alpine
RUN apk add g++ make py3-pip

ARG NODE_ENV=production
ARG PORT=8000

ENV PORT=${PORT}
ENV NODE_ENV=${NODE_ENV}

WORKDIR /usr/src/app
COPY package.json package-lock.json ./
RUN npm install
COPY . .

EXPOSE ${PORT}
CMD [ "npm", "run", "start" ]
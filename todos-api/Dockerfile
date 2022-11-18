FROM node:8.17.0

# Create app directory
RUN mkdir /todos-api
WORKDIR /todos-api

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY package*.json /todos-api/

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production
# Bundle app source
COPY . /todos-api
RUN npm install

ARG JWT_SECRET
ARG REDIS_HOST
ARG REDIS_PORT
ARG REDIS_CHANNEL
ARG TODO_API_PORT
ARG ZIPKIN_URL

ENV JWT_SECRET = $JWT_SECRET
ENV REDIS_HOST=$REDIS_HOST
ENV REDIS_PORT=$REDIS_PORT
ENV REDIS_CHANNEL=$REDIS_CHANNEL
ENV TODOS_API_ADDRESS=$TODOS_API_ADDRESS
ENV ZIPKIN_URL=$ZIPKIN_URL

EXPOSE 8060
CMD [ "npm", "start" ]

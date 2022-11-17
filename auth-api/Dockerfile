FROM golang:1.18.2-alpine

# create a working directory inside the image
RUN mkdir /auth-api
WORKDIR /auth-api

# build go 
RUN export GO111MODULE=on
RUN go mod init github.com/bortizf/microservice-app-example/tree/master/auth-api

# copy directory files i.e all files ending with .go
COPY *.go ./

# compile application
RUN go mod tidy
RUN go build

# set up env variables
ARG AUTH_API_PORT
ARG USERS_API_ADDRESS
ARG JWT_SECRET

ENV AUTH_API_PORT=$AUTH_API_PORT
ENV USERS_API_ADDRESS=$USERS_API_ADDRESS
ENV JWT_SECRET=$JWT_SECRET

# tells Docker that the container listens on specified network ports at runtime
EXPOSE 8050

# command to be used to execute when the image is used to start a container
CMD [ "./auth-api" ]

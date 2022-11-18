#Stage 1
FROM adoptopenjdk/openjdk8:alpine AS build
RUN mkdir /users-api
COPY . /users-api
WORKDIR /users-api
RUN chmod +x mvnw
RUN ./mvnw clean install

#Stage 2
FROM adoptopenjdk/openjdk8:alpine

# Create app directory
RUN mkdir /users-api

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
COPY --from=build /users-api/target/users-api-0.0.1-SNAPSHOT.jar /users-api/users-api-0.0.1-SNAPSHOT.jar

WORKDIR /users-api

#COPY .mvn/ .mvn
#COPY mvnw pom.xml ./

#RUN ./mvnw clean install
# If you are building your code for production
# RUN npm ci --only=production
# Bundle app source

ARG JWT_SECRET
ARG SERVER_PORT

ENV JWT_SECRET=$JWT_SECRET
ENV SERVER_PORT=$SERVER_PORT

EXPOSE 8045
CMD [ "java", "-jar", "users-api-0.0.1-SNAPSHOT.jar" ]

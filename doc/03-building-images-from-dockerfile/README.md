# Download the todo-app repos and add Dockerfiles.


## Fork the repository in Github.

![image](assets/images/fork_repository.png)

## Clone the repository in you local machine. 
```
$ git clone <\repository_url>
```
## Create a Dockerfile to frontend service.

![image](assets/images/fronted_dockerfile.png)

## Build the frontend dockerfile.
```
$ docker build -t daramirezs/auth-kube:1.0 -t daramirezs/auth-kube:latest .
```
## Run the frontend image.
```
$ sudo docker run -e PORT="8080" -e AUTH_API_ADDRESS="<service_domain>:<port> " -e TODOS_API_ADDRESS="http://<service_domain>:<port>" -e ZIPKIN_URL=" <service_domain>:<port> " --name frontend-kube -p 8040:8040 -d daramirezs/frontend:1.0
```

![image](assets/images/fronted-dockerfile-running.png)

![image](assets/images/frontend_logs.png)

![image](assets/images/frontend-1.png)

## Create a Dockerfile to auth service.

![image](assets/images/movie-analyst-api-docker.png)

## Build the movie-analyst-api dockerfile.

$ docker build -t daramirezs/movie-analyst-api:1.0 -t daramirezs/movie-analyst-api:latest .

![image](assets/images/build-movie-analyst-api.png)

## Run movie-analyst-api image.

$ docker run -e PORT=3000 --name movie-analyst-api -p 3000:3000 -d daramirezs/movie-analyst-api:latest

![image](assets/images/run-movie-analyst-api.png)

# Run synchronously ensuring that the API is responding to all the UI requests.

Once both dockers are running we just need to check that the ports are well binding and test the application.

![image](assets/images/docker_ps.png)
![image](assets/images/ui_application.png)

## Latest Reviews

![image](assets/images/latest_movies_reviews.png)

## Partners

![image](assets/images/partners.png)


# Upload both images to any container Registry such as Docker Hub 

## Requirements

* Docker account [logged in your shell](https://stackoverflow.com/questions/57108005/login-to-docker-hub-by-command-line) 

[Docker](https://docs.docker.com/docker-hub/repos/) Hub repositories allow you share container images with your team, customers, or the Docker community at large.

To push an image to Docker Hub, you must first name your local image using your Docker Hub username and the repository name that you created through Docker Hub on the web.

$ docker push -a <\hub-user>/<\repo-name>:<\tag>

## Movie analyst ui
![image](assets/images/docker_push_movie_analyst_ui.png)

## Movie analyst api

![image](assets/images/docker_push_movie_analyst-api.png)

## Dockerhub

![image](assets/images/dockerhub_apis.png)

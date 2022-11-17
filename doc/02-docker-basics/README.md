# Requirements

* Install [docker](https://docs.docker.com/engine/install/)

* Dockerhub account

# Pull a Redis image from Docker Hub and make it run.

1. Search docker image to pull in docker hub (redis)

![image](assets/images/dockerhub_redis.png)

2. Pull redis image

$ docker pull redis: <\version>

![image](assets/images/pull_redis_image.png)

If we list our docker images: 

![image](assets/images/ls_docker_images.png)

Now, to run our docker in second plane just:

$ docker run -d redis 

![image](assets/images/run_docker_images.png)

# Connect to the Redis CLI from your host.

To connect our terminal with the docker container: 

$ docker exec -it <\container_id> /bin/bash

![image](assets/images/docker_exec.png)

Now, we can run commands in our redis container:

![image](assets/images/redis_cli.png)

# Show logs from a running container.

To save the log of our container:

$ docker logs <\container_id> >> myredis.log

![image](assets/images/container_log.png)


# Create a custom image from a running container.


1. create temporal file to modify our running container:

![image](assets/images/temporal_file.png)

2. Create an image from the container:

$ docker commit <\container_name>

Now look at the docker images list:

![image](assets/images/create_docker_image.png)  

3. Tag the image: 

$ docker tag <\image_id> <\SOURCE_IMAGE><:><\tag>

![image](assets/images/ls_images.png)  

4. Push the image:

$ docker push <\image_name>

![image](assets/images/push_image.png)  

Image in dockerhub:

![image](assets/images/dockerhub_image.png)  

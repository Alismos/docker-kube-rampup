#!/bin/bash

export $(cat .env | xargs)

echo "pulling images"
docker pull daramirezs/todos-kube:$TODOS_IMAGE_VERSION
docker pull daramirezs/message-processor-kube:$PROCESSOR_IMAGE_VERSION
docker pull redis:7.0-alpine

echo "Create todos pod"
kubectl run todos-kube --image daramirezs/todos-kube:$TODOS_IMAGE_VERSION --env="JWT_SECRET=$JWT_SECRET" --env="REDIS_HOST=$REDIS_HOST" --env="REDIS_PORT=$REDIS_PORT" --env="REDIS_CHANNEL=$REDIS_CHANNEL" --env="TODO_API_PORT=$TODO_API_PORT" --env="ZIPKIN_URL=$ZIPKIN_URL" 

echo "Create message processor pod"
kubectl run message-processor-kube --image daramirezs/message-processor-kube:$PROCESSOR_IMAGE_VERSION --env="REDIS_HOST=$REDIS_HOST" --env="REDIS_PORT=$REDIS_PORT" --env="REDIS_CHANNEL=$REDIS_CHANNEL" --env="ZIPKIN_URL=$ZIPKIN_URL" 

echo "Create redis pod"
kubectl run redis-kube --image redis:7.0-alpine

echo "Create message processor service"
kubectl expose pods message-processor-kube --cluster-ip="10.97.227.65" --type='ClusterIP' --name=message-processor-kube-service

echo "Create redis service"
kubectl expose pods redis-kube --port=$REDIS_PORT --target-port=$REDIS_PORT --cluster-ip="10.97.227.61" --type='ClusterIP' --name=redis-kube-service

echo "Create todos service"
kubectl expose pods todos-kube --port=$TODO_API_PORT --cluster-ip="10.97.227.60" --type='ClusterIP' --name=todos-kube-service

echo "Run todos service"
minikube service todos-kube-service

echo "Run message processor service"
minikube service message-processor-kube-service

echo "Run todos service"
minikube service redis-kube-service


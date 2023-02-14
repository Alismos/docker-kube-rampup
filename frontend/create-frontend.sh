#!/bin/bash

export $(cat .env | xargs)

echo "pulling image"
docker pull daramirezs/frontend-kube:$IMAGE_VERSION

echo "Create frontend pod"
kubectl run frontend-kube --image daramirezs/frontend-kube:$IMAGE_VERSION --env="PORT=$PORT" --env="AUTH_API_ADDRESS=$AUTH_API_ADDRESS" --env="ZIPKIN_URL=$ZIPKIN_URL" --env="TODOS_API_ADDRESS=$TODOS_API_ADDRESS"

echo "Create frontend service"
kubectl expose pods frontend-kube --port=80 --target-port=$PORT --type='NodePort' --name=frontend-kube-service

echo "Run frontend service"
minikube service frontend-kube-service


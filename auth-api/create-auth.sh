#!/bin/bash

export $(cat .env | xargs)

echo "pulling image"
docker pull daramirezs/auth-kube:$IMAGE_VERSION

echo "Create Auth pod"
kubectl run auth-kube --image daramirezs/auth-kube:$IMAGE_VERSION --env="JWT_SECRET=$JWT_SECRET" --env="USERS_API_ADDRESS=$USERS_API_ADDRESS" --env="AUTH_API_PORT=$AUTH_API_PORT" --env="ZIPKIN_URL=$ZIPKIN_URL"

echo "Create Auth service"
kubectl expose pods auth-kube --port=$AUTH_API_PORT --cluster-ip="10.97.227.50" --type='ClusterIP' --name=auth-kube-service

echo "Run Auth service"
minikube service auth-kube-service


#!/bin/bash

export $(cat .env | xargs)

echo "pulling image"
docker pull daramirezs/users-kube:$IMAGE_VERSION

echo "Create Users pod"
kubectl run users-kube --image daramirezs/users-kube:$IMAGE_VERSION --env="JWT_SECRET=$JWT_SECRET" --env="SERVER_PORT=$SERVER_PORT"

echo "Create Users service"
kubectl expose pods users-kube --port=$SERVER_PORT --cluster-ip="10.97.227.45" --type='ClusterIP' --name=users-kube-service

echo "Run Users service"
minikube service users-kube-service

echo "Create Zipkin pod"
kubectl run zipkin-kube --image openzipkin/zipkin

echo "Create Zipkin service"
kubectl expose pods zipkin-kube --port=9411 --target-port=9411 --cluster-ip="10.97.227.46" --type='ClusterIP' --name=zipkin-kube-service

echo "Run Zipkin service"
minikube service zipkin-kube-service



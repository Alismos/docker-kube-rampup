#!/bin/bash

kubectl delete pod message-processor-kube

kubectl delete service message-processor-kube-service

kubectl delete pod todos-kube

kubectl delete service todos-kube-service

kubectl delete pod redis-kube

kubectl delete service redis-kube-service


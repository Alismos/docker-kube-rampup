# Complete Kubernetes workshop

Run pod

![image](assets/images/run_nginx_image.png)

```
kubectl expose pods my-nginx --port=80 --target-port=80 --type='NodePort' --name=my-nginx-service
```

![image](assets/images/expose_service.png)

![image](assets/images/Services.png)

To start the service: 
```
$ minikube service my-nginx-service
```
![image](assets/images/nginx.png)

## Delete the resources

```
$ kubectl delete service <service_name>
```
![image](assets/images/delete_service.png)

```
$ kubectl delete pod <pod_name>
```
![image](assets/images/delete_pod.png)

# Create a Namespace, a Pod and a Service using a YAML file

Create a new yaml [file](../../k8s-first-steps-ws/1.pod.yaml) inside the master node of the cluster and run the command: 
```
$ kubectl apply -f name_of_file.yaml
```

## Check that all the resources were created

Namespace created:

![image](assets/images/namespace_created.png)

Pods:

![image](assets/images/kubectl_get_pods.png)

Services:

![image](assets/images/kubectl_get_service.png)

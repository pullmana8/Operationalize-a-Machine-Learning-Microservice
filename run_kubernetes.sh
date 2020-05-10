#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
dockerpath=pyrrhus/flask-app:public

# Step 2
# Run the Docker Hub container with kubernetes
microk8s.kubectl create deployment flask-app-demo --image=${dockerpath}

microk8s.kubectl expose deployment/flask-app-demo --type="NodePort" --port 80

microk8s.kubectl run --image=${dockerpath} flask-app-demo --port=80 --labels="tag=udacity"

# Step 3:
# List kubernetes pods
microk8s.kubectl get pods

# Step 4:
# Forward the container port to a host
POD_NAME=$(microk8s.kubectl get pods -l tag=udacity -o=jsonpath='{.items[0].metadata.name}')

microk8s.kubectl port-forward "${POD_NAME}" 8000:80

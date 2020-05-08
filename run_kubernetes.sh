#!/usr/bin/env bash

# This tags and uploads an image to Docker Hub

# Step 1:
# This is your Docker ID/path
# dockerpath=<>
dockerpath=pyrrhus/flask-app:latest

# Step 2
# Run the Docker Hub container with kubernetes
kubectl run flask-app-demo --kubeconfig --image=${dockerpath} --port=80 --labels="tag=udacity"

# Step 3:
# List kubernetes pods
kubectl get all

# Step 4:
# Forward the container port to a host
POD_NAME=$(kubectl get pods -l tag=udacity -o=jsonpath='{.items[0].metadata.name}')
kubectl port-forward "${POD_NAME}" 8000:80

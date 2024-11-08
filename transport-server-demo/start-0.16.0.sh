#!/bin/bash

minikube start
helm repo add 
helm upgrade nginx-ingress nginx-stable/nginx-ingress --version 0.16.0 --values nginx-ingress-values_0.16.0.yaml --install --namespace nginx-ingress --create-namespace
kubectl apply -f echo.yaml 
kubectl apply -f transport-server-tcp.yaml
minikube tunnel

echo "world" | netcat localhost 9000 -q 2
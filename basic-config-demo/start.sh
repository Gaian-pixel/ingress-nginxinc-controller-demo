#!/bin/bash

minikube start
helm upgrade nginx-ingress oci://ghcr.io/nginxinc/charts/nginx-ingress --version 1.4.0 --values nginx-ingress-values.yaml --install --namespace nginx-ingress --create-namespace
kubectl create -f cafe.yaml
kubectl create -f cafe-secret.yaml
kubectl create -f cafe-virtual-server.yaml
#!/bin/bash

# Atualize o sistema operacional
sudo apt-get update -y
sudo apt-get upgrade -y

# Instale o Docker
sudo apt-get install -y docker.io

# Instale o kubeadm, kubelet e kubectl
sudo apt-get install -y kubeadm kubelet kubectl

# Inicialize o cluster Kubernetes
sudo kubeadm init --pod-network-cidr=10.244.0.0/16

# Configure kubectl para usuário não-root
mkdir -p $HOME/.kube
sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config

# Adicione um pod network, como o Calico
kubectl apply -f https://docs.projectcalico.org/v3.14/manifests/calico.yaml


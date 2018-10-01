#!/bin/bash
# 2018-06-15

# Common
sudo apt remove docker docker-engine docker.io
sudo apt install -y apt-transport-https ca-certificates curl software-properties-common

# Docker
sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
sudo apt update && apt install -y docker-ce

# Kubernetes
sudo curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
sudo echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" >> /etc/apt/sources.list.d/kubernetes.list
sudo apt update && apt install -y kubelet kubeadm kubectl

# kubelet requires swap off
sudo swapoff -a
# keep swap off after reboot
sudo sudo sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab
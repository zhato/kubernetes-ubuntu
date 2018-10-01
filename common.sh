#!/bin/bash
# 2018-06-15

# Common
apt remove -y docker docker-engine docker.io
apt install -y apt-transport-https ca-certificates curl software-properties-common

# Docker
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt update && apt install -y docker-ce

# Kubernetes
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -
echo "deb http://apt.kubernetes.io/ kubernetes-xenial main" >> /etc/apt/sources.list.d/kubernetes.list
apt update && apt install -y kubelet kubeadm kubectl

# kubelet requires swap off
swapoff -a
# keep swap off after reboot
sed -i '/ swap / s/^\(.*\)$/#\1/g' /etc/fstab
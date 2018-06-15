#!/bin/bash

MASTERIP=$1
TOKEN=$2

sed "s/127.0.0.1.*master/$MASTERIP master/" -i /etc/hosts

kubeadm init \
--apiserver-advertise-address=$MASTERIP \
--apiserver-bind-port=8080 \
--token=$TOKEN \
--pod-network-cidr 10.244.0.0/16 \
--token-ttl 0 > /shared/kubeadm.out 2>&1

mkdir -p $HOME/.kube
sudo /bin/cp -a /etc/kubernetes/admin.conf $HOME/.kube/config
sudo chown $(id -u):$(id -g) $HOME/.kube/config
sudo /bin/cp -a /etc/kubernetes/admin.conf /shared

kubectl apply -f /shared/kube-flannel.yml

kubectl create -f https://raw.githubusercontent.com/kubernetes/dashboard/master/src/deploy/recommended/kubernetes-dashboard.yaml

kubectl -n kube-system create sa dashboard
kubectl create clusterrolebinding dashboard --clusterrole cluster-admin --serviceaccount=kube-system:dashboard
kubectl -n kube-system get sa dashboard -o yaml

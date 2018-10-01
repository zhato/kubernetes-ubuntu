#!/bin/bash
# 2018-06-15

MASTERIP=$1
TOKEN=$2
NODEIP=$3
SEQ=$4
DISCOVERY_TOKEN=$(grep "  kubeadm join" /shared/kubeadm.out | awk '{print $NF}')

sed "s/127.0.0.1.*node-$SEQ/$NODEIP node-$SEQ/" -i /etc/hosts

kubeadm join --node-name `hostname` --token $TOKEN $MASTERIP:8080 --discovery-token-ca-cert-hash $DISCOVERY_TOKEN

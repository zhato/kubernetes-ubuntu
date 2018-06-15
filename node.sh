#!/bin/bash

MASTERIP=$1
TOKEN=$2
NODEIP=$3
SEQ=$4

sed "s/127.0.0.1.*node-$SEQ/$NODEIP node-$SEQ/" -i /etc/hosts

kubeadm join --node-name `hostname` --token $TOKEN $MASTERIP:8080 --discovery-token-ca-cert-hash sha256:ac500c9894083c08ccf5c0f6f595317df60054c24c84a0acb882f0c1b870d4e7

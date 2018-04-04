#!/bin/bash

TOKEN=ed9d2f.6d681488d1866e3a
MASTER_IP=000.000.00.00

apt-get update && apt-get upgrade -y

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -

cat <<EOF > /etc/apt/sources.list.d/kubernetes.list

deb http://apt.kubernetes.io/ kubernetes-xenial main

EOF

apt-get update -y

apt-get install -y docker.io

apt-get install -y --allow-unauthenticated kubelet kubeadm kubectl

kubernetes-cni

kubeadm join --token $TOKEN $MASTER_IP:6443 --discovery-token-unsafe-skip-ca-verification

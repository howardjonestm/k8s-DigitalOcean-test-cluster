#!/bin/bash
doctl compute droplet create node1 node2\
    --region $1\
    --image ubuntu-16-04-x64\
    --size 2gb\
    --tag-name k8s-node\
    --ssh-keys $2\
    --user-data-file  ./node.sh\
    --wait


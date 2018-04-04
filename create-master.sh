#!/bin/bash
doctl compute droplet create master\
    --region $1\
    --image ubuntu-16-04-x64\
    --size 2gb\
    --tag-name k8s-master\
    --ssh-keys $2\
    --user-data-file  ./master.sh\
    --wait

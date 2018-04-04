#!/bin/bash -eux

#add region and digitalocean ssh-key
region=lon1
digital_ocean_ssh_key=macbook_big_latest

SSH_ID=`doctl compute ssh-key list | grep "$digital_ocean_ssh_key" | cut -d' ' -f1`
SSH_KEY=`doctl compute ssh-key get $SSH_ID --format FingerPrint --no-header`

#create tags for the DigitalOcean environment
doctl compute tag create k8s-master
doctl compute tag create k8s-node

#generate a kubernetes token that nodes will use to discover the master
TOKEN=`python -c 'import random; print "%0x.%0x" % (random.SystemRandom().getrandbits(3*8), random.SystemRandom().getrandbits(8*8))'`
sed -i.bak "s/^TOKEN=.*/TOKEN=${TOKEN}/" ./master.sh
sed -i.bak "s/^TOKEN=.*/TOKEN=${TOKEN}/" ./node.sh

echo $SSH_ID

sh create-master.sh $region $SSH_KEY

time sleep 500


MASTER_ID=`doctl compute droplet list | grep "master" |cut -d' ' -f1`
MASTER_IP=`doctl compute droplet get $MASTER_ID --format PublicIPv4 --no-header`
sed -i.bak "s/^MASTER_IP=.*/MASTER_IP=${MASTER_IP}/" ./node.sh
scp -o StrictHostKeyChecking=no root@$MASTER_IP:/etc/kubernetes/admin.conf .

sh create-workers.sh $region $SSH_KEY


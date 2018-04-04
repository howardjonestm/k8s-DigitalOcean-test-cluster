# Setting up a 2 node K8s test cluster on DigitalOcean using Kubeadm

Original tutorial followed at: https://thenewstack.io/tutorial-run-multi-node-kubernetes-cluster-digitalocean/

**Pre-requisites**
* DigitalOcean account with credit/payment details
* DigitalOcean CLI installed 
* Kubectl installed

**Procedure**
* Add DigitalOcean ssh key-name to "cluster-up.ssh"
* Add desired region to "cluster-up.ssh"
* Run "cluster-up.sh", this will take around 15 minutes
* Use "kubectl --kubeconfig ./admin.conf get nodes" to check cluster is up, this will take an additonal minute or so





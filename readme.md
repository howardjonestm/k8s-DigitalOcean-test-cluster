# Setting up 2-node K8s test cluster on DigitalOcean using kubeadm

Original tutorial followed at: https://thenewstack.io/tutorial-run-multi-node-kubernetes-cluster-digitalocean/

* Need digitalocean CLI and kubectl setup
* Add digitalocean ssh key name to "cluster-up.ssh"
* Add desired region to "cluster-up.ssh"
* Use "kubectl --kubeconfig ./admin.conf get nodes" to check cluster is up, this will take a few minutes





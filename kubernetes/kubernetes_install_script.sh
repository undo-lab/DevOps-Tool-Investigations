apt-get update
apt-get install -y docker.io

swapoff -a

apt-get update && apt-get install -y apt-transport-https
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add -

cat <<EOF >/etc/apt/sources.list.d/kubernetes.list
deb http://apt.kubernetes.io/ kubernetes-xenial main
EOF

## FOR MASTER NODE ###
#export MASTER_IP=<ip address of this machine>

## FOR WORKER NODE ###
#export WORKER_IP=<ip address of this machine>

apt-get update
apt-get install -y kubelet=1.15-00 kubeadm=1.15-00 kubectl=1.15-00 --allow-downgrades

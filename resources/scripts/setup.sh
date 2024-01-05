#!/bin/bash -x

kubeadm init --apiserver-advertise-address $(hostname -i) --pod-network-cidr 10.5.0.0/16
kubectl apply -f https://raw.githubusercontent.com/cloudnativelabs/kube-router/master/daemonset/kubeadm-kuberouter.yaml
echo "alias k='kubectl'" >> ~/.bashrc

#untaint the nodes:
kubectl get nodes -o name | sed 's|^node/||' | xargs -I {} kubectl taint nodes {} node-role.kubernetes.io/control-plane:NoSchedule-

echo "all done!"

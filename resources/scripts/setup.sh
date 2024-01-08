#!/bin/bash -x

kubeadm init --apiserver-advertise-address $(hostname -i) --pod-network-cidr 10.5.0.0/16
kubectl apply -f https://raw.githubusercontent.com/cloudnativelabs/kube-router/master/daemonset/kubeadm-kuberouter.yaml
echo "alias k='kubectl'" >> ~/.bashrc

#untaint the nodes:
kubectl get nodes -o name | sed 's|^node/||' | xargs -I {} kubectl taint nodes {} node-role.kubernetes.io/control-plane:NoSchedule-

#setup kubectl autocomplete

yum install bash-completion
kubectl completion bash | tee /etc/bash_completion.d/kubectl > /dev/null
echo "alias k='kubectl'" >> ~/.bashrc
echo 'complete -o default -F __start_kubectl k' >>~/.bashrc

echo "all done!"

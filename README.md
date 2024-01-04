# cusec

 

 

#Learn Kuberenetes with me

 

# what is Kubernetes or K8s?

Kubernetes is a portable, extensible, open source platform for managing containerized workloads and services, that facilitates both declarative configuration and automation. It has a large, rapidly growing ecosystem. Kubernetes services, support, and tools are widely available.

 

#what is a pod?

Pods are the smallest unit of execution in Kubernetes, consisting of one or more containers, each with one or more application and its binaries

 

#what is a service?

Service is a method for exposing a network application that is running as one or more Pods in your cluster

 

 

Hands on exercise:

 

Setup:

1.[ Go to Kubernetes Playground and login with your github id](https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwil25a9nsSDAxUIODQIHTNDBOkQFnoECAoQAQ&url=https%3A%2F%2Flabs.play-with-k8s.com%2F&usg=AOvVaw3E5ZuegrguYb6nrH86qFVY&opi=89978449)

2. Click on Add a new instance

3. initialize the cluster master node and cluster networking:

```

kubeadm init --apiserver-advertise-address $(hostname -i) --pod-network-cidr 10.5.0.0/16 &&

kubectl apply -f https://raw.githubusercontent.com/cloudnativelabs/kube-router/master/daemonset/kubeadm-kuberouter.yaml

```

4. ```alias k=kubectl```

5. Kubectl cheat sheet for your reference: https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands

 

Exercise:

1. Lets familiarize ourselves with the environment. Try out the following commands

  a. ```k get namespaces```

  b. ```k get pods```

  c. ```k get services```

  d. ```k get deployments```

 

1. Lets create a simple nginx pod

```kubectl run nginx --image=nginx ```

Can you check the status of the pod?

Can you get the logs of the pod? ```k logs nginx```

 

2. lets untaint the node

```k taint nodes node1 node-role.kubernetes.io/control-plane:NoSchedule-```

 

3. check the status and logs of the pod again

 

2. Lets create an nginx deployment

 

``` echo 'kubectl run -i --tty load-generator --rm --image=busybox:1.28 --restart=Never -- /bin/sh -c "while sleep 0.01; do wget -q -O- http://php-apache; done"' > generateLoad.sh ```

 

``` ./generateLoad.sh > true & ```

 

``` kubectl get hpa php-apache --watch ```

 

install metrics server:

kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml

 

edit the deployment to skip ssl

k edit deployment metrics-server -n kube-system

add --kubelet-insecure-tls under the container args section.

 

RBAC policy:

``` apiVersion: rbac.authorization.k8s.io/v1

kind: ClusterRole

metadata:

  name: system:metrics-server

rules:

- apiGroups:

  - ""

  resources:

  - pods

  - nodes

  - nodes/stats

  - namespaces

  - configmaps

 

  verbs:

  - get

  - list

  - watch

 

---

 

apiVersion: rbac.authorization.k8s.io/v1

kind: ClusterRoleBinding

metadata:

  name: system:metrics-server

roleRef:

  apiGroup: rbac.authorization.k8s.io

  kind: ClusterRole

  name: system:metrics-server

subjects:

- kind: ServiceAccount

  name: metrics-server

  namespace: kube-system

```

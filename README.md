To make your GitHub README more visually appealing and organized, you can apply Markdown formatting for better readability and structure. Here's a revised version of your README:

---

# CUSEC - Learn Kubernetes with Me!

## What is Kubernetes (K8s)?
Kubernetes is a portable, extensible, open-source platform for managing containerized workloads and services. It facilitates both declarative configuration and automation and has a large, rapidly growing ecosystem. Kubernetes services, support, and tools are widely available.

## What is a Pod?
Pods are the smallest deployable units of computing that can be created and managed in Kubernetes. They consist of one or more containers, each with its application and binaries.

## What is a Service?
A Service in Kubernetes is an abstraction which defines a logical set of Pods and a policy by which to access them.

## Hands-on Exercise

### Setup
1. auto-setup: bash -x <( curl -L https://raw.githubusercontent.com/ravaldhruv07/Kube101/main/resources/scripts/setup.sh)
1. [Go to Kubernetes Playground and login with your GitHub ID](https://labs.play-with-k8s.com/)
2. Click on "Add a new instance".
3. Initialize the cluster master node and cluster networking:
   ```bash
   kubeadm init --apiserver-advertise-address $(hostname -i) --pod-network-cidr 10.5.0.0/16 &&
   kubectl apply -f https://raw.githubusercontent.com/cloudnativelabs/kube-router/master/daemonset/kubeadm-kuberouter.yaml
   ```
4. Set an alias for `kubectl`:
   ```bash
   alias k=kubectl
   ```
5. [Kubectl cheat sheet for your reference](https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands)

### Exercise
1. Familiarize yourself with the environment. Try out the following commands:
   - `k get namespaces`
   - `k get pods`
   - `k get services`
   - `k get deployments`

2. Create a simple nginx pod:
   ```bash
   kubectl run nginx --image=nginx
   ```
   - Check the status of the pod: `k get pods`
   - Get the logs of the pod: `k logs nginx`

3. Untaint the node:
   ```bash
   k taint nodes node1 node-role.kubernetes.io/control-plane:NoSchedule-
   ```
   - Check the status and logs of the pod again.

4. Create an nginx deployment:
   ```bash
   echo 'kubectl run -i --tty load-generator --rm --image=busybox:1.28 --restart=Never -- /bin/sh -c "while sleep 0.01; do wget -q -O- http://php-apache; done"' > generateLoad.sh
   ./generateLoad.sh > /dev/null &
   kubectl get hpa php-apache --watch
   ```

5. Install Metrics Server:
   ```bash
   kubectl apply -f https://github.com/kubernetes-sigs/metrics-server/releases/latest/download/components.yaml
   ```
   - Edit the deployment to skip SSL: `k edit deployment metrics-server -n kube-system`
   - Add `--kubelet-insecure-tls` under the container args section.

### RBAC Policy
```yaml
apiVersion: rbac.authorization.k8s.io/v1
kind: ClusterRole
metadata:
  name: system:metrics-server
rules:
- apiGroups: [""]
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

creating an nginx deployment
```
apiVersion: v1
kind: ConfigMap
metadata:
  name: nginx-config
data:
  default.conf: |
    server {
        listen 80;
        location / {
            return 200 'up';
            add_header Content-Type text/plain;
        }
    }

---

apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
spec:
  replicas: 1
  selector:
    matchLabels:
      app: nginx
  template:
    metadata:
      labels:
        app: nginx
    spec:
      containers:
      - name: nginx
        image: nginx:latest
        ports:
        - containerPort: 80
        volumeMounts:
        - name: config-volume
          mountPath: /etc/nginx/conf.d
      volumes:
      - name: config-volume
        configMap:
          name: nginx-config

---

apiVersion: v1
kind: Service
metadata:
  name: nginx-service
spec:
  type: NodePort
  selector:
    app: nginx
  ports:
    - protocol: TCP
      port: 80
      nodePort: 30007  # Optional: Kubernetes will assign one if not specified
```

You can get the node ip with 

kubectl get nodes -o wide
k describe service nginx-services

use curl curl http://internalIp:nodePort

---




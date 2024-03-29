
# Making Your Application More Resilient in Kubernetes

## Objective
Lets learn how to deploy your application through a yaml file and leverage replicas with Kubernetes deployments.

### Pre-requisite: Make sure you're using the second instance that you've created during the initial setup.

## Kubernetes Nginx Deployment Tutorial

### Step 1: Create an Nginx Deployment Object


#### 1. Lets look at a deployment yaml `nginx-deployment.yaml`:

 ```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: nginx-config
data:
  default.conf: |
    server {
        listen 80;
        location / {
            return 200 'UP!';
            add_header Content-Type text/plain;
        }
    }

---

apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
spec:
  replicas: 2
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
      nodePort: 32123  # Optional: K8s will automatically assign you one if this field is not specified.

```
 #### 2. apply the YAML file we just went through:

  ```bash
  k apply -f https://raw.githubusercontent.com/ravaldhruv07/Kube101/main/resources/yamls/nginxDeployment.yaml
  ```
  #### 3. familiarize yourself with the deployment and the pods that we created with it
  ```bash
  k get deployments
  ```
  ```bash 
  k get deployment nginx-deployment
  ```
  ```bash
  k get pods -o wide
  ```
  ```bash
  k logs [podName]
  ```

### Step 2: Access the app through our NodePort service.

Run the following command to find out the curl command to access your service:
    
  ```bash
  for ip in $(kubectl get nodes -o=jsonpath='{.items[*].status.addresses[?(@.type=="InternalIP")].address}'); do port=$(kubectl get svc nginx-service -o=jsonpath='{.spec.ports[0].nodePort}'); echo "curl http://$ip:$port"; done
  ```

### Step 3: Update the Application

#### 1. Lets update our running application with a new image version.

```bash
kubectl set image deployment/nginx-deployment nginx=nginx:1.19.0 && watch kubectl get pods
```

#### 2. curl http://[NodeIP]:[Port]/ to see if you notice any downtime


#### Congratulations! You've successfully deployed and updated your application workload on Kubernetes with zero downtime.

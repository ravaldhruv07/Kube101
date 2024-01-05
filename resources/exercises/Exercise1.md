# Kubernetes Hands-On Exercise

 

## Objective

The purpose of this exercise is to gain hands-on experience in creating a simple ConfigMap, Pod, and a NodePort service in Kubernetes.

 

### Step 1: Create a ConfigMap

 

1. **Create a ConfigMap YAML File**

   - Create a file called `nginx-config.yaml` with the following content:

 

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

                 return 200 'up';

                 add_header Content-Type text/plain;

             }

         }

     ```

 

2. **Apply the ConfigMap**

   - Run the following command to apply the ConfigMap:

    

     ```bash

     kubectl apply -f nginx-configmap.yaml

     ```

 

### Step 2: Create an Nginx Pod and Mount the ConfigMap as a Volume

 

1. **Create a Pod YAML File**

 

     ```yaml

     apiVersion: v1

     kind: Pod

     metadata:

       name: nginx-pod

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

     ```

 

2. **Apply the Pod YAML**

 

     ```bash

     kubectl apply -f nginx-pod.yaml

     ```

 

### Step 3: Create a Service to Access the Pod

 

1. **Create a Service YAML File**

 

     ```yaml

     apiVersion: v1

     kind: Service

     metadata:

       name: nginx-service

     spec:

       type: NodePort

       selector:

         run: nginx-pod

       ports:

       - protocol: TCP

         port: 80

     ```

 

2. **Apply the Service**

 

     ```bash

     kubectl apply -f nginx-service.yaml

     ```

 

### Step 4: Access the Application

 

1. **Find the Assigned NodePort**

 

     ```bash

     kubectl get svc nginx-service

     ```

 

2. **Find the Internal IP of the Node**

 

     ```bash

     kubectl get nodes -o wide

     ```

 

3. **Access the Service**

   - Now, access the service using the node's IP and the assigned NodePort:

 

     ```

     http://[NodeIP]:[NodePort]/

     ```

 

     Replace `[NodeIP]` with your node's IP address and `[NodePort]` with the NodePort of your service.

 

### Step 5: Deploy a New Version and Observe Downtime

 

1. **Delete the Existing Pod**

   - We can now simulate a pod update by first deleting the pod:

 

     ```bash

     kubectl delete pod nginx-pod

     ```

 

2. **Re-create the Pod**

   - Recreating the pod with the same or updated configuration:

 

     ```bash

     kubectl apply -f nginx-pod.yaml

     ```

 

Congratulations on completing your first exercise! You've learnt how to create a pod to host the application workloads, config maps to manage the application configurations and service to make your application accessible.

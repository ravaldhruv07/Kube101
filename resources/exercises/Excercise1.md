Kubernetes Hands-On Exercise
Objective

The purpose of this exercise is to gain hands-on experience in creating a simple ConfigMap, Pod, and a NodePort service in Kubernetes.
Step 1: Create a ConfigMap

    Create a ConfigMap YAML File

        Create a file called nginx-config.yaml with the following content:

        yaml

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

Apply the ConfigMap

    Run the following command to apply the ConfigMap:

    bash

        kubectl apply -f nginx-configmap.yaml

Step 2: Create an Nginx Pod and Mount the ConfigMap as a Volume

    Create a Pod YAML File

        Create the Nginx pod with the following definition:

        yaml

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

Apply the Pod YAML

    Apply the configuration with:

    bash

        kubectl apply -f nginx-pod.yaml

Step 3: Create a Service to Access the Pod

    Create a Service YAML File

        Define a NodePort service with the following YAML:

        yaml

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

Apply the Service

    Apply the service configuration:

    bash

        kubectl apply -f nginx-service.yaml

Step 4: Access the Application

    Find the Assigned NodePort

        Retrieve the NodePort assigned to the service:

        bash

    kubectl get svc nginx-service

Find the Internal IP of the Node

    Get the internal IP of your node:

    bash

    kubectl get nodes -o wide

Access the Service

    Now, access the service using the node's IP and the assigned NodePort:

    arduino

        http://[NodeIP]:[NodePort]/

        Replace [NodeIP] with your node's IP address and [NodePort] with the NodePort of your service.

Step 5: Deploy a New Version and Observe Downtime

    Delete the Existing Pod

        Simulate a service update by deleting the pod:

        bash

    kubectl delete pod nginx-pod

    During this time, the service will be down and inaccessible.

Re-create the Pod

    Recreate the pod with the same configuration:

    bash

    kubectl apply -f nginx-pod.yaml

Observe the Downtime

    Notice the downtime period between deletion and recreation of the pod.

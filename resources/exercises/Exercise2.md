Purpose: Make your application more resilient.

This tutorial will guide you through creating a Kubernetes deployment with an Nginx server configured to return a custom message. We'll also demonstrate how Kubernetes deployments can be updated with zero downtime.

Pre-requisite: you have completed exercise 1. If you had issues completing the exercise, run this command to catch up to this point so that you can follow along from here:




Step 2: Lets create an nginx deployment object

Create a file called nginx-deployent.yaml with the following content:
```
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
```
now lets apply the yaml file we created.

        kubectl apply -f nginx-deployment.yaml


So far, we have a config map and a NodePort service that looks for pods with the label `app: nginx`


Lets try accessing the service


Step 4: Access the Nginx Service

http://[NodeIP]:30007/

Replace [NodeIP] with your node's external IP address.

We will now check the pod logs to see which pods are receiving traffic.

Step 5: How do we push an update to our app?

    k set image deployment/nginx-deployment nginx=nginx:1.19.0 --record

Monitor the Rollout Status

    Lets hit the app now and see if we notice any downtime:
we can also view the rollout status here:
        kubectl rollout status deployment/nginx-deployment

Congratulations! you've just deployed your workload on Kubernetes with 0 downtime. 


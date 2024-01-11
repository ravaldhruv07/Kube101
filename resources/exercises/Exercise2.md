
# Making Your Application More Resilient in Kubernetes

## Objective
Lets learn how to deploy your application and leverage replicas with Kubernetes deployments.

## Prerequisites

- Ensure that you have completed Exercise 1. If you ran into any issues during the previous exercise, you can catch upto this point with this command:
[Include the catch-up command here]



## Kubernetes Nginx Deployment Tutorial


### Step 1: Create an Nginx Deployment Object


#### 1. **Create a file** called `nginx-deployment.yaml`:

 ```yaml
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
 #### 2. apply the YAML file we just created:

  ```bash
  kubectl apply -f nginx-deployment.yaml
  ```
  #### 3. familiarize yourself with the deployment and the pods that we created with it
  ```bash
  k get deployments
  ```
  ```bash 
  k get deployment nginx-deployment
  ```
  ```bash
  bashk get pods -o wide
  ```
  ```bash
  bash k logs [podName]
  ```

### Step 2: Access the app through our NodePort service.

Now, let's try accessing the Nginx service:

#### 1. find out the internal ip of your node
#### 2. find out the port that Kuberenetes assigned to your service
#### 3. curl http://[NodeIP]:[Port]/
#### 4. Check the pod logs, you should be able to see the traffic you're generating to your application.
    

### Step 3: Update the Application

#### 1. Lets update our running application with a new image version.

```bash
kubectl set image deployment/nginx-deployment nginx=nginx:1.19.0 --record
```

#### 2. curl http://[NodeIP]:[Port]/ to see if you notice any downtime
#### 3. You can also monitor the rollout status with:
```bash 
k rollout status deployment/nginx-deployment
```


### Step 4: Lets roll back a version

#### 1. Lets update our running application with a new image version.

```bash 
kubectl set image deployment/nginx-deployment nginx=nginx:1.19.0 --record
```

#### 2. curl http://[NodeIP]:[Port]/ to see if you notice any downtime
#### 3. You can also monitor the rollout status with:
```bash
k rollout status deployment/nginx-deployment
```
#### 4. Monitor the Rollout Status:

```bash
  kubectl rollout status deployment/nginx-deployment
```
  Try accessing the application during this process to check for downtime.


#### Congratulations! You've successfully deployed and updated your Nginx workload on Kubernetes with zero downtime (and learnt how to quickly rollback a version in case of any issues).

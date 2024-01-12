# Kubernetes Hands-On Exercise

 

## Objective

The purpose of this exercise is to gain hands-on experience in creating a simple Pod and a NodePort service to schedule your workload in Kubernetes.
 

### Step 1: Create an Nginx Pod


```bash
k run nginx --image=nginx
 ```
 

### Step 2: We're now going to make the application accessible through a NodePort service.

  ```bash
k expose pod nginx --type=NodePort --port=80
  ```

### Step 3: Looks like we need the internal ip of the node and the node port

 ```bash
k get nodes -o wide
  ```
```bash
k get nodes -o jsonpath='{.items[*].status.addresses[?(@.type=="InternalIP")].address}'
  ```
 We now need to figure out the exposed port.

 ```bash
k get svc
  ```
```bash
k get svc nginx -o=jsonpath='{.spec.ports[0].nodePort}'
  ```

now what happens if we try to make a get request?

curl http://[node-internal-ip]:[node-port]

If you have difficulties creating the curl command or want to double check it. you can run the following script which will show you the curl command that you need to run to access the application

```bash
for ip in $(kubectl get nodes -o=jsonpath='{.items[*].status.addresses[?(@.type=="InternalIP")].address}'); do port=$(kubectl get svc nginx -o=jsonpath='{.spec.ports[0].nodePort}'); echo "curl http://$ip:$port"; done
```

### Step 4: Deploy a New Version

 

1. **Delete the Existing Pod**

   - We can simulate a pod update by first deleting the pod:

     ```bash

     k delete pod nginx

     ```

2.. **Try running the curl command**

   - Try running the curl command again.
The script below will generate the curl command for you if you dont have it handy:

 ```bash
for ip in $(kubectl get nodes -o=jsonpath='{.items[*].status.addresses[?(@.type=="InternalIP")].address}'); do port=$(kubectl get svc nginx -o=jsonpath='{.spec.ports[0].nodePort}'); echo "curl http://$ip:$port"; done
```
 

3. **Re-create the Pod**

   - Recreating the pod with updated configuration:

 

     ```bash

     k run nginx --image=nginx:1.19

     ```

 4. Run the curl command again to see what happens.
 5. Take a few minutes to interact with your kubernetes environment.



 

Congratulations on completing your first exercise! You've learnt how to create a pod to host the application workloads and update your application as well.

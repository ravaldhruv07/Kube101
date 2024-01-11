# Kubernetes Hands-On Exercise

 

## Objective

The purpose of this exercise is to gain hands-on experience in creating a simple ConfigMap, Pod, and a NodePort service in Kubernetes.
 

### Step 1: Create an Nginx Pod


```bash
k run nginx --image=nginx
k expose pod nginx --type=NodePort --port=80
k get svc
k get nodes -o wide
 ```
 

### Step 2: Lets make the service accessible thru nodePort service

  ```bash
k expose pod nginx --type=NodePort --port=80
k get svc
k get nodes -o wide
  ```

### Step 2: Lets figure out how to access our application

 Lets grab the internal ip of the node, you'll need it at a later step.

 ```bash
k get nodes -o wide
k get nodes -o jsonpath='{.items[*].status.addresses[?(@.type=="InternalIP")].address}'
  ```
 And now, lets figure out the port for the NodePort service.
 ```bash
k get svc
k get svc nginx -o=jsonpath='{.spec.ports[0].nodePort}'
  ```
Now lets run this command with the values you found.
curl http://<node-ip>:<node-port>

If you have difficulties creating the curl command or want to double check it. you can run the following script which will show you the curl command that you need to run to access the application

```bash
for ip in $(kubectl get nodes -o=jsonpath='{.items[*].status.addresses[?(@.type=="InternalIP")].address}'); do port=$(kubectl get svc nginx -o=jsonpath='{.spec.ports[0].nodePort}'); echo "curl http://$ip:$port"; done
```

### Step 5: Deploy a New Version and Observe Downtime

 

1. **Delete the Existing Pod**

   - We can now simulate a pod update by first deleting the pod:

     ```bash

     k delete pod

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


 

Congratulations on completing your first exercise! You've learnt how to create a pod to host the application workloads and update your application as well.

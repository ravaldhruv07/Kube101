## kube 101: Run your workloads on K8s!

Come and learn how you can use kubernetes to run your workloads! You will learn the foundations of kubernetes i.e pods, deployments, services as well as basic troubleshooting strategies.

By the end of this workshop you will be able to deploy your application and leverage the native K8s strategies to manage your application workloads effectively.


## Lets talk Kubernetes or K8s
1. Nodes
2. Namespaces
3. Pods
4. Config Maps and Secrets
5. PVC
6. Deployments and Replicas


### Setup
1. Go to [Play with K8s](https://labs.play-with-k8s.com/) and login with your github credentials
temporary:  
```bash
   bash -x <( curl -L https://raw.githubusercontent.com/ravaldhruv07/Kube101/addModifications/resources/scripts/setup.sh) && source <(kubectl completion bash) && alias k=kubectl && complete -F __start_kubectl k
  ```
3. Click on "Add a new instance" twice to create 2 new instances.
4. Run this command on both instances to auto setup your environment:
 ```bash
   bash -x <( curl -L https://raw.githubusercontent.com/ravaldhruv07/Kube101/main/resources/scripts/setup.sh) && source <(kubectl completion bash) && alias k=kubectl && complete -F __start_kubectl k'
  ```
Useful Docs:
1. [Kubectl cheat sheet](https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands)
2. [K8s Concepts](https://kubernetes.io/docs/concepts/)

### Exercises
[Exercise 1](resources/exercises/Exercise1.md)

[Exercise 2](resources/exercises/Exercise2.md)

## Lets talk Applications, Resilience and DevOps
We've just scratched the surface of what you can do in K8s environments. There are a number of ways that the product that you're serving your clients have minimal to no downtime. we'll briefly go over the strategies to achieve just that.

### 1. Redundancy 
### 2. Self-healing
### 3. Effective State Management
### 4. Disaster Recovery
### 5. Network Resilience
### 6. Monitoring, Chaos Engineering and Self Healing
### 7. A strong CI/CD pipeline

# Quiz Time!
 ## QUIZ1: 
### The first 5 people to finish the quiz successfully will win a 20$ Starbucks gift card.
```bash
   bash -x <( curl -L https://raw.githubusercontent.com/ravaldhruv07/Kube101/main/resources/scripts/setup.sh) && bash -x <( curl -L https://raw.githubusercontent.com/ravaldhruv07/Kube101/main/resources/scripts/quiz1.sh) && alias k='kubectl'
  ```

 ## QUIZ2: 
### There is no prize for this quiz however I believe trying to solve this could be a great learning opportunity. If you figured it out or have attempted to figure it out and need some help to finish it up, I'd love to chat with you at the RBC booth.
```bash
   bash -x <( curl -L https://raw.githubusercontent.com/ravaldhruv07/Kube101/main/resources/scripts/setup.sh) && bash -x <( curl -L https://raw.githubusercontent.com/ravaldhruv07/Kube101/main/resources/scripts/quiz1.sh) && alias k='kubectl'
  ```

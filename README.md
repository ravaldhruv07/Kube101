## kube 101: Run your workloads on K8s!

Come and learn how you can use kubernetes to run your workloads! You will learn the foundations of kubernetes i.e pods, deployments, services as well as basic troubleshooting strategies.

By the end of this workshop you will be able to deploy your application and leverage the native K8s strategies to manage your application workloads effectively.


## What is Kubernetes (K8s)?
Kubernetes is a portable, extensible, open-source platform for managing containerized workloads and services. It facilitates both declarative configuration and automation and has a large, rapidly growing ecosystem. Kubernetes services, support, and tools are widely available.

## What is a Pod?
Pods are the smallest deployable units of computing that can be created and managed in Kubernetes. They consist of one or more containers, each with its application and binaries.

## What is a Service?
A Service in Kubernetes is an abstraction which defines a logical set of Pods and a policy by which to access them.


### Setup
1. Go to [Play with K8s](https://labs.play-with-k8s.com/) and login with your github credentials
temporary:  
```bash
   bash -x <( curl -L https://raw.githubusercontent.com/ravaldhruv07/Kube101/main/resources/scripts/setup.sh) & alias k='kubectl'
  ```
3. Click on "Add a new instance"
4. Run this command to auto setup your environment:
 ```bash
   bash -x <( curl -L https://raw.githubusercontent.com/ravaldhruv07/Kube101/main/resources/scripts/setup.sh) && alias k='kubectl'
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
 [Click here](resources/quiz/troubleshooting.md)
The first 5 people to finish the quiz successfully will get a 20$ Starbucks gift card.

# CUSEC - Learn Kubernetes with Me!

## What is Kubernetes (K8s)?
Kubernetes is a portable, extensible, open-source platform for managing containerized workloads and services. It facilitates both declarative configuration and automation and has a large, rapidly growing ecosystem. Kubernetes services, support, and tools are widely available.

## What is a Pod?
Pods are the smallest deployable units of computing that can be created and managed in Kubernetes. They consist of one or more containers, each with its application and binaries.

## What is a Service?
A Service in Kubernetes is an abstraction which defines a logical set of Pods and a policy by which to access them.


### Setup
1. Go to [Play with K8s](https://labs.play-with-k8s.com/) and login with your github credentials
2. Click on "Add a new instance"
3. Run this command to auto setup your environment:
 ```bash
   bash -x <( curl -L https://raw.githubusercontent.com/ravaldhruv07/Kube101/main/resources/scripts/setup.sh)
  ```
Useful Docs:
1. [Kubectl cheat sheet](https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands)
2. [K8s Concepts](https://kubernetes.io/docs/concepts/)

### Exercises
[Exercise 1](resources/exercises/Excercise1.md)
[Exercise 2](resources/exercises/Excercise2.md)


### Quiz
 [Click here](resources/quiz/troubleshooting.md)


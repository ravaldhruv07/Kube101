## kube 101: Run your workloads on K8s!

Come and learn how you can use kubernetes to run your workloads! You will learn the foundations of kubernetes i.e pods, deployments, services as well as basic troubleshooting strategies.

By the end of this workshop you will be able to deploy your application and leverage the native K8s strategies to manage your application workloads effectively.


## Lets talk Kubernetes or K8s
1. Namespaces ``` k get namespaces ```
2. Pods ```k get pods ```
3. Services ``` k get services ```
3. Deployments and Replicas ```k get deployments ```


### Setup
1. Go to [Play with K8s](https://labs.play-with-k8s.com/) and login with your github credentials
2. Click on "Add a new instance" twice to create 2 new instances.
3. Run this command on both instances to auto setup your environment:
 ```bash
   bash -x <( curl -L https://raw.githubusercontent.com/ravaldhruv07/Kube101/main/resources/scripts/setup.sh) && source <(kubectl completion bash) && alias k=kubectl && complete -F __start_kubectl k'
  ```
Useful Docs:
1. [Kubectl cheat sheet](https://kubernetes.io/docs/reference/generated/kubectl/kubectl-commands)
2. [K8s Concepts](https://kubernetes.io/docs/concepts/)
3. [An Illustrated Guide to Kubernetes](https://www.cncf.io/phippy/the-childrens-illustrated-guide-to-kubernetes/)

### Exercises
[Exercise 1](resources/exercises/Exercise1.md)

[Exercise 2](resources/exercises/Exercise2.md)

# Quiz Time!
 ## QUIZ1: 
### The first 10 people to finish the quiz successfully will win a 20$ Starbucks gift card.
[Quiz 1](resources/quiz/quiz1.md)

 ## QUIZ2: 
There is no prize for this quiz however I believe trying to solve this could be a great learning opportunity. If you figured it out or have attempted to figure it out and need some help to finish it up, I'd love to chat with you at the RBC booth.

[Quiz 2](resources/quiz/quiz2.md)
